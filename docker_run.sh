docker run -d \
  -p 1521:1521 \
  -p 5500:5500 \
  --name=oracle-xe \
  --volume ~/docker/oracle-xe:/opt/oracle/oradata \
  --network=oracle_network18c \
  oracle-xe:18c
