# ansible-deploy

A Docker image for deploying via Ansible from GitLab CI/CD

## Notes

- Run `docker build .` to test changes to Dockerfile locally.
- To deploy: `docker build -t bukwild/ansible-deploy . && docker push bukwild/ansible-deploy`
