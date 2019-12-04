# Bitbucket based images

## jtemporal/atlassian-default-py3

This uses `atlassaian/default-image:2` as base image. We install Python 3 to allow you to use in a Bitbucket Pipeline like: 

```
image: jtemporal/atlassian-default-py3

pipelines:
  default:
    - parallel:
        - step:
            name: Install requirements and test
            caches:
              - pip
            script:
              - pip install -r requirements.txt
              - pytest -v tests/
```

Especially if you install `pyspark` from the `requirements.txt`
