# Sidecar Example Project

This project demonstrates the use and communication with sidecar containers in a Kubernetes Pod. The main application is accompanied by two sidecar containers, one running Node.js and the other running Python, and it communicates with these sidecars using named pipes.
## Prerequisites

- Docker installed on your machine
- Kubernetes cluster up and running
- Helm installed

## Building the Docker Image

First, we need to build the Docker image for our application. Run the following command:

```bash
docker build -t sidecar-example .
```

This command builds a Docker image using the Dockerfile in the current directory and tags it as `sidecar-example`.

## Deploying the Application

We use Helm to deploy our application to the Kubernetes cluster. Run the following command:

```bash
helm install sidecar-example ./helm
```

This command deploys the application using the Helm chart located in the `./helm` directory.

## Interacting with the Application

After the application is deployed and running, you can exec into the main container using the following command:

```bash
kubectl exec -it pod/sidecar-example -c main -- /bin/bash
```

Once inside the main container, you can send commands to the sidecar containers. For example, to get the Node.js version, run:

```bash
send node 'node --version'
```

To get the Python version, run:

```bash
send python 'python --version'
```

## Cleaning Up

When you're done with the application, you can uninstall it using Helm:

```bash
helm uninstall sidecar-example
```

This command removes the application from your Kubernetes cluster.