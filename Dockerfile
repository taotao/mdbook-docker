FROM alpine:latest AS extractor
ARG MDBOOK_VERSION="0.3.3"
WORKDIR /
RUN \
	apk add --no-cache curl && \
	curl -o mdbook.tar.gz -L https://github.com/rust-lang-nursery/mdBook/releases/download/v${MDBOOK_VERSION}/mdbook-v${MDBOOK_VERSION}-x86_64-unknown-linux-gnu.tar.gz && \
	tar zxvf mdbook.tar.gz

FROM alpine:latest
COPY --from=extractor /mdbook /bin/mdbook
WORKDIR /data
VOLUME ["/data"]
