#!/bin/bash

exec /bin/bash -c "source activate py35 && THEANO_FLAGS=mode=FAST_RUN,device=gpu0,floatX=float32 jupyter notebook"
