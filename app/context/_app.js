import { ThirdwebProvider } from "@thirdweb-dev/react";
import { AppProps } from "next/app";

function app({ Component, pageProps }) {
  return <ThirdwebProvider></ThirdwebProvider>;
}
