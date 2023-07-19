FROM nginx:latest
LABEL "author"="manishadornala11072@gmail.com" "creationdate"="july 11th"
RUN apt update
RUN apt install -y net-tools
RUN apt install -y curl nano
COPY index.html /usr/share/nginx/html/
COPY contact.html /usr/share/nginx/html/
COPY scorekeeper.js /usr/share/nginx/html/
ADD style.css /usr/share/nginx/html/
ADD https://releases.hashicorp.com/terraform/${TFORM}/terraform_${TFORM}_linux_amd64.zip .
ADD https://releases.hashicorp.com/packer/${PACK}/packer_${PACK}_linux_amd64.zip .
RUN unzip terraform_${TFORM}_linux_amd64.zip &&
    unzip packer_${PACK}_linux_amd64.zip &&
    mv terraform /usr/local/bin &&
    mv packer /usr/local/bin &&
    rm -rf *.zip && terraform version && packer version
CMD ["nginx", "-g", "daemon off;"]
