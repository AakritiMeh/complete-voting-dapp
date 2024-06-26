"use client";

import React, { useState, useContext, useEffect } from "react";
import Image from "next/image";
import Countdown from "react-countdown";
import { VotingContext, votingTitle } from "./context/voter";
import "./styles/page.module.css";
const page = () => {
  const { votingTitle } = useContext(VotingContext);
  return <div>{votingTitle}</div>;
};
export default page;
