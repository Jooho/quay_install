ssh root@ceph01 -- ceph health


ssh root@ceph01 -- ceph osd pool create test 8
ssh root@ceph01 -- "echo 'Hello World!' > hello-world.txt"
ssh root@ceph01 -- "rados --pool test put hello-world hello-world.txt"
ssh root@ceph01 -- "rados --pool test get hello-world fetch.txt"
ssh root@ceph01 -- "cat fetch.txt"

