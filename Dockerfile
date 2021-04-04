# Parent
# ------------------------------------------------------------
FROM postgres:latest
 
#Set TimeZone Indonesia
#------------------------------------------------
ENV TZ=Asia/Jakarta
 
# Set environment for this images
# ------------------------------------------------------------
ENV POSTGRES_USER postgres
ENV POSTGRES_PASSWORD postgres
ENV POSTGRES_DB siantar_square_db

# initdb
# ------------------------------------------------------------
COPY /initdb/* /docker-entrypoint-initdb.d/
