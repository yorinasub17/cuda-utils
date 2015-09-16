// Copyright 2014, Yoriyasu Yano
// All rights reserved.
//
// Author: yoriy@captricity.com
//
// Observe memory
//
// A utility program that checks GPU memory usage every second and outputs the
// results, until an interrupt signal is received.

#include <stdio.h>
#include <signal.h>
#include <unistd.h>

#include "cuda_utils.h"

static bool keepRunning = true;

void intHandler(int dummy=0) {
  keepRunning = false;
}


int main() {

  signal(SIGINT, intHandler);

  while (keepRunning) {
      checkMemory();
      sleep(1);
  }
  return 0;
}
