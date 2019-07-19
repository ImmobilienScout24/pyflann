pipeline {
    agent none

    options {
        disableConcurrentBuilds()
        skipStagesAfterUnstable()
        buildDiscarder(logRotator(numToKeepStr: '90', artifactNumToKeepStr: '90'))
        quietPeriod(30) // wait for 30 seconds to see if additional commits are coming in
    }

    environment {
        VERSION=getInvokedBuildNumber()
        FAST_TOKEN=getFastToken()
        FAST_USER=getFastUser()
        TWINE_USERNAME=getFastUser()
        TWINE_PASSWORD=getFastToken()
        TWINE_REPOSITORY_URL="https://fast.cloud.scout24.com/artifactory/api/pypi/pypi-local"
        PYPIPROXY_URL="https://${FAST_USER}:${FAST_TOKEN}@fast.cloud.scout24.com/artifactory/api/pypi/pypi/simple"
    }

    stages {
        stage('Build, Test and Upload to Local PyPI') {
            agent { node { label 'deploy-python36' } }
            when {
                beforeAgent true
                branch 'master'
            }
            steps {
                sh 'pip install twine'
                sh 'pip install --index-url=${PYPIPROXY_URL}'
                sh 'python setup.py sdist'
                sh 'twine upload dist/*'
            }
        }
    }
}