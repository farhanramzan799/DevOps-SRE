FROM node:8-alpine

# google cloud sdk part

ENV CLOUD_SDK_VERSION=247.0.0

COPY service-account-key.json ./

ENV PATH /google-cloud-sdk/bin:$PATH
RUN apk --no-cache add \
      curl \
      python \
      py-crcmod \
      bash \
      libc6-compat \
      openssh-client \
      git \
      gnupg \
  && curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  tar xzf google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  rm google-cloud-sdk-${CLOUD_SDK_VERSION}-linux-x86_64.tar.gz && \
  ln -s /lib /lib64 && \
  gcloud config set core/disable_usage_reporting true && \
  gcloud config set component_manager/disable_update_check true && \
  gcloud config set metrics/environment github_docker_image && \
  gcloud config set project PROJECT_NAME && \
  gcloud auth activate-service-account --key-file=service-account-key.json &&\
  gcloud --version

COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl

# application part

WORKDIR /usr/src/app
COPY package.json package*.json ./
RUN npm install --only=production
COPY index.js index.js
COPY *.sh ./
RUN chmod +x *.sh
CMD [ "npm", "start" ]
