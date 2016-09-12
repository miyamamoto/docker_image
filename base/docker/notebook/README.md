# smly/notebook
# modified by mitsuo yamamoto.

## Usage

```
$ docker run --rm -ti \
  -p 8888:8888 \
  --user mlkeiba \
  -v /home/miyamamoto/work:/home/mlkeiba/work \
  miyamamoto/mlkeiba
```

## Composed Softwares

* ubuntu 16.04 (Linux 4.4)
* opencv 3.1.0 + opencv contrib
* anaconda
* xgboost == 0.60, libFM, RGF
