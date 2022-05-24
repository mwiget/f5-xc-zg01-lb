 FROM gitpod/workspace-full:latest
 RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add - \
       && sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main" \
       && sudo apt-get update && sudo apt-get install terraform \
       && wget -O terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v0.37.1/terragrunt_linux_amd64 \
      && chmod +rx terragrunt \
      && sudo mv terragrunt /usr/local/bin/