# ServerlessElixirDemo

## build用コンテナイメージのビルド

edit:

https://github.com/alertlogic/erllambda\_docker/blob/master/elixir/Dockerfile#L1

https://github.com/alertlogic/erllambda\_docker/blob/master/elixir/Dockerfile#L3

```
$ git clone https://github.com/alertlogic/erllambda_docker.git
$ docker build -t erllambda:21 erllambda_docker/21
$ docker build -t erllambda:21-elixir erllambda_docker/elixir
```

## demo

### step.0
```
mix deps.get
docker run -it --rm -v `pwd`:/buildroot -w /buildroot -e MIX_ENV=prod erllambda:21-elixir mix erllambda.release
```

### step.1
make s3 bucket: YOUR-BUCKET

### step.2 packaging
```
aws cloudformation package --template-file etc/template.yaml --output-template-file packaged.yaml --s3-bucket <YOUR-BUCKET>
```

# step.3 deploy
```
aws cloudformation deploy --capabilities CAPABILITY_IAM --template-file packaged.yaml --stack-name <YOUR-STACK>
```

# step.4 desc stack
```
aws cloudformation describe-stacks --stack-name <YOUR-STACK> --query 'Stacks[].Outputs'
```

```
export APIENDP=<SET-YOUR-ENDPOINT>
```

# step.5 create item
```
curl -X POST "$APIENDP?id=foo&bar=quz"
```

# step.6 get item
```
curl $APIENDP
```

# step.7 delete item
```
curl -X DELETE "$APIENDP?id=foo"
```

# step.8 delete stack
```
aws cloudformation delete-stack --stack-name <YOUR-STACK>
```
