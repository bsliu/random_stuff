#!/bin/bash

wallet_addr=$1
rpc_url=http://15.223.76.165:8545

# unlock miner account (which has eth)
echo "unlock miner account"
curl -X POST {$rpc_url} -H "Content-Type: application/json" -d "{\"jsonrpc\":\"2.0\", \"method\": \"personal_unlockAccount\",  \"params\": [\"0x872481704CCCB67B4EcbCB1F1a3E90542d5A796c\", \"rbc\"], \"id\":1}"

# transfer eth from miner account to any wallet
echo "transfer 20 eth to $wallet_addr"
curl -X POST {$rpc_url} -H "Content-Type: application/json" -d "{\"jsonrpc\":\"2.0\", \"method\":\"eth_sendTransaction\", \"params\": [{\"from\": \"0x872481704CCCB67B4EcbCB1F1a3E90542d5A796c\", \"to\": \"$wallet_addr\", \"gas\": \"0x76c0\",  \"gasPrice\": \"0x1000\", \"value\": \"0x1158E460913D00000\"}], \"id\":2}"
echo "transfer transaction submitted."


