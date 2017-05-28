#!/usr/bin/env bash

LOCK_FILE="$HOME/.hook-lock"
LOG_FILE="$(mktemp /tmp/XXXXXX)"
log() {
	echo "$@" >> "$LOG_FILE"
}
exit_clean() {
	log "$1"
	rm -rf "$LOCK_FILE"
	rm -rf LOG_FILE
	exit $2
}
# Not horribly safe, but good for the odd extra run
while [[ -f "$LOCK_FILE" ]]; do
	sleep 10
done
log "Touching $LOCK_FILE ..."
touch "$LOCK_FILE"

###### EDIT THESE ######
export AWS_ACCESS_KEY_ID="blahblah"
export AWS_SECRET_ACCESS_KEY="blahblahblahblahblahblah"
AWS_BUCKET_PATH="mybucket/myhost"
BACKUP_STORE="$HOME/.backupld/store"


#### LEAVE THIS ####
AWS_COMMAND="$(which aws)"
AWS_BUCKET_REGION="$($AWS_COMMAND s3api get-bucket-location --output text --bucket $AWS_BUCKET_PATH)"
log "Syncing $BACKUP_STORE to S3..."
[[ -d "$BACKUP_STORE" ]] || exit 5
$AWS_COMMAND s3 --region "$AWS_BUCKET_REGION" sync "$BACKUP_STORE" "s3://$AWS_BUCKET_PATH/"
[[ $? -ne 0 ]] && exit_clean "!! FAILED TO SYNC TO S3 !!" 1
exit_clean "Complete!" 0
