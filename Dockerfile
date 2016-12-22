# VERSION 1.0
# AUTHOR:         Jerome Guibert <jguibert@gmail.com>
# DESCRIPTION:    Fake SNS image based on airdock/rvm
# TO_BUILD:       docker build --rm -t airdock/fake-sns .
# SOURCE:         https://github.com/airdock-io/docker-fake-sns

FROM airdock/rvm:latest
MAINTAINER Jerome Guibert <jguibert@gmail.com>

RUN  mkdir -p /opt/fake-sns && cd /opt/fake-sns && \
    mkdir -p /srv/fake-sns && \
    rvm ruby-2.3 do gem install fake_sns --no-ri --no-rdoc && \
    /root/post-install

EXPOSE 9292

CMD ["rvm", "ruby-2.3", "do", "fake_sns", "--database", "/srv/fake-sns/database.yml", "-p", "9292"]
