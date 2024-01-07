# llamafile-docker

## Introduction

This repository, `llamafile-docker`, automates the process of checking for new releases of `Mozilla-Ocho/llamafile`, building a Docker image with the latest version, and pushing it to Docker Hub.

## Usage

You will have to download a pre-trained model using the gguf format. You can find some on [hugging face](https://huggingface.co).
Please refer to the [llamafile](https://github.com/Mozilla-Ocho/llamafile) documentation for more information or report an issue if you need help.

### Server version (default)

#### Prerequisites

- Docker
- A gguf pre-trained model

#### Using the image

```bash
docker run -it --rm \
-v /path/to/gguf/model:/model \
iverly/llamafile-docker:latest
```

The server will be listening on port 8080 and expose an ui to interact with the model.

Please refer to the [llamafile](https://github.com/Mozilla-Ocho/llamafile) documentation the available endpoints.

### CLI version

#### Prerequisites

- Docker
- A gguf pre-trained model

#### Using the image

```bash
docker run -it --rm \
-v /path/to/gguf/model:/model \
iverly/llamafile-docker:latest --cli -m /model -p {prompt}
```

You will see the output of the model in the terminal.

## Contributing

Contributions are welcome. Please follow the standard Git workflow - fork, branch, and pull request.

## License

This project is licensed under the Apache 2.0 - see the `LICENSE` file for details.
