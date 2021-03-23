# Build and usage

```
docker build -t terraform-aws .
docker run --rm -it -v `pwd -W`:/data terraform-aws
```

# Create remote dev setup

```
source up.sh
```

# Destroy remote dev setup

```
source down.sh
```
