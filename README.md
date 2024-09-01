# VanityGPG Docker

VanityGPG Docker 是一个用于生成和筛选自定义GPG密钥的Docker镜像。该项目基于 [VanityGPG](https://github.com/RedL0tus/VanityGPG) 工具，通过Docker容器化，使得生成符合特定模式的GPG公钥更加简便和高效。

## 功能

- 使用多线程生成包含特定字符串的GPG公钥。
- 支持多种密码套件（例如Ed25519、RSA等）。
- 提供干运行（Dry Run）模式，不保存匹配的密钥。
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
    docker run --rm vanitygpg --pattern "yourdesiredtext"
    ```

    以上命令会启动一个Docker容器并生成包含`yourdesiredtext`的GPG公钥。请替换`yourdesiredtext`为你想要的自定义字符串。

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

### 标志 (Flags)

- `-d, --dry-run`：干运行模式（不保存匹配的密钥）。
- `-h, --help`：显示帮助信息。
- `-v, --verbose`：增加详细输出信息级别。
- `-V, --version`：显示版本信息。

### 选项 (Options)

- `-c, --cipher-suite <cipher-suite>`：指定密码套件。默认是`Ed25519`，可选值有：`Ed25519`, `RSA2048`, `RSA3072`, `RSA4096`, `NISTP256`, `NISTP384`, `NISTP521`。
- `-j, --jobs <jobs>`：指定线程数（默认为8）。
- `-p, --pattern <pattern>`：指定用于匹配指纹的正则表达式模式。
- `-u, --user-id <user-id>`：指定符合OpenPGP的用户ID。

在`docker-compose.yml`文件中，您可以编辑`command`部分来指定这些选项。

## 示例

使用Docker Compose生成一个包含“hello”的GPG密钥：

1. 编辑`docker-compose.yml`文件，将`command`字段修改为：

    ```yaml
    command: ["--pattern", "hello"]
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
