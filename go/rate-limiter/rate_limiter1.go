package main

import (
	"context"
	"fmt"
	"strconv"
	"sync"

	"github.com/sirupsen/logrus"
)

type Request struct {
	Payload string
}

type Client interface {
	SendRequest(ctx context.Context, request Request) error
}

type client struct {
}

func (c client) SendRequest(ctx context.Context, request Request) error {
	fmt.Println("send request", request.Payload)
	return nil
}

func main() {
	ctx := context.Background()
	c := client{}
	requests := make([]Request, 100)
	for i := 0; i < 100; i++ {
		requests[i] = Request{Payload: strconv.Itoa(i)}
	}
	log := logrus.New()
	makeBatchApiCalls(ctx, c, log, requests)
}

func makeBatchApiCalls(ctx context.Context, c Client, log *logrus.Logger, requests []Request) {
	wg := sync.WaitGroup{}
        rateLimiter := NewRateLimiter(1000)
	for _, r := range requests {
		r := r
		wg.Add(1)
		go func() {
			defer wg.Done()
      rateLimiter.allow()
			err := c.SendRequest(ctx, r)
			if err != nil {
				log.WithError(err).Error("send request")
			}
		}()
	}
	wg.Wait()
}

type RateLimiter struct {
  ch *time.Ticker
}

func (r *RateLimiter) allow() {
  <- r.ch.C
}

func NewRateLimiter(rps int) *RateLimiter {
  interval := time.Second / time.Duration(rps)

  ch := time.NewTicker(interval)
  return &RateLimiter{
    ch:ch
  }
}
