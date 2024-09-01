# VanityGPG Docker

VanityGPG Docker 是一个用于生成自定义GPG密钥的Docker镜像。该项目基于 [VanityGPG](https://github.com/aktata/vanitygpg) 工具，通过Docker容器化，使得生成符合特定模式的GPG公钥更为简便和高效。

## 功能

- 生成包含特定字符串的GPG公钥。
- 使用Docker和Docker Compose简化安装和运行环境的配置。

## 先决条件

在开始之前，请确保您已在系统上安装了以下软件：

- [Docker](https://www.docker.com/get-started)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 快速开始

### 使用Docker

1. 克隆此存储库：

    ```bash
    git clone https://github.com/aktata/vanitygpg-docker.git
    cd vanitygpg-docker
    ```

2. 构建Docker镜像：

    ```bash
    docker build -t vanitygpg .
    ```

3. 运行容器并生成自定义GPG密钥：

    ```bash
    docker run --rm vanitygpg -t "yourdesiredtext"
    ```

    以上命令会启动一个Docker容器并生成包含“yourdesiredtext”文本的GPG公钥。请替换`yourdesiredtext`为你想要的自定义字符串。

### 使用Docker Compose

Docker Compose文件提供了一种简单的方法来运行容器。可以按照以下步骤快速启动服务：

1. 克隆此存储库并进入项目目录：

    ```bash
    git clone https://github.com/aktata/vanitygpg-docker.git
    cd vanitygpg-docker
    ```

2. 使用Docker Compose构建并运行服务：

    ```bash
    docker-compose up --build
    ```

3. 运行完成后，Compose会使用默认配置启动生成GPG密钥的服务。您可以在`docker-compose.yml`文件中修改启动参数，以包含您想要的自定义字符串或其他配置。

## 配置选项

你可以通过以下选项自定义生成的GPG密钥：

- `-t` 或 `--text`：指定你想在GPG公钥中包含的文本。
- `-k` 或 `--key-type`：指定密钥类型，例如`rsa`或`dsa`。（可选）
- `-l` 或 `--length`：指定密钥长度，例如`2048`或`4096`。（可选）

在`docker-compose.yml`文件中，您可以编辑`command`部分来指定这些选项。

## 示例

使用Docker Compose生成一个包含“hello”的GPG密钥：

1. 编辑`docker-compose.yml`文件，将`command`字段修改为：

    ```yaml
    command: ["-t", "hello"]
    ```

2. 启动服务：

    ```bash
    docker-compose up --build
    ```

## 贡献

欢迎贡献！如果你发现任何问题或有改进建议，请提交issue或pull request。

## 许可证

此项目遵循 [MIT 许可证](LICENSE)。

## 参考

- [VanityGPG 原始项目](https://github.com/RedL0tus/VanityGPG)
