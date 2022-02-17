#!/bin/bash

echo "Starting ScoutSuite installation..."
git clone https://github.com/nccgroup/ScoutSuite

echo "Clone Scoutsuit"

cd ScoutSuite

export AWS_ACCESS_KEY_ID=AKIA6MH3GAWIX4QBRLXA
export AWS_SECRET_ACCESS_KEY=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

virtualenv -p python3 venv
source venv/bin/activate
pip install scoutsuite

echo "ScoutSuite isntallation completed and starting scan..."

python scout.py aws

echo "ScoutSuite is completed the scan"

echo "creation of directory"

mkdir -p /home/manikandan/Desktop/ScoutSuite/reports

#cd /home/manikandan/Desktop/ScoutSuite/scoutsuite-report/scoutsuite-results/
sudo cp -r ~/Desktop/ScoutSuite/scoutsuite-report/scoutsuite-results/scoutsuite_results_aws-*.js ~/Desktop/ScoutSuite/reports/
mv ~/Desktop/ScoutSuite/scoutsuite-report/scoutsuite-results/scoutsuite_results_aws-*.js ~/Desktop/ScoutSuite/scoutsuite-report/scoutsuite-results/scoutsuite_results_aws.json

echo "Report upload to DefectDojo..."
curl -X POST "https://demo.defectdojo.org/api/v2/import-scan/" -H "accept: application/json" -H "Authorization: Token 548afd6fab3bea9794a41b31da0e9404f733e222" -H "Content-Type: multipart/form-data" -F "minimum_severity=Info" -F "active=true" -F "verified=true" -F "scan_type=Scout Suite Scan" -F "file=@/home/manikandan/Desktop/ScoutSuite/scoutsuite-report/scoutsuite-results/scoutsuite_results_aws.json;type=application/json" -F "product_type_name=product_srv1" -F "product_name=product_srv2" -F "engagement_name=engagement_name_srv" -F "test_title=Test 2" -F "auto_create_context=true" -F "close_old_findings=false" -F "push_to_jira=false"


echo "click the link defectdojo"

echo "curl https://demo.defectdojo.org"
