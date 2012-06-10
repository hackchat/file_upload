require 'aws/s3'

AWS::S3::Base.establish_connection!(access_key_id: 'AKIAJWYOFVT5MEMW7KFQ', secret_access_key: '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')

AWS::S3::S3Object.store("mkdown_test_#{Time.now}", open('Projects/hackchat/file-upload/README.md'), 'hackchat')