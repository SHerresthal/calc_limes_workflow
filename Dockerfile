FROM mvonpapen/fg_r_seurat:0.1.0

COPY /app /app
COPY /LICENSE /app/
COPY /LICENSE-THIRD-PARTY /app/

WORKDIR /app

RUN Rscript /install/fg.R
ENTRYPOINT Rscript main.R