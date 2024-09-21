#!/bin/bash

PROJECT_NAME="sample_chakra"

# setup Next.js
npx create-next-app $PROJECT_NAME --ts --eslint --src-dir --use-yarn --no-tailwind --no-app --import-alias "@/*"

cd $PROJECT_NAME

yarn install

rm -rf ./src/pages/api

# setup chakra
yarn add @chakra-ui/react @chakra-ui/next-js @emotion/react @emotion/styled framer-motion

sed -i '3 i import { ChakraProvider } from \x27@chakra-ui/react\x27' ./src/pages/_app.tsx

sed -i '/return <Component {...pageProps} \/>;/c\
return (\
    <ChakraProvider>\
      <Component {...pageProps} />\
    </ChakraProvider>\
  )' ./src/pages/_app.tsx