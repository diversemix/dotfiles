#!/bin/sh

npm init -y
npm i -D typescript ts-node

echo "console.log(\`Hello Typescript\`);" > index.ts

npx tsc --init

sed -i '/scripts.*/a \ \ \ \ "build": "tsc --build",' package.json
sed -i '/scripts.*/a \ \ \ \ "start": "node --loader ts-node/esm index.ts",' package.json
