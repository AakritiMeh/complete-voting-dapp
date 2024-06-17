"use Client";

import { VotingProvider } from "../context/voter";
import { Navbar } from "../components/navbar/Navbar";
import { Component } from "react";

const MyApp = ({ Component, pageProps }) => {
  <VotingProvider>
    <div>
      <Navbar />
      <div></div>
      <Component {...pageProps} />
    </div>
  </VotingProvider>;
};
