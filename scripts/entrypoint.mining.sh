#!/bin/sh

monerod --testnet \
		--no-igd \
		--hide-my-port \
		--data-dir /monero/blockchain/ \
		--p2p-bind-ip 127.0.0.1 \
		--p2p-bind-port 28080 \
		--log-level 2 \
		--rpc-bind-ip 0.0.0.0 \
		--rpc-bind-port 28081 \
		--detach \
        --start-mining 9wviCeWe2D8XS82k2ovp5EUYLzBt9pYNW2LXUFsZiv8S3Mt21FZ5qQaAroko1enzw3eGr9qC7X1D7Geoo2RrAotYPwq9Gm8 \
        --mining-threads 1

monero-wallet-rpc --testnet \
		--rpc-bind-port 28082 \
        --trusted-daemon \
        --rpc-bind-ip 0.0.0.0 \
        --confirm-external-bind \
        --disable-rpc-login \
        --wallet-file /monero/wallet/wallet.bin \
        --password ""
