# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Fake SNS image based on airdock/base
# TO_BUILD:       docker build --rm -t airdock/fake-sns .
# SOURCE:         https://github.com/airdock-io/docker-fake-sns

FROM airdock/base:latest
MAINTAINER Jerome Guibert <jguibert@gmail.com>

RUN apt-get update -qq && apt-get install -y ruby-full && \
   mkdir -p /opt/fake-sns && cd /opt/fake-sns && \
   mkdir -p /svr/fake-sns && \
   gem install fake_sns && \
  /root/post-install

EXPOSE 9292

CMD ["fake_sns",  "--database" , "/svr/fake-sns/database.yml", "-p", "9292"]
