import React, { useContext, createContext } from "react";
// import Web3Modal from "web3modal";
// import lighthouse from "@lighthouse-web3/sdk";
// import axios from "axios";
// import { useRouter } from "next/router";
// import { ethers } from "hardhat";

// const fetchContract = (signerOrProvider) => {
//   new ethers.Contract(votingAddress, VotingAddressABI, signerOrProvider);
// };

export const VotingContext = React.createContext();

export const VotingProvider = ({ children }) => {
  const votingTitle = "MyFirst Smart contract app";
  return (
    <VotingContext.Provider value={{ votingTitle }}>
      {children}
    </VotingContext.Provider>
  );
};

export default VotingContext;
