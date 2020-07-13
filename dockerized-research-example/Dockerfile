# Use conda-forge's miniforge Docker images as a starting point
# It includes Miniconda running on Ubuntu, with conda-forge preactivated as a channel
FROM condaforge/miniforge3:latest
SHELL ["/bin/bash", "-c"]

ARG ENVIRONMENT_YML=environment.yml
ARG DATA_DIRECTORY=data

ARG USER=researcher

# Configure a new user with write permissions to /opt/conda
RUN groupadd -g 32766 lucky \
    && useradd \
        --comment "Default user" \
        --create-home \
        --shell /bin/bash \
        --uid 1000 \
        --groups lucky \
        $USER \
    && chown -R $USER /opt/conda \
    && chgrp -R lucky /opt/conda \
    && chmod -R g=u /opt/conda

# Copy the needed input data
COPY --chown=1000:1000 . /home/$USER/

USER $USER
WORKDIR /home/$USER
RUN mkdir -p /home/$USER/output && \
    export LOGFILE="/home/$USER/log.$(date +%s).txt" && \
    echo "Starting at $(date)" > ${LOGFILE} && \
    ./devtools/run_in_docker.sh |& tee -a ${LOGFILE} && \
    echo "Finished at $(date)" >> ${LOGFILE}

ENTRYPOINT ["tini", "--"]
CMD [ "/bin/bash" ]