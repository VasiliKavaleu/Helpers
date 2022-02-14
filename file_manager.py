import csv
import io
from abc import ABC, abstractmethod
from enum import Enum, auto
from typing import Tuple, Any

from openpyxl import Workbook

OUTPUT_FILE_NAME = "export"


class OutputFormat(Enum):
    CSV = auto()
    XLS = auto()


class BaseOutFormatManager(ABC):
    """Adapter to output format"""

    @abstractmethod
    def save(self):
        """Save all data in memory"""

    @abstractmethod
    def write(self, row: list):
        """Write row"""

    @abstractmethod
    def clear(self):
        """Clear buffer"""


class XLSManager(BaseOutFormatManager):
    MIMETYPE = 'application/vnd.ms-excel'
    FILE_NAME = OUTPUT_FILE_NAME + '.xls'

    def __init__(self):
        self.memory_buffer = io.BytesIO()
        self.workbook = Workbook()
        self.worksheet = self.workbook.active

    def save(self):
        self.workbook.save(self.memory_buffer)

    def write(self, row: list):
        self.worksheet.append(row)

    def clear(self):
        self.memory_buffer.seek(0)


class CSVManager(BaseOutFormatManager):
    MIMETYPE = 'text/csv'
    FILE_NAME = OUTPUT_FILE_NAME + '.csv'

    def __init__(self):
        self.memory_buffer = io.StringIO()
        self.writer = csv.writer(self.memory_buffer)

    def save(self):
        pass

    def write(self, row: list):
        self.writer.writerow(row)

    def clear(self):
        self.memory_buffer.seek(0)


class OutputFileManager:
    def __init__(self):
        self.format_strategy = None

    @property
    def data(self):
        return self.format_strategy.memory_buffer

    @property
    def mimetype(self):
        return self.format_strategy.MIMETYPE

    @property
    def file_name(self):
        return self.format_strategy.FILE_NAME

    def set_output_format(self, output_format):
        if output_format == OutputFormat.CSV:
            self.format_strategy = CSVManager()
        elif output_format == OutputFormat.XLS:
            self.format_strategy = XLSManager()

    def write(self, row: list):
        self.format_strategy.write(row)

    def save(self):
        self.format_strategy.save()

    def clear_buffer(self):
        self.format_strategy.clear()


class FileResponseAdapter:
    @staticmethod
    def get_table_data(table_data: dict, output_format: OutputFormat) -> Tuple[Any, Any, Any]:
        fm = OutputFileManager()
        fm.set_output_format(output_format)

        if table_data:
            if headers := table_data.get("headers"):
                fm.write(headers)
            if rows_payload := table_data.get("data"):
                for row in rows_payload:
                    fm.write(row)

        fm.save()
        fm.clear_buffer()
        return fm.data, fm.mimetype, fm.file_name
