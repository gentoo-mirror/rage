# GitLab CI/CD

The timeout setting for the pipeline should be set to three hours so that
portage has time to compile all of the required dependencies:

```yml
Timeout: 3h
```

**Note: this is the max time allowed for GitLab.com**

## Reference

- [GitLab Runner Maximum Timeout](https://gitlab.com/help/ci/runners/README.html#setting-maximum-job-timeout-for-a-runner)

- [GitLab Settings Pipeline Timeout](https://gitlab.com/help/ci/pipelines/settings#timeout)
