# Golang with Dep package manager tool
This is an unofficial Docker image buit on Official Golang Docker image by installing Dep package manager using the official installation script.

Automated builds to keep updting with the newest versions!

## How to use

### Docker CLI

```
docker run -v $PWD:/go/src/<package-name> -w /go/src/<package-name>  leopardslab/go-dep <dep-command>
```

Eg:

```
docker run -v $PWD:/go/src/app -w /go/src/app leopardslab/go-dep init
```

### Docker Compose

```
<service-name>:
  image: leopardslab/go-dep
  command: <dep-command>
  volumes:
    - $PWD:/go/src/<package-name>
  working_dir: /go/src/<package-name>
```
Then run with 
```
docker-compose run <service-name>
```
  
  Eg:
```
dep-ensure:
  image: leopardslab/go-dep
  command: ensure
  volumes:
    - $PWD:/go/src/app
  working_dir: /go/src/app
```
```
docker-compose run dep-ensure
```

### Dunner

```
<task-name>:
  - image: leopardslab/go-dep
    dir: /go/src/<package-name>
    envs:
      - GOPATH=/dunner/go
    mounts:
    - .:/dunner/go/src/<package-name>:w
    command: ['<dep-command>']
```

Then run with 
```
dunner do <service-name>
```
  
  Eg:
```
dep-ensure:
  - image: leopardslab/go-dep
    dir: /go/src/app
    envs:
      - GOPATH=/dunner/go
    mounts:
    - .:/dunner/go/src/app:w
    command: ['ensure']
```

```
dunner do dep-ensure
```
