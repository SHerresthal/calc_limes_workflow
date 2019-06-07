FROM mvonpapen/fg_r_seurat:0.1.0

COPY install /install
RUN Rscript /install/fg.R

COPY app /app
COPY LICENSE LICENSE-THIRD-PARTY /app/

WORKDIR /app

CMD Rscript main.R
