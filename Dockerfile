FROM maven:3.6.3-slim as builder

# Blobstores
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-blobstore-azire:0.4.0 -DoutputDirectory=/nexus
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-blobstore-google-cloud:0.14.0 -DoutputDirectory=/nexus

# Repositories
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-apk:0.0.10 -DoutputDirectory=/nexus
# RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-cargo:0.0.7 -DoutputDirectory=/nexus
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-composer:0.0.7 -DoutputDirectory=/nexus
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-cpan:0.0.3 -DoutputDirectory=/nexus
RUN mvn -U org.apache.maven.plugins:maven-dependency-plugin:3.0.1:copy -Dartifact=org.sonatype.nexus.plugins:nexus-repository-puppet:0.1.2 -DoutputDirectory=/nexus

FROM sonatype/nexus3:3.29.2

COPY --from=builder /nexus/*.jar /opt/sonatype/nexus/deploy/
