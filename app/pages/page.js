"use client";

import React, { useState, useContext, useEffect } from "react";
import Image from "next/image";
import Countdown from "recat-countdown";
import { VotingContext } from "../context/voter";
import Style from "../styles/index.module.css";
const page = () => {
  const { votingTitle } = useContext(VotingContext);
  return <div>{votingTitle}</div>;
};
export default page;
