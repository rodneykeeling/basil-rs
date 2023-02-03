FROM rust:1.67

WORKDIR /usr/src/basil
COPY . .

RUN cargo install --path .

ENTRYPOINT ["basil"]
