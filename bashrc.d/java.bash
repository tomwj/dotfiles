# https://github.com/gradle/gradle/issues/2995
# Stops groovy from showing loads of warnings when running
export JAVA_OPTS="--add-opens=java.base/java.lang=ALL-UNNAMED --add-opens=java.base/java.lang.invoke=ALL-UNNAMED"
