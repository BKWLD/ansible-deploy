# ansible-deploy

A Docker image for deploying via Ansible from GitLab CI/CD

## Notes

- Make buildx profile (or whatever) with `docker buildx create --name multibuilder --driver docker-container --bootstrap --use`
- Run `docker buildx build --platform linux/amd64,linux/arm64 .` to test changes to Dockerfile locally.
- To deploy: `docker build -t bukwild/ansible-deploy . && docker push bukwild/ansible-deploy`
