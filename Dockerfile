FROM ubuntu:latest

# Install required dependencies only
RUN apt update && apt install -y \
	curl \
	git \
	unzip \
	automake \
	cmake \
	python3 \
	python3-pip \
	python3-venv \
	ripgrep \
	fd-find \
	gettext \
	nodejs npm && \
	rm -rf /var/lib/apt/lists/*

# Install uv
COPY --from=ghcr.io/astral-sh/uv:latest /uv /uvx /bin/

# Create directory for projects (there should be mounted from host).
RUN mkdir -p /root/workspace

# Set default location after container startup.
WORKDIR /root/workspace

# Install Neovim from source.
RUN git clone https://github.com/neovim/neovim.git
WORKDIR /root/workspace/neovim
RUN git fetch --tags && git checkout tags/v0.10.2 -b build-branch
RUN make CMAKE_BUILD_TYPE=Release
RUN make install

# Copy Neovim config
COPY . /root/.config/nvim

# Install Neovim plugins and Mason dependencies
RUN nvim --headless "+Lazy! sync" +qall && \
	nvim --headless "+MasonInstallAll" +qall || true


CMD ["/bin/bash"]
