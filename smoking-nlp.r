{
 "cells": [
  {
   "cell_type": "markdown",
   "id": "6818e7fb",
   "metadata": {
    "_cell_guid": "dadd083a-e779-45f3-a1bc-3b8c2bfc601d",
    "_uuid": "af025162-3818-4756-b4ed-101c9969a10a",
    "papermill": {
     "duration": 0.019758,
     "end_time": "2023-12-07T20:17:47.197653",
     "exception": false,
     "start_time": "2023-12-07T20:17:47.177895",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "<div align=\"center\"> \n",
    "    \n",
    "  ###      Emmanuel Maduneme\n",
    "<div align=\"center\"> \n",
    "    \n",
    "  ###     EDUC 654: Machine Learning for Educational Data Science\n",
    "    \n",
    "  <div align=\"center\">\n",
    "      \n",
    " ###     December 6, 2023"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "047a4e80",
   "metadata": {
    "papermill": {
     "duration": 0.019392,
     "end_time": "2023-12-07T20:17:47.236063",
     "exception": false,
     "start_time": "2023-12-07T20:17:47.216671",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **R Code for Prediction of Binary Smoking Status Using Bio-Signals**"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "e8007f1c",
   "metadata": {
    "_cell_guid": "d9b34ff2-203d-4c6d-b753-db216dc672ce",
    "_uuid": "56cba58a-0bf4-4181-b0d9-d04a77d1e011",
    "papermill": {
     "duration": 0.018741,
     "end_time": "2023-12-07T20:17:47.274143",
     "exception": false,
     "start_time": "2023-12-07T20:17:47.255402",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Loading Packages**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 1,
   "id": "311638dd",
   "metadata": {
    "_cell_guid": "ae5f68fa-2abf-48e4-82ea-dc09f5835408",
    "_uuid": "f6c32f03-6b43-4251-9b31-382eab0bf928",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:17:47.318146Z",
     "iopub.status.busy": "2023-12-07T20:17:47.315326Z",
     "iopub.status.idle": "2023-12-07T20:18:34.227222Z",
     "shell.execute_reply": "2023-12-07T20:18:34.224829Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 46.937247,
     "end_time": "2023-12-07T20:18:34.230029",
     "exception": false,
     "start_time": "2023-12-07T20:17:47.292782",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    }
   ],
   "source": [
    "install.packages(\"cutpointr\")"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 2,
   "id": "50c711fa",
   "metadata": {
    "_cell_guid": "78cfb4ec-0ad1-4c9d-bae5-3b1aa0463b4f",
    "_uuid": "022942b5-0891-4c3d-9be9-bf7562ac769b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:34.323244Z",
     "iopub.status.busy": "2023-12-07T20:18:34.270858Z",
     "iopub.status.idle": "2023-12-07T20:18:37.512133Z",
     "shell.execute_reply": "2023-12-07T20:18:37.509963Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 3.265592,
     "end_time": "2023-12-07T20:18:37.515148",
     "exception": false,
     "start_time": "2023-12-07T20:18:34.249556",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: cutpointr\n",
      "\n"
     ]
    }
   ],
   "source": [
    "library(pacman)\n",
    "require(cutpointr)\n",
    "p_load(janitor, tidyverse, rio, recipes)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "69ce043a",
   "metadata": {
    "_cell_guid": "1b3ef5ff-5ddd-4c8a-b828-20e842398347",
    "_uuid": "8054641a-a9a6-4308-b231-87e98a374046",
    "papermill": {
     "duration": 0.019598,
     "end_time": "2023-12-07T20:18:37.559179",
     "exception": false,
     "start_time": "2023-12-07T20:18:37.539581",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Loading training Dataset and EDA**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 3,
   "id": "c4fd159d",
   "metadata": {
    "_cell_guid": "1d8a60c0-16dc-4baa-b69b-e6ac3e761375",
    "_uuid": "09939472-7d88-414b-b988-302163bc8f5f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:37.603240Z",
     "iopub.status.busy": "2023-12-07T20:18:37.600307Z",
     "iopub.status.idle": "2023-12-07T20:18:40.050621Z",
     "shell.execute_reply": "2023-12-07T20:18:40.048722Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 2.474292,
     "end_time": "2023-12-07T20:18:40.053286",
     "exception": false,
     "start_time": "2023-12-07T20:18:37.578994",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 24</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>id</th><th scope=col>age</th><th scope=col>height.cm.</th><th scope=col>weight.kg.</th><th scope=col>waist.cm.</th><th scope=col>eyesight.left.</th><th scope=col>eyesight.right.</th><th scope=col>hearing.left.</th><th scope=col>hearing.right.</th><th scope=col>systolic</th><th scope=col>⋯</th><th scope=col>HDL</th><th scope=col>LDL</th><th scope=col>hemoglobin</th><th scope=col>Urine.protein</th><th scope=col>serum.creatinine</th><th scope=col>AST</th><th scope=col>ALT</th><th scope=col>Gtp</th><th scope=col>dental.caries</th><th scope=col>smoking</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>⋯</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1</th><td>0</td><td>55</td><td>165</td><td>60</td><td> 81.0</td><td>0.5</td><td>0.6</td><td>1</td><td>1</td><td>135</td><td>⋯</td><td>40</td><td> 75</td><td>16.5</td><td>1</td><td>1.0</td><td>22</td><td>25</td><td> 27</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>2</th><td>1</td><td>70</td><td>165</td><td>65</td><td> 89.0</td><td>0.6</td><td>0.7</td><td>2</td><td>2</td><td>146</td><td>⋯</td><td>57</td><td>126</td><td>16.2</td><td>1</td><td>1.1</td><td>27</td><td>23</td><td> 37</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>3</th><td>2</td><td>20</td><td>170</td><td>75</td><td> 81.0</td><td>0.4</td><td>0.5</td><td>1</td><td>1</td><td>118</td><td>⋯</td><td>45</td><td> 93</td><td>17.4</td><td>1</td><td>0.8</td><td>27</td><td>31</td><td> 53</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>4</th><td>3</td><td>35</td><td>180</td><td>95</td><td>105.0</td><td>1.5</td><td>1.2</td><td>1</td><td>1</td><td>131</td><td>⋯</td><td>38</td><td>102</td><td>15.9</td><td>1</td><td>1.0</td><td>20</td><td>27</td><td> 30</td><td>1</td><td>0</td></tr>\n",
       "\t<tr><th scope=row>5</th><td>4</td><td>30</td><td>165</td><td>60</td><td> 80.5</td><td>1.5</td><td>1.0</td><td>1</td><td>1</td><td>121</td><td>⋯</td><td>44</td><td> 93</td><td>15.4</td><td>1</td><td>0.8</td><td>19</td><td>13</td><td> 17</td><td>0</td><td>1</td></tr>\n",
       "\t<tr><th scope=row>6</th><td>5</td><td>50</td><td>170</td><td>55</td><td> 51.0</td><td>1.2</td><td>1.2</td><td>1</td><td>1</td><td>146</td><td>⋯</td><td>31</td><td> 99</td><td>15.9</td><td>1</td><td>0.7</td><td>24</td><td>42</td><td>119</td><td>1</td><td>1</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 24\n",
       "\\begin{tabular}{r|lllllllllllllllllllll}\n",
       "  & id & age & height.cm. & weight.kg. & waist.cm. & eyesight.left. & eyesight.right. & hearing.left. & hearing.right. & systolic & ⋯ & HDL & LDL & hemoglobin & Urine.protein & serum.creatinine & AST & ALT & Gtp & dental.caries & smoking\\\\\n",
       "  & <int> & <int> & <int> & <int> & <dbl> & <dbl> & <dbl> & <int> & <int> & <int> & ⋯ & <int> & <int> & <dbl> & <int> & <dbl> & <int> & <int> & <int> & <int> & <int>\\\\\n",
       "\\hline\n",
       "\t1 & 0 & 55 & 165 & 60 &  81.0 & 0.5 & 0.6 & 1 & 1 & 135 & ⋯ & 40 &  75 & 16.5 & 1 & 1.0 & 22 & 25 &  27 & 0 & 1\\\\\n",
       "\t2 & 1 & 70 & 165 & 65 &  89.0 & 0.6 & 0.7 & 2 & 2 & 146 & ⋯ & 57 & 126 & 16.2 & 1 & 1.1 & 27 & 23 &  37 & 1 & 0\\\\\n",
       "\t3 & 2 & 20 & 170 & 75 &  81.0 & 0.4 & 0.5 & 1 & 1 & 118 & ⋯ & 45 &  93 & 17.4 & 1 & 0.8 & 27 & 31 &  53 & 0 & 1\\\\\n",
       "\t4 & 3 & 35 & 180 & 95 & 105.0 & 1.5 & 1.2 & 1 & 1 & 131 & ⋯ & 38 & 102 & 15.9 & 1 & 1.0 & 20 & 27 &  30 & 1 & 0\\\\\n",
       "\t5 & 4 & 30 & 165 & 60 &  80.5 & 1.5 & 1.0 & 1 & 1 & 121 & ⋯ & 44 &  93 & 15.4 & 1 & 0.8 & 19 & 13 &  17 & 0 & 1\\\\\n",
       "\t6 & 5 & 50 & 170 & 55 &  51.0 & 1.2 & 1.2 & 1 & 1 & 146 & ⋯ & 31 &  99 & 15.9 & 1 & 0.7 & 24 & 42 & 119 & 1 & 1\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 24\n",
       "\n",
       "| <!--/--> | id &lt;int&gt; | age &lt;int&gt; | height.cm. &lt;int&gt; | weight.kg. &lt;int&gt; | waist.cm. &lt;dbl&gt; | eyesight.left. &lt;dbl&gt; | eyesight.right. &lt;dbl&gt; | hearing.left. &lt;int&gt; | hearing.right. &lt;int&gt; | systolic &lt;int&gt; | ⋯ ⋯ | HDL &lt;int&gt; | LDL &lt;int&gt; | hemoglobin &lt;dbl&gt; | Urine.protein &lt;int&gt; | serum.creatinine &lt;dbl&gt; | AST &lt;int&gt; | ALT &lt;int&gt; | Gtp &lt;int&gt; | dental.caries &lt;int&gt; | smoking &lt;int&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| 1 | 0 | 55 | 165 | 60 |  81.0 | 0.5 | 0.6 | 1 | 1 | 135 | ⋯ | 40 |  75 | 16.5 | 1 | 1.0 | 22 | 25 |  27 | 0 | 1 |\n",
       "| 2 | 1 | 70 | 165 | 65 |  89.0 | 0.6 | 0.7 | 2 | 2 | 146 | ⋯ | 57 | 126 | 16.2 | 1 | 1.1 | 27 | 23 |  37 | 1 | 0 |\n",
       "| 3 | 2 | 20 | 170 | 75 |  81.0 | 0.4 | 0.5 | 1 | 1 | 118 | ⋯ | 45 |  93 | 17.4 | 1 | 0.8 | 27 | 31 |  53 | 0 | 1 |\n",
       "| 4 | 3 | 35 | 180 | 95 | 105.0 | 1.5 | 1.2 | 1 | 1 | 131 | ⋯ | 38 | 102 | 15.9 | 1 | 1.0 | 20 | 27 |  30 | 1 | 0 |\n",
       "| 5 | 4 | 30 | 165 | 60 |  80.5 | 1.5 | 1.0 | 1 | 1 | 121 | ⋯ | 44 |  93 | 15.4 | 1 | 0.8 | 19 | 13 |  17 | 0 | 1 |\n",
       "| 6 | 5 | 50 | 170 | 55 |  51.0 | 1.2 | 1.2 | 1 | 1 | 146 | ⋯ | 31 |  99 | 15.9 | 1 | 0.7 | 24 | 42 | 119 | 1 | 1 |\n",
       "\n"
      ],
      "text/plain": [
       "  id age height.cm. weight.kg. waist.cm. eyesight.left. eyesight.right.\n",
       "1 0  55  165        60          81.0     0.5            0.6            \n",
       "2 1  70  165        65          89.0     0.6            0.7            \n",
       "3 2  20  170        75          81.0     0.4            0.5            \n",
       "4 3  35  180        95         105.0     1.5            1.2            \n",
       "5 4  30  165        60          80.5     1.5            1.0            \n",
       "6 5  50  170        55          51.0     1.2            1.2            \n",
       "  hearing.left. hearing.right. systolic ⋯ HDL LDL hemoglobin Urine.protein\n",
       "1 1             1              135      ⋯ 40   75 16.5       1            \n",
       "2 2             2              146      ⋯ 57  126 16.2       1            \n",
       "3 1             1              118      ⋯ 45   93 17.4       1            \n",
       "4 1             1              131      ⋯ 38  102 15.9       1            \n",
       "5 1             1              121      ⋯ 44   93 15.4       1            \n",
       "6 1             1              146      ⋯ 31   99 15.9       1            \n",
       "  serum.creatinine AST ALT Gtp dental.caries smoking\n",
       "1 1.0              22  25   27 0             1      \n",
       "2 1.1              27  23   37 1             0      \n",
       "3 0.8              27  31   53 0             1      \n",
       "4 1.0              20  27   30 1             0      \n",
       "5 0.8              19  13   17 0             1      \n",
       "6 0.7              24  42  119 1             1      "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "'data.frame':\t159256 obs. of  24 variables:\n",
      " $ id                 : int  0 1 2 3 4 5 6 7 8 9 ...\n",
      " $ age                : int  55 70 20 35 30 50 45 55 40 40 ...\n",
      " $ height.cm.         : int  165 165 170 180 165 170 160 155 165 155 ...\n",
      " $ weight.kg.         : int  60 65 75 95 60 55 55 60 70 50 ...\n",
      " $ waist.cm.          : num  81 89 81 105 80.5 51 69 84.5 89 73 ...\n",
      " $ eyesight.left.     : num  0.5 0.6 0.4 1.5 1.5 1.2 1.5 0.7 0.7 1.5 ...\n",
      " $ eyesight.right.    : num  0.6 0.7 0.5 1.2 1 1.2 1.2 0.9 1 1.5 ...\n",
      " $ hearing.left.      : int  1 2 1 1 1 1 1 1 1 1 ...\n",
      " $ hearing.right.     : int  1 2 1 1 1 1 1 1 1 1 ...\n",
      " $ systolic           : int  135 146 118 131 121 146 150 137 130 105 ...\n",
      " $ relaxation         : int  87 83 75 88 76 95 88 91 80 70 ...\n",
      " $ fasting.blood.sugar: int  94 147 79 91 91 101 84 100 104 64 ...\n",
      " $ Cholesterol        : int  172 194 178 180 155 199 222 282 243 183 ...\n",
      " $ triglyceride       : int  300 55 197 203 87 343 153 165 163 27 ...\n",
      " $ HDL                : int  40 57 45 38 44 31 69 51 59 55 ...\n",
      " $ LDL                : int  75 126 93 102 93 99 122 198 150 122 ...\n",
      " $ hemoglobin         : num  16.5 16.2 17.4 15.9 15.4 15.9 13 14.5 15.7 13.2 ...\n",
      " $ Urine.protein      : int  1 1 1 1 1 1 1 1 1 1 ...\n",
      " $ serum.creatinine   : num  1 1.1 0.8 1 0.8 0.7 0.7 0.7 0.9 0.7 ...\n",
      " $ AST                : int  22 27 27 20 19 24 17 16 24 22 ...\n",
      " $ ALT                : int  25 23 31 27 13 42 12 15 21 16 ...\n",
      " $ Gtp                : int  27 37 53 30 17 119 16 16 31 14 ...\n",
      " $ dental.caries      : int  0 1 0 1 0 1 0 0 0 0 ...\n",
      " $ smoking            : int  1 0 1 0 1 1 0 0 1 0 ...\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>159256</li><li>24</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 159256\n",
       "\\item 24\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 159256\n",
       "2. 24\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 159256     24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "smoking_train <- read.csv('/kaggle/input/playground-series-s3e24/train.csv', header= TRUE) \n",
    "\n",
    "\n",
    "head(smoking_train)\n",
    "str(smoking_train)\n",
    "dim(smoking_train)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "ce739657",
   "metadata": {
    "_cell_guid": "3a642bae-9893-455c-a956-81e6f0fb098c",
    "_uuid": "402bf466-7c6a-4ed1-8037-bb927d613953",
    "papermill": {
     "duration": 0.019809,
     "end_time": "2023-12-07T20:18:40.093848",
     "exception": false,
     "start_time": "2023-12-07T20:18:40.074039",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "**Missing Data**\n",
    "\n",
    "There was no missing values in the datasets"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 4,
   "id": "d17c9a86",
   "metadata": {
    "_cell_guid": "67e2f53f-25ae-444d-ba3a-b9b9015f74b1",
    "_uuid": "756649a6-f838-4bed-ab23-497ca2fbd7b5",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:40.137344Z",
     "iopub.status.busy": "2023-12-07T20:18:40.135572Z",
     "iopub.status.idle": "2023-12-07T20:18:41.765823Z",
     "shell.execute_reply": "2023-12-07T20:18:41.763014Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.65559,
     "end_time": "2023-12-07T20:18:41.769250",
     "exception": false,
     "start_time": "2023-12-07T20:18:40.113660",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: finalfit\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<dl>\n",
       "\t<dt>$Continuous</dt>\n",
       "\t\t<dd><table class=\"dataframe\">\n",
       "<caption>A data.frame: 24 × 12</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>label</th><th scope=col>var_type</th><th scope=col>n</th><th scope=col>missing_n</th><th scope=col>missing_percent</th><th scope=col>mean</th><th scope=col>sd</th><th scope=col>min</th><th scope=col>quartile_25</th><th scope=col>median</th><th scope=col>quartile_75</th><th scope=col>max</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;chr&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>id</th><td><span style=white-space:pre-wrap>id                 </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td>79627.5</td><td>45973.4</td><td><span style=white-space:pre-wrap>0.0  </span></td><td>39813.8</td><td>79627.5</td><td>119441.2</td><td>159255.0</td></tr>\n",
       "\t<tr><th scope=row>age</th><td><span style=white-space:pre-wrap>age                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>44.3   </span></td><td><span style=white-space:pre-wrap>11.8   </span></td><td>20.0 </td><td><span style=white-space:pre-wrap>40.0   </span></td><td><span style=white-space:pre-wrap>40.0   </span></td><td><span style=white-space:pre-wrap>55.0    </span></td><td><span style=white-space:pre-wrap>85.0    </span></td></tr>\n",
       "\t<tr><th scope=row>height.cm.</th><td><span style=white-space:pre-wrap>height.cm.         </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>165.3  </span></td><td><span style=white-space:pre-wrap>8.8    </span></td><td>135.0</td><td><span style=white-space:pre-wrap>160.0  </span></td><td><span style=white-space:pre-wrap>165.0  </span></td><td><span style=white-space:pre-wrap>170.0   </span></td><td><span style=white-space:pre-wrap>190.0   </span></td></tr>\n",
       "\t<tr><th scope=row>weight.kg.</th><td><span style=white-space:pre-wrap>weight.kg.         </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>67.1   </span></td><td><span style=white-space:pre-wrap>12.6   </span></td><td>30.0 </td><td><span style=white-space:pre-wrap>60.0   </span></td><td><span style=white-space:pre-wrap>65.0   </span></td><td><span style=white-space:pre-wrap>75.0    </span></td><td><span style=white-space:pre-wrap>130.0   </span></td></tr>\n",
       "\t<tr><th scope=row>waist.cm.</th><td><span style=white-space:pre-wrap>waist.cm.          </span></td><td>&lt;dbl&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>83.0   </span></td><td><span style=white-space:pre-wrap>9.0    </span></td><td>51.0 </td><td><span style=white-space:pre-wrap>77.0   </span></td><td><span style=white-space:pre-wrap>83.0   </span></td><td><span style=white-space:pre-wrap>89.0    </span></td><td><span style=white-space:pre-wrap>127.0   </span></td></tr>\n",
       "\t<tr><th scope=row>eyesight.left.</th><td><span style=white-space:pre-wrap>eyesight.left.     </span></td><td>&lt;dbl&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>0.4    </span></td><td><span style=white-space:pre-wrap>0.1  </span></td><td><span style=white-space:pre-wrap>0.8    </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.2     </span></td><td><span style=white-space:pre-wrap>9.9     </span></td></tr>\n",
       "\t<tr><th scope=row>eyesight.right.</th><td><span style=white-space:pre-wrap>eyesight.right.    </span></td><td>&lt;dbl&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>0.4    </span></td><td><span style=white-space:pre-wrap>0.1  </span></td><td><span style=white-space:pre-wrap>0.8    </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.2     </span></td><td><span style=white-space:pre-wrap>9.9     </span></td></tr>\n",
       "\t<tr><th scope=row>hearing.left.</th><td><span style=white-space:pre-wrap>hearing.left.      </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>0.2    </span></td><td><span style=white-space:pre-wrap>1.0  </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0     </span></td><td><span style=white-space:pre-wrap>2.0     </span></td></tr>\n",
       "\t<tr><th scope=row>hearing.right.</th><td><span style=white-space:pre-wrap>hearing.right.     </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>0.2    </span></td><td><span style=white-space:pre-wrap>1.0  </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0     </span></td><td><span style=white-space:pre-wrap>2.0     </span></td></tr>\n",
       "\t<tr><th scope=row>systolic</th><td><span style=white-space:pre-wrap>systolic           </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>122.5  </span></td><td><span style=white-space:pre-wrap>12.7   </span></td><td>77.0 </td><td><span style=white-space:pre-wrap>114.0  </span></td><td><span style=white-space:pre-wrap>121.0  </span></td><td><span style=white-space:pre-wrap>130.0   </span></td><td><span style=white-space:pre-wrap>213.0   </span></td></tr>\n",
       "\t<tr><th scope=row>relaxation</th><td><span style=white-space:pre-wrap>relaxation         </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>76.9   </span></td><td><span style=white-space:pre-wrap>9.0    </span></td><td>44.0 </td><td><span style=white-space:pre-wrap>70.0   </span></td><td><span style=white-space:pre-wrap>78.0   </span></td><td><span style=white-space:pre-wrap>82.0    </span></td><td><span style=white-space:pre-wrap>133.0   </span></td></tr>\n",
       "\t<tr><th scope=row>fasting.blood.sugar</th><td>fasting.blood.sugar</td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>98.4   </span></td><td><span style=white-space:pre-wrap>15.3   </span></td><td>46.0 </td><td><span style=white-space:pre-wrap>90.0   </span></td><td><span style=white-space:pre-wrap>96.0   </span></td><td><span style=white-space:pre-wrap>103.0   </span></td><td><span style=white-space:pre-wrap>375.0   </span></td></tr>\n",
       "\t<tr><th scope=row>Cholesterol</th><td><span style=white-space:pre-wrap>Cholesterol        </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>195.8  </span></td><td><span style=white-space:pre-wrap>28.4   </span></td><td>77.0 </td><td><span style=white-space:pre-wrap>175.0  </span></td><td><span style=white-space:pre-wrap>196.0  </span></td><td><span style=white-space:pre-wrap>217.0   </span></td><td><span style=white-space:pre-wrap>393.0   </span></td></tr>\n",
       "\t<tr><th scope=row>triglyceride</th><td><span style=white-space:pre-wrap>triglyceride       </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>127.6  </span></td><td><span style=white-space:pre-wrap>66.2   </span></td><td><span style=white-space:pre-wrap>8.0  </span></td><td><span style=white-space:pre-wrap>77.0   </span></td><td><span style=white-space:pre-wrap>115.0  </span></td><td><span style=white-space:pre-wrap>165.0   </span></td><td><span style=white-space:pre-wrap>766.0   </span></td></tr>\n",
       "\t<tr><th scope=row>HDL</th><td><span style=white-space:pre-wrap>HDL                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>55.9   </span></td><td><span style=white-space:pre-wrap>14.0   </span></td><td><span style=white-space:pre-wrap>9.0  </span></td><td><span style=white-space:pre-wrap>45.0   </span></td><td><span style=white-space:pre-wrap>54.0   </span></td><td><span style=white-space:pre-wrap>64.0    </span></td><td><span style=white-space:pre-wrap>136.0   </span></td></tr>\n",
       "\t<tr><th scope=row>LDL</th><td><span style=white-space:pre-wrap>LDL                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>114.6  </span></td><td><span style=white-space:pre-wrap>28.2   </span></td><td><span style=white-space:pre-wrap>1.0  </span></td><td><span style=white-space:pre-wrap>95.0   </span></td><td><span style=white-space:pre-wrap>114.0  </span></td><td><span style=white-space:pre-wrap>133.0   </span></td><td><span style=white-space:pre-wrap>1860.0  </span></td></tr>\n",
       "\t<tr><th scope=row>hemoglobin</th><td><span style=white-space:pre-wrap>hemoglobin         </span></td><td>&lt;dbl&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>14.8   </span></td><td><span style=white-space:pre-wrap>1.4    </span></td><td><span style=white-space:pre-wrap>4.9  </span></td><td><span style=white-space:pre-wrap>13.8   </span></td><td><span style=white-space:pre-wrap>15.0   </span></td><td><span style=white-space:pre-wrap>15.8    </span></td><td><span style=white-space:pre-wrap>21.0    </span></td></tr>\n",
       "\t<tr><th scope=row>Urine.protein</th><td><span style=white-space:pre-wrap>Urine.protein      </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>1.1    </span></td><td><span style=white-space:pre-wrap>0.3    </span></td><td><span style=white-space:pre-wrap>1.0  </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0    </span></td><td><span style=white-space:pre-wrap>1.0     </span></td><td><span style=white-space:pre-wrap>6.0     </span></td></tr>\n",
       "\t<tr><th scope=row>serum.creatinine</th><td><span style=white-space:pre-wrap>serum.creatinine   </span></td><td>&lt;dbl&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>0.9    </span></td><td><span style=white-space:pre-wrap>0.2    </span></td><td><span style=white-space:pre-wrap>0.1  </span></td><td><span style=white-space:pre-wrap>0.8    </span></td><td><span style=white-space:pre-wrap>0.9    </span></td><td><span style=white-space:pre-wrap>1.0     </span></td><td><span style=white-space:pre-wrap>9.9     </span></td></tr>\n",
       "\t<tr><th scope=row>AST</th><td><span style=white-space:pre-wrap>AST                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>25.5   </span></td><td><span style=white-space:pre-wrap>9.5    </span></td><td><span style=white-space:pre-wrap>6.0  </span></td><td><span style=white-space:pre-wrap>20.0   </span></td><td><span style=white-space:pre-wrap>24.0   </span></td><td><span style=white-space:pre-wrap>29.0    </span></td><td><span style=white-space:pre-wrap>778.0   </span></td></tr>\n",
       "\t<tr><th scope=row>ALT</th><td><span style=white-space:pre-wrap>ALT                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>26.6   </span></td><td><span style=white-space:pre-wrap>17.8   </span></td><td><span style=white-space:pre-wrap>1.0  </span></td><td><span style=white-space:pre-wrap>16.0   </span></td><td><span style=white-space:pre-wrap>22.0   </span></td><td><span style=white-space:pre-wrap>32.0    </span></td><td><span style=white-space:pre-wrap>2914.0  </span></td></tr>\n",
       "\t<tr><th scope=row>Gtp</th><td><span style=white-space:pre-wrap>Gtp                </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>36.2   </span></td><td><span style=white-space:pre-wrap>31.2   </span></td><td><span style=white-space:pre-wrap>2.0  </span></td><td><span style=white-space:pre-wrap>18.0   </span></td><td><span style=white-space:pre-wrap>27.0   </span></td><td><span style=white-space:pre-wrap>44.0    </span></td><td><span style=white-space:pre-wrap>999.0   </span></td></tr>\n",
       "\t<tr><th scope=row>dental.caries</th><td><span style=white-space:pre-wrap>dental.caries      </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>0.2    </span></td><td><span style=white-space:pre-wrap>0.4    </span></td><td><span style=white-space:pre-wrap>0.0  </span></td><td><span style=white-space:pre-wrap>0.0    </span></td><td><span style=white-space:pre-wrap>0.0    </span></td><td><span style=white-space:pre-wrap>0.0     </span></td><td><span style=white-space:pre-wrap>1.0     </span></td></tr>\n",
       "\t<tr><th scope=row>smoking</th><td><span style=white-space:pre-wrap>smoking            </span></td><td>&lt;int&gt;</td><td>159256</td><td>0</td><td>0.0</td><td><span style=white-space:pre-wrap>0.4    </span></td><td><span style=white-space:pre-wrap>0.5    </span></td><td><span style=white-space:pre-wrap>0.0  </span></td><td><span style=white-space:pre-wrap>0.0    </span></td><td><span style=white-space:pre-wrap>0.0    </span></td><td><span style=white-space:pre-wrap>1.0     </span></td><td><span style=white-space:pre-wrap>1.0     </span></td></tr>\n",
       "</tbody>\n",
       "</table>\n",
       "</dd>\n",
       "\t<dt>$Categorical</dt>\n",
       "\t\t<dd></dd>\n",
       "</dl>\n"
      ],
      "text/latex": [
       "\\begin{description}\n",
       "\\item[\\$Continuous] A data.frame: 24 × 12\n",
       "\\begin{tabular}{r|llllllllllll}\n",
       "  & label & var\\_type & n & missing\\_n & missing\\_percent & mean & sd & min & quartile\\_25 & median & quartile\\_75 & max\\\\\n",
       "  & <chr> & <chr> & <int> & <int> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr> & <chr>\\\\\n",
       "\\hline\n",
       "\tid & id                  & <int> & 159256 & 0 & 0.0 & 79627.5 & 45973.4 & 0.0   & 39813.8 & 79627.5 & 119441.2 & 159255.0\\\\\n",
       "\tage & age                 & <int> & 159256 & 0 & 0.0 & 44.3    & 11.8    & 20.0  & 40.0    & 40.0    & 55.0     & 85.0    \\\\\n",
       "\theight.cm. & height.cm.          & <int> & 159256 & 0 & 0.0 & 165.3   & 8.8     & 135.0 & 160.0   & 165.0   & 170.0    & 190.0   \\\\\n",
       "\tweight.kg. & weight.kg.          & <int> & 159256 & 0 & 0.0 & 67.1    & 12.6    & 30.0  & 60.0    & 65.0    & 75.0     & 130.0   \\\\\n",
       "\twaist.cm. & waist.cm.           & <dbl> & 159256 & 0 & 0.0 & 83.0    & 9.0     & 51.0  & 77.0    & 83.0    & 89.0     & 127.0   \\\\\n",
       "\teyesight.left. & eyesight.left.      & <dbl> & 159256 & 0 & 0.0 & 1.0     & 0.4     & 0.1   & 0.8     & 1.0     & 1.2      & 9.9     \\\\\n",
       "\teyesight.right. & eyesight.right.     & <dbl> & 159256 & 0 & 0.0 & 1.0     & 0.4     & 0.1   & 0.8     & 1.0     & 1.2      & 9.9     \\\\\n",
       "\thearing.left. & hearing.left.       & <int> & 159256 & 0 & 0.0 & 1.0     & 0.2     & 1.0   & 1.0     & 1.0     & 1.0      & 2.0     \\\\\n",
       "\thearing.right. & hearing.right.      & <int> & 159256 & 0 & 0.0 & 1.0     & 0.2     & 1.0   & 1.0     & 1.0     & 1.0      & 2.0     \\\\\n",
       "\tsystolic & systolic            & <int> & 159256 & 0 & 0.0 & 122.5   & 12.7    & 77.0  & 114.0   & 121.0   & 130.0    & 213.0   \\\\\n",
       "\trelaxation & relaxation          & <int> & 159256 & 0 & 0.0 & 76.9    & 9.0     & 44.0  & 70.0    & 78.0    & 82.0     & 133.0   \\\\\n",
       "\tfasting.blood.sugar & fasting.blood.sugar & <int> & 159256 & 0 & 0.0 & 98.4    & 15.3    & 46.0  & 90.0    & 96.0    & 103.0    & 375.0   \\\\\n",
       "\tCholesterol & Cholesterol         & <int> & 159256 & 0 & 0.0 & 195.8   & 28.4    & 77.0  & 175.0   & 196.0   & 217.0    & 393.0   \\\\\n",
       "\ttriglyceride & triglyceride        & <int> & 159256 & 0 & 0.0 & 127.6   & 66.2    & 8.0   & 77.0    & 115.0   & 165.0    & 766.0   \\\\\n",
       "\tHDL & HDL                 & <int> & 159256 & 0 & 0.0 & 55.9    & 14.0    & 9.0   & 45.0    & 54.0    & 64.0     & 136.0   \\\\\n",
       "\tLDL & LDL                 & <int> & 159256 & 0 & 0.0 & 114.6   & 28.2    & 1.0   & 95.0    & 114.0   & 133.0    & 1860.0  \\\\\n",
       "\themoglobin & hemoglobin          & <dbl> & 159256 & 0 & 0.0 & 14.8    & 1.4     & 4.9   & 13.8    & 15.0    & 15.8     & 21.0    \\\\\n",
       "\tUrine.protein & Urine.protein       & <int> & 159256 & 0 & 0.0 & 1.1     & 0.3     & 1.0   & 1.0     & 1.0     & 1.0      & 6.0     \\\\\n",
       "\tserum.creatinine & serum.creatinine    & <dbl> & 159256 & 0 & 0.0 & 0.9     & 0.2     & 0.1   & 0.8     & 0.9     & 1.0      & 9.9     \\\\\n",
       "\tAST & AST                 & <int> & 159256 & 0 & 0.0 & 25.5    & 9.5     & 6.0   & 20.0    & 24.0    & 29.0     & 778.0   \\\\\n",
       "\tALT & ALT                 & <int> & 159256 & 0 & 0.0 & 26.6    & 17.8    & 1.0   & 16.0    & 22.0    & 32.0     & 2914.0  \\\\\n",
       "\tGtp & Gtp                 & <int> & 159256 & 0 & 0.0 & 36.2    & 31.2    & 2.0   & 18.0    & 27.0    & 44.0     & 999.0   \\\\\n",
       "\tdental.caries & dental.caries       & <int> & 159256 & 0 & 0.0 & 0.2     & 0.4     & 0.0   & 0.0     & 0.0     & 0.0      & 1.0     \\\\\n",
       "\tsmoking & smoking             & <int> & 159256 & 0 & 0.0 & 0.4     & 0.5     & 0.0   & 0.0     & 0.0     & 1.0      & 1.0     \\\\\n",
       "\\end{tabular}\n",
       "\n",
       "\\item[\\$Categorical] \n",
       "\\end{description}\n"
      ],
      "text/markdown": [
       "$Continuous\n",
       ":   \n",
       "A data.frame: 24 × 12\n",
       "\n",
       "| <!--/--> | label &lt;chr&gt; | var_type &lt;chr&gt; | n &lt;int&gt; | missing_n &lt;int&gt; | missing_percent &lt;chr&gt; | mean &lt;chr&gt; | sd &lt;chr&gt; | min &lt;chr&gt; | quartile_25 &lt;chr&gt; | median &lt;chr&gt; | quartile_75 &lt;chr&gt; | max &lt;chr&gt; |\n",
       "|---|---|---|---|---|---|---|---|---|---|---|---|---|\n",
       "| id | id                  | &lt;int&gt; | 159256 | 0 | 0.0 | 79627.5 | 45973.4 | 0.0   | 39813.8 | 79627.5 | 119441.2 | 159255.0 |\n",
       "| age | age                 | &lt;int&gt; | 159256 | 0 | 0.0 | 44.3    | 11.8    | 20.0  | 40.0    | 40.0    | 55.0     | 85.0     |\n",
       "| height.cm. | height.cm.          | &lt;int&gt; | 159256 | 0 | 0.0 | 165.3   | 8.8     | 135.0 | 160.0   | 165.0   | 170.0    | 190.0    |\n",
       "| weight.kg. | weight.kg.          | &lt;int&gt; | 159256 | 0 | 0.0 | 67.1    | 12.6    | 30.0  | 60.0    | 65.0    | 75.0     | 130.0    |\n",
       "| waist.cm. | waist.cm.           | &lt;dbl&gt; | 159256 | 0 | 0.0 | 83.0    | 9.0     | 51.0  | 77.0    | 83.0    | 89.0     | 127.0    |\n",
       "| eyesight.left. | eyesight.left.      | &lt;dbl&gt; | 159256 | 0 | 0.0 | 1.0     | 0.4     | 0.1   | 0.8     | 1.0     | 1.2      | 9.9      |\n",
       "| eyesight.right. | eyesight.right.     | &lt;dbl&gt; | 159256 | 0 | 0.0 | 1.0     | 0.4     | 0.1   | 0.8     | 1.0     | 1.2      | 9.9      |\n",
       "| hearing.left. | hearing.left.       | &lt;int&gt; | 159256 | 0 | 0.0 | 1.0     | 0.2     | 1.0   | 1.0     | 1.0     | 1.0      | 2.0      |\n",
       "| hearing.right. | hearing.right.      | &lt;int&gt; | 159256 | 0 | 0.0 | 1.0     | 0.2     | 1.0   | 1.0     | 1.0     | 1.0      | 2.0      |\n",
       "| systolic | systolic            | &lt;int&gt; | 159256 | 0 | 0.0 | 122.5   | 12.7    | 77.0  | 114.0   | 121.0   | 130.0    | 213.0    |\n",
       "| relaxation | relaxation          | &lt;int&gt; | 159256 | 0 | 0.0 | 76.9    | 9.0     | 44.0  | 70.0    | 78.0    | 82.0     | 133.0    |\n",
       "| fasting.blood.sugar | fasting.blood.sugar | &lt;int&gt; | 159256 | 0 | 0.0 | 98.4    | 15.3    | 46.0  | 90.0    | 96.0    | 103.0    | 375.0    |\n",
       "| Cholesterol | Cholesterol         | &lt;int&gt; | 159256 | 0 | 0.0 | 195.8   | 28.4    | 77.0  | 175.0   | 196.0   | 217.0    | 393.0    |\n",
       "| triglyceride | triglyceride        | &lt;int&gt; | 159256 | 0 | 0.0 | 127.6   | 66.2    | 8.0   | 77.0    | 115.0   | 165.0    | 766.0    |\n",
       "| HDL | HDL                 | &lt;int&gt; | 159256 | 0 | 0.0 | 55.9    | 14.0    | 9.0   | 45.0    | 54.0    | 64.0     | 136.0    |\n",
       "| LDL | LDL                 | &lt;int&gt; | 159256 | 0 | 0.0 | 114.6   | 28.2    | 1.0   | 95.0    | 114.0   | 133.0    | 1860.0   |\n",
       "| hemoglobin | hemoglobin          | &lt;dbl&gt; | 159256 | 0 | 0.0 | 14.8    | 1.4     | 4.9   | 13.8    | 15.0    | 15.8     | 21.0     |\n",
       "| Urine.protein | Urine.protein       | &lt;int&gt; | 159256 | 0 | 0.0 | 1.1     | 0.3     | 1.0   | 1.0     | 1.0     | 1.0      | 6.0      |\n",
       "| serum.creatinine | serum.creatinine    | &lt;dbl&gt; | 159256 | 0 | 0.0 | 0.9     | 0.2     | 0.1   | 0.8     | 0.9     | 1.0      | 9.9      |\n",
       "| AST | AST                 | &lt;int&gt; | 159256 | 0 | 0.0 | 25.5    | 9.5     | 6.0   | 20.0    | 24.0    | 29.0     | 778.0    |\n",
       "| ALT | ALT                 | &lt;int&gt; | 159256 | 0 | 0.0 | 26.6    | 17.8    | 1.0   | 16.0    | 22.0    | 32.0     | 2914.0   |\n",
       "| Gtp | Gtp                 | &lt;int&gt; | 159256 | 0 | 0.0 | 36.2    | 31.2    | 2.0   | 18.0    | 27.0    | 44.0     | 999.0    |\n",
       "| dental.caries | dental.caries       | &lt;int&gt; | 159256 | 0 | 0.0 | 0.2     | 0.4     | 0.0   | 0.0     | 0.0     | 0.0      | 1.0      |\n",
       "| smoking | smoking             | &lt;int&gt; | 159256 | 0 | 0.0 | 0.4     | 0.5     | 0.0   | 0.0     | 0.0     | 1.0      | 1.0      |\n",
       "\n",
       "\n",
       "$Categorical\n",
       ":   \n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "$Continuous\n",
       "                                  label var_type      n missing_n\n",
       "id                                   id    <int> 159256         0\n",
       "age                                 age    <int> 159256         0\n",
       "height.cm.                   height.cm.    <int> 159256         0\n",
       "weight.kg.                   weight.kg.    <int> 159256         0\n",
       "waist.cm.                     waist.cm.    <dbl> 159256         0\n",
       "eyesight.left.           eyesight.left.    <dbl> 159256         0\n",
       "eyesight.right.         eyesight.right.    <dbl> 159256         0\n",
       "hearing.left.             hearing.left.    <int> 159256         0\n",
       "hearing.right.           hearing.right.    <int> 159256         0\n",
       "systolic                       systolic    <int> 159256         0\n",
       "relaxation                   relaxation    <int> 159256         0\n",
       "fasting.blood.sugar fasting.blood.sugar    <int> 159256         0\n",
       "Cholesterol                 Cholesterol    <int> 159256         0\n",
       "triglyceride               triglyceride    <int> 159256         0\n",
       "HDL                                 HDL    <int> 159256         0\n",
       "LDL                                 LDL    <int> 159256         0\n",
       "hemoglobin                   hemoglobin    <dbl> 159256         0\n",
       "Urine.protein             Urine.protein    <int> 159256         0\n",
       "serum.creatinine       serum.creatinine    <dbl> 159256         0\n",
       "AST                                 AST    <int> 159256         0\n",
       "ALT                                 ALT    <int> 159256         0\n",
       "Gtp                                 Gtp    <int> 159256         0\n",
       "dental.caries             dental.caries    <int> 159256         0\n",
       "smoking                         smoking    <int> 159256         0\n",
       "                    missing_percent    mean      sd   min quartile_25  median\n",
       "id                              0.0 79627.5 45973.4   0.0     39813.8 79627.5\n",
       "age                             0.0    44.3    11.8  20.0        40.0    40.0\n",
       "height.cm.                      0.0   165.3     8.8 135.0       160.0   165.0\n",
       "weight.kg.                      0.0    67.1    12.6  30.0        60.0    65.0\n",
       "waist.cm.                       0.0    83.0     9.0  51.0        77.0    83.0\n",
       "eyesight.left.                  0.0     1.0     0.4   0.1         0.8     1.0\n",
       "eyesight.right.                 0.0     1.0     0.4   0.1         0.8     1.0\n",
       "hearing.left.                   0.0     1.0     0.2   1.0         1.0     1.0\n",
       "hearing.right.                  0.0     1.0     0.2   1.0         1.0     1.0\n",
       "systolic                        0.0   122.5    12.7  77.0       114.0   121.0\n",
       "relaxation                      0.0    76.9     9.0  44.0        70.0    78.0\n",
       "fasting.blood.sugar             0.0    98.4    15.3  46.0        90.0    96.0\n",
       "Cholesterol                     0.0   195.8    28.4  77.0       175.0   196.0\n",
       "triglyceride                    0.0   127.6    66.2   8.0        77.0   115.0\n",
       "HDL                             0.0    55.9    14.0   9.0        45.0    54.0\n",
       "LDL                             0.0   114.6    28.2   1.0        95.0   114.0\n",
       "hemoglobin                      0.0    14.8     1.4   4.9        13.8    15.0\n",
       "Urine.protein                   0.0     1.1     0.3   1.0         1.0     1.0\n",
       "serum.creatinine                0.0     0.9     0.2   0.1         0.8     0.9\n",
       "AST                             0.0    25.5     9.5   6.0        20.0    24.0\n",
       "ALT                             0.0    26.6    17.8   1.0        16.0    22.0\n",
       "Gtp                             0.0    36.2    31.2   2.0        18.0    27.0\n",
       "dental.caries                   0.0     0.2     0.4   0.0         0.0     0.0\n",
       "smoking                         0.0     0.4     0.5   0.0         0.0     0.0\n",
       "                    quartile_75      max\n",
       "id                     119441.2 159255.0\n",
       "age                        55.0     85.0\n",
       "height.cm.                170.0    190.0\n",
       "weight.kg.                 75.0    130.0\n",
       "waist.cm.                  89.0    127.0\n",
       "eyesight.left.              1.2      9.9\n",
       "eyesight.right.             1.2      9.9\n",
       "hearing.left.               1.0      2.0\n",
       "hearing.right.              1.0      2.0\n",
       "systolic                  130.0    213.0\n",
       "relaxation                 82.0    133.0\n",
       "fasting.blood.sugar       103.0    375.0\n",
       "Cholesterol               217.0    393.0\n",
       "triglyceride              165.0    766.0\n",
       "HDL                        64.0    136.0\n",
       "LDL                       133.0   1860.0\n",
       "hemoglobin                 15.8     21.0\n",
       "Urine.protein               1.0      6.0\n",
       "serum.creatinine            1.0      9.9\n",
       "AST                        29.0    778.0\n",
       "ALT                        32.0   2914.0\n",
       "Gtp                        44.0    999.0\n",
       "dental.caries               0.0      1.0\n",
       "smoking                     1.0      1.0\n",
       "\n",
       "$Categorical\n",
       "data frame with 0 columns and 159256 rows\n"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "require(finalfit)\n",
    "\n",
    "ff_glimpse(smoking_train)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "86a1eaa1",
   "metadata": {
    "_cell_guid": "5abbea10-b98e-4ccf-9004-3ad5759532f4",
    "_uuid": "9cfa9d27-ad4f-468c-8038-9f5962241d2d",
    "papermill": {
     "duration": 0.020866,
     "end_time": "2023-12-07T20:18:41.810928",
     "exception": false,
     "start_time": "2023-12-07T20:18:41.790062",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Preprocessing Data**\n",
    "\n",
    "I tried converting the factor features into factors using the recipe package functions but it kept breaking when I run the models. So I did do manually. Is there something wrong with the way I wrote the code?"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 5,
   "id": "3746283f",
   "metadata": {
    "_cell_guid": "8052e32e-1ca9-4836-84e8-202a97e226d9",
    "_uuid": "f51ad367-4021-432f-a5a6-9b55af14f57b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:41.856012Z",
     "iopub.status.busy": "2023-12-07T20:18:41.854308Z",
     "iopub.status.idle": "2023-12-07T20:18:41.957251Z",
     "shell.execute_reply": "2023-12-07T20:18:41.954843Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.128683,
     "end_time": "2023-12-07T20:18:41.960037",
     "exception": false,
     "start_time": "2023-12-07T20:18:41.831354",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "smoking_train <- clean_names(smoking_train)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 6,
   "id": "c22af2c5",
   "metadata": {
    "_cell_guid": "9ea4dd2f-ac5d-4b1a-b6f3-12914f7af78f",
    "_uuid": "a92acda8-74f6-47e8-86df-37401a1c4bcf",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:42.005708Z",
     "iopub.status.busy": "2023-12-07T20:18:42.003842Z",
     "iopub.status.idle": "2023-12-07T20:18:42.524850Z",
     "shell.execute_reply": "2023-12-07T20:18:42.522472Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.547159,
     "end_time": "2023-12-07T20:18:42.527940",
     "exception": false,
     "start_time": "2023-12-07T20:18:41.980781",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "\u001b[36m──\u001b[39m \u001b[1mRecipe\u001b[22m \u001b[36m──────────────────────────────────────────────────────────────────────\u001b[39m\n",
      "\n",
      "\n",
      "\n",
      "── Inputs \n",
      "\n",
      "Number of variables by role\n",
      "\n",
      "outcome:    1\n",
      "predictor: 22\n",
      "id:         1\n",
      "\n",
      "\n",
      "\n",
      "── Operations \n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34m\"hearing_left\"\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34m\"hearing_right\"\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34m\"urine_protein\"\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34m\"dental_caries\"\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34m\"smoking\"\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Creating missing data variable indicators for: \u001b[34mall_predictors()\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Dummy variables from: \u001b[34mc(\"hearing_left\", \"hearing_right\", \"urine_protein\",\u001b[39m\n",
      "  \u001b[34m\"dental_caries\")\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Zero variance filter on: \u001b[34mall_numeric()\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Centering and scaling for: \u001b[34mall_numeric()\u001b[39m\n",
      "\n",
      "\u001b[36m•\u001b[39m Sparse, unbalanced variable filter on: \u001b[34mall_numeric()\u001b[39m\n",
      "\n"
     ]
    }
   ],
   "source": [
    "\n",
    "blueprint_smoking <- recipe(x  = smoking_train,\n",
    "                          vars  = colnames(smoking_train),\n",
    "                          roles = c('id',rep('predictor',22), 'outcome')) %>%\n",
    "step_num2factor(\"hearing_left\", levels = c(\"No\", \"Yes\"))  %>%\n",
    "step_num2factor(\"hearing_right\", levels = c(\"No\", \"Yes\")) %>%\n",
    "step_num2factor(\"urine_protein\", levels = c(\"one\", \"two\", \"three\", \"four\", \"five\", \"six\"))  %>%\n",
    "step_num2factor(\"dental_caries\",\n",
    "                  transform = function(x) x + 1,\n",
    "                  levels=c('Negative','Positive'))  %>%\n",
    "step_num2factor(\"smoking\",\n",
    "                  transform = function(x) x + 1,\n",
    "                  levels=c('Negative', 'Positive')) %>%\n",
    "step_indicate_na(all_predictors()) %>%\n",
    "step_dummy(c(\"hearing_left\",\"hearing_right\",\"urine_protein\",\"dental_caries\"),one_hot=TRUE)  %>%\n",
    "step_zv(all_numeric())  %>%\n",
    "step_normalize(all_numeric())  %>%\n",
    "step_nzv(all_numeric()) \n",
    "\n",
    "blueprint_smoking"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 7,
   "id": "3379e2d6",
   "metadata": {
    "_cell_guid": "e8e7f739-98df-431a-ac35-e33df2919ef8",
    "_uuid": "23529149-9291-46ac-aab8-6e5e186219bf",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:42.577458Z",
     "iopub.status.busy": "2023-12-07T20:18:42.575527Z",
     "iopub.status.idle": "2023-12-07T20:18:54.480541Z",
     "shell.execute_reply": "2023-12-07T20:18:54.478419Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 11.932958,
     "end_time": "2023-12-07T20:18:54.483448",
     "exception": false,
     "start_time": "2023-12-07T20:18:42.550490",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "\n",
      "\n",
      "\u001b[36m──\u001b[39m \u001b[1mRecipe\u001b[22m \u001b[36m──────────────────────────────────────────────────────────────────────\u001b[39m\n",
      "\n",
      "\n",
      "\n",
      "── Inputs \n",
      "\n",
      "Number of variables by role\n",
      "\n",
      "outcome:    1\n",
      "predictor: 22\n",
      "id:         1\n",
      "\n",
      "\n",
      "\n",
      "── Training information \n",
      "\n",
      "Training data contained 159256 data points and no incomplete rows.\n",
      "\n",
      "\n",
      "\n",
      "── Operations \n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34mhearing_left\u001b[39m | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34mhearing_right\u001b[39m | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34murine_protein\u001b[39m | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34mdental_caries\u001b[39m | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Factor variables from: \u001b[34msmoking\u001b[39m | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Creating missing data variable indicators for: \u001b[34mage\u001b[39m, \u001b[34mheight_cm\u001b[39m, ... | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Dummy variables from: \u001b[34mhearing_left\u001b[39m, \u001b[34mhearing_right\u001b[39m, ... | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Zero variance filter removed: \u001b[34mna_ind_age\u001b[39m, \u001b[34mna_ind_height_cm\u001b[39m, ... | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Centering and scaling for: \u001b[34mid\u001b[39m, \u001b[34mage\u001b[39m, \u001b[34mheight_cm\u001b[39m, \u001b[34mweight_kg\u001b[39m, ... | \u001b[3mTrained\u001b[23m\n",
      "\n",
      "\u001b[36m•\u001b[39m Sparse, unbalanced variable filter removed: \u001b[34mhearing_left_No\u001b[39m, ... | \u001b[3mTrained\u001b[23m\n",
      "\n"
     ]
    }
   ],
   "source": [
    "prepare   <- prep(blueprint_smoking, \n",
    "                  training = smoking_train)\n",
    "\n",
    "baked_smoking <- bake(prepare, new_data = smoking_train)\n",
    "\n",
    "prepare"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 8,
   "id": "09c30312",
   "metadata": {
    "_cell_guid": "fb90f6d3-bd61-40a6-9ef9-89f341e2dfd1",
    "_uuid": "d1541cfb-d009-40ae-a2e5-31ef1fbcc3b4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:54.536975Z",
     "iopub.status.busy": "2023-12-07T20:18:54.534995Z",
     "iopub.status.idle": "2023-12-07T20:18:54.577168Z",
     "shell.execute_reply": "2023-12-07T20:18:54.574273Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.071861,
     "end_time": "2023-12-07T20:18:54.580315",
     "exception": false,
     "start_time": "2023-12-07T20:18:54.508454",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "tibble [159,256 × 23] (S3: tbl_df/tbl/data.frame)\n",
      " $ id                    : num [1:159256] -1.73 -1.73 -1.73 -1.73 -1.73 ...\n",
      " $ age                   : num [1:159256] 0.903 2.17 -2.053 -0.786 -1.208 ...\n",
      " $ height_cm             : num [1:159256] -0.0303 -0.0303 0.5367 1.6706 -0.0303 ...\n",
      " $ weight_kg             : num [1:159256] -0.568 -0.17 0.624 2.213 -0.568 ...\n",
      " $ waist_cm              : num [1:159256] -0.223 0.67 -0.223 2.456 -0.279 ...\n",
      " $ eyesight_left         : num [1:159256] -1.26 -1.01 -1.51 1.23 1.23 ...\n",
      " $ eyesight_right        : num [1:159256] -1.02215 -0.76724 -1.27706 0.50729 -0.00252 ...\n",
      " $ systolic              : num [1:159256] 0.982 1.846 -0.354 0.667 -0.118 ...\n",
      " $ relaxation            : num [1:159256] 1.1258 0.6811 -0.2084 1.237 -0.0972 ...\n",
      " $ fasting_blood_sugar   : num [1:159256] -0.284 3.173 -1.262 -0.48 -0.48 ...\n",
      " $ cholesterol           : num [1:159256] -0.838 -0.0633 -0.6267 -0.5563 -1.4366 ...\n",
      " $ triglyceride          : num [1:159256] 2.604 -1.097 1.048 1.139 -0.614 ...\n",
      " $ hdl                   : num [1:159256] -1.1352 0.0822 -0.7772 -1.2785 -0.8488 ...\n",
      " $ ldl                   : num [1:159256] -1.407 0.405 -0.767 -0.448 -0.767 ...\n",
      " $ hemoglobin            : num [1:159256] 1.19 0.98 1.819 0.771 0.421 ...\n",
      " $ serum_creatinine      : num [1:159256] 0.598 1.156 -0.517 0.598 -0.517 ...\n",
      " $ ast                   : num [1:159256] -0.372 0.157 0.157 -0.583 -0.689 ...\n",
      " $ alt                   : num [1:159256] -0.0873 -0.2 0.2506 0.0253 -0.7633 ...\n",
      " $ gtp                   : num [1:159256] -0.2953 0.0251 0.5379 -0.1992 -0.6158 ...\n",
      " $ smoking               : Factor w/ 2 levels \"Negative\",\"Positive\": 2 1 2 1 2 2 1 1 2 1 ...\n",
      " $ urine_protein_one     : num [1:159256] 0.236 0.236 0.236 0.236 0.236 ...\n",
      " $ dental_caries_Negative: num [1:159256] 0.497 -2.013 0.497 -2.013 0.497 ...\n",
      " $ dental_caries_Positive: num [1:159256] -0.497 2.013 -0.497 2.013 -0.497 ...\n"
     ]
    }
   ],
   "source": [
    "str(baked_smoking)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "4a2f182e",
   "metadata": {
    "_cell_guid": "258cc7b5-c662-48dd-aafe-bd157ae83b0e",
    "_uuid": "6ceb4230-2364-4ddd-9666-239eb3884b61",
    "papermill": {
     "duration": 0.024399,
     "end_time": "2023-12-07T20:18:54.629302",
     "exception": false,
     "start_time": "2023-12-07T20:18:54.604903",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Train/Test Split** \n",
    "\n",
    "Although a seperate test dataset was provided, the train data was split"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 9,
   "id": "10c4740e",
   "metadata": {
    "_cell_guid": "3ec5e947-66a8-4e26-ae07-8306a7b25b12",
    "_uuid": "84086740-fef6-40e5-a880-df78e223e79c",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:54.683559Z",
     "iopub.status.busy": "2023-12-07T20:18:54.681337Z",
     "iopub.status.idle": "2023-12-07T20:18:54.859084Z",
     "shell.execute_reply": "2023-12-07T20:18:54.857018Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.207919,
     "end_time": "2023-12-07T20:18:54.861963",
     "exception": false,
     "start_time": "2023-12-07T20:18:54.654044",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>127405</li><li>24</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 127405\n",
       "\\item 24\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 127405\n",
       "2. 24\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 127405     24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>31851</li><li>24</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 31851\n",
       "\\item 24\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 31851\n",
       "2. 24\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 31851    24"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "set.seed(10312022)  # for reproducibility\n",
    "  \n",
    "loc      <- sample(1:nrow(smoking_train), round(nrow(smoking_train) * 0.8))\n",
    "\n",
    "smoking_train_tr  <- smoking_train[loc, ]\n",
    "smoking_train_te  <- smoking_train[-loc, ]\n",
    "\n",
    "# Training dataset\n",
    "\n",
    "dim(smoking_train_tr)\n",
    "dim(smoking_train_te)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "615523f7",
   "metadata": {
    "_cell_guid": "64e7e464-6716-42fa-b53c-ff49063d4bcd",
    "_uuid": "c1f716c3-0351-4b82-9cb7-c2e5376645fd",
    "papermill": {
     "duration": 0.02514,
     "end_time": "2023-12-07T20:18:54.912284",
     "exception": false,
     "start_time": "2023-12-07T20:18:54.887144",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Cross Validation** \n",
    "\n",
    "A K 10 fold Leave-One-Out Cross-Validation was adopted to improve and assess the performance and generalizability of the model"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 10,
   "id": "9161fe01",
   "metadata": {
    "_cell_guid": "38cbfdaa-30b9-4ef6-bd1b-6d1050a18733",
    "_uuid": "1f58b1af-9e4a-4f5e-a96c-cf6a5dd61931",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:54.967417Z",
     "iopub.status.busy": "2023-12-07T20:18:54.965666Z",
     "iopub.status.idle": "2023-12-07T20:18:55.399704Z",
     "shell.execute_reply": "2023-12-07T20:18:55.397600Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.465536,
     "end_time": "2023-12-07T20:18:55.402549",
     "exception": false,
     "start_time": "2023-12-07T20:18:54.937013",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "set.seed(10312022) # for reproducibility\n",
    "\n",
    "smoking_train_tr = smoking_train_tr[sample(nrow(smoking_train_tr)),]\n",
    "\n",
    "# Create 10 folds with equal size\n",
    "\n",
    "  folds = cut(seq(1,nrow(smoking_train_tr)),breaks=10,labels=FALSE)\n",
    "  \n",
    "# Create the list for each fold \n",
    "      \n",
    "  my.indices <- vector('list',10)\n",
    "\n",
    "  for(i in 1:10){\n",
    "    my.indices[[i]] <- which(folds!=i)\n",
    "  }"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 11,
   "id": "6108c84b",
   "metadata": {
    "_cell_guid": "bd58508c-6230-4664-b135-b813e93ff69f",
    "_uuid": "8ac9d090-8171-48e3-9378-538de20fb52b",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:55.458132Z",
     "iopub.status.busy": "2023-12-07T20:18:55.456333Z",
     "iopub.status.idle": "2023-12-07T20:18:55.758774Z",
     "shell.execute_reply": "2023-12-07T20:18:55.756778Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.33417,
     "end_time": "2023-12-07T20:18:55.761661",
     "exception": false,
     "start_time": "2023-12-07T20:18:55.427491",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: caret\n",
      "\n",
      "Loading required package: lattice\n",
      "\n",
      "\n",
      "Attaching package: ‘caret’\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    lift\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:cutpointr’:\n",
      "\n",
      "    precision, recall, sensitivity, specificity\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:httr’:\n",
      "\n",
      "    progress\n",
      "\n",
      "\n"
     ]
    }
   ],
   "source": [
    "require(caret)\n",
    "cv <- trainControl(method          = \"cv\",\n",
    "                   index           = my.indices,\n",
    "                   classProbs      = TRUE,\n",
    "                   summaryFunction = mnLogLoss)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "f1bf3368",
   "metadata": {
    "_cell_guid": "b7ce83ba-5865-4177-8bec-0621d2b4b7ce",
    "_uuid": "afd33102-e483-4bc3-bba8-e6bb2d40a244",
    "papermill": {
     "duration": 0.025468,
     "end_time": "2023-12-07T20:18:55.813168",
     "exception": false,
     "start_time": "2023-12-07T20:18:55.787700",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **Logistic Regression with Ridge Regularization**\n",
    "\n",
    "\n",
    "The ridge regression model was implemented with the alpha parameter set to 0 for pure L2 regularization. Lambda grid values ranged from -0.05 to 0.0005 across 10-fold cross-validation. Different grid iterations were tried to discover the optimal lambda."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 12,
   "id": "0f43fda3",
   "metadata": {
    "_cell_guid": "4c072414-6b71-4958-8588-a435b4c8eca5",
    "_uuid": "237307d8-6133-4151-972e-9d0bf4b838d4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:55.869196Z",
     "iopub.status.busy": "2023-12-07T20:18:55.867367Z",
     "iopub.status.idle": "2023-12-07T20:18:55.894515Z",
     "shell.execute_reply": "2023-12-07T20:18:55.892514Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.058448,
     "end_time": "2023-12-07T20:18:55.897047",
     "exception": false,
     "start_time": "2023-12-07T20:18:55.838599",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 6 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>alpha</th><th scope=col>lambda</th></tr>\n",
       "\t<tr><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>0</td><td>-5e-02</td></tr>\n",
       "\t<tr><td>0</td><td> 1e-04</td></tr>\n",
       "\t<tr><td>0</td><td> 2e-04</td></tr>\n",
       "\t<tr><td>0</td><td> 3e-04</td></tr>\n",
       "\t<tr><td>0</td><td> 4e-04</td></tr>\n",
       "\t<tr><td>0</td><td> 5e-02</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 6 × 2\n",
       "\\begin{tabular}{ll}\n",
       " alpha & lambda\\\\\n",
       " <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t 0 & -5e-02\\\\\n",
       "\t 0 &  1e-04\\\\\n",
       "\t 0 &  2e-04\\\\\n",
       "\t 0 &  3e-04\\\\\n",
       "\t 0 &  4e-04\\\\\n",
       "\t 0 &  5e-02\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 6 × 2\n",
       "\n",
       "| alpha &lt;dbl&gt; | lambda &lt;dbl&gt; |\n",
       "|---|---|\n",
       "| 0 | -5e-02 |\n",
       "| 0 |  1e-04 |\n",
       "| 0 |  2e-04 |\n",
       "| 0 |  3e-04 |\n",
       "| 0 |  4e-04 |\n",
       "| 0 |  5e-02 |\n",
       "\n"
      ],
      "text/plain": [
       "  alpha lambda\n",
       "1 0     -5e-02\n",
       "2 0      1e-04\n",
       "3 0      2e-04\n",
       "4 0      3e-04\n",
       "5 0      4e-04\n",
       "6 0      5e-02"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "grid <- data.frame(alpha = 0, lambda = c(-0.05,0.0001,0.0002,0.0003,0.0004,0.05)) \n",
    "grid"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 13,
   "id": "4333ffa0",
   "metadata": {
    "_cell_guid": "4e6d83a1-b860-4706-84cd-79823a12453e",
    "_uuid": "51f1be9e-2fd1-4d55-9ee5-bd400999febc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:18:55.952612Z",
     "iopub.status.busy": "2023-12-07T20:18:55.950808Z",
     "iopub.status.idle": "2023-12-07T20:21:10.513061Z",
     "shell.execute_reply": "2023-12-07T20:21:10.510919Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 134.655658,
     "end_time": "2023-12-07T20:21:10.578332",
     "exception": false,
     "start_time": "2023-12-07T20:18:55.922674",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 20:18:55 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required package: Matrix\n",
      "\n",
      "\n",
      "Attaching package: ‘Matrix’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:tidyr’:\n",
      "\n",
      "    expand, pack, unpack\n",
      "\n",
      "\n",
      "Loaded glmnet 4.1-8\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 20:21:10 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Sys.time()\n",
    "\n",
    "caret_logistic_ridge <- caret::train(blueprint_smoking, \n",
    "                                     data      = smoking_train_tr, \n",
    "                                     method    = \"glmnet\",\n",
    "                                     family    = 'binomial',\n",
    "                                     metric    = 'logLoss',\n",
    "                                     trControl = cv,\n",
    "                                     tuneGrid  = grid)\n",
    "\n",
    "Sys.time()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 14,
   "id": "795ad4de",
   "metadata": {
    "_cell_guid": "1ec0d28d-d47d-4576-8886-9f215dac875e",
    "_uuid": "f6de3528-9999-4419-8589-f22061338e11",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:10.634810Z",
     "iopub.status.busy": "2023-12-07T20:21:10.632955Z",
     "iopub.status.idle": "2023-12-07T20:21:10.985827Z",
     "shell.execute_reply": "2023-12-07T20:21:10.983640Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.383843,
     "end_time": "2023-12-07T20:21:10.988360",
     "exception": false,
     "start_time": "2023-12-07T20:21:10.604517",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nVwjSDPwAAAAASUVORK5CYII="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(caret_logistic_ridge)"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "87290c2b",
   "metadata": {
    "_cell_guid": "40949250-9ea3-4e7d-ad96-a2f9f68171ee",
    "_uuid": "9227f1ba-681c-46ca-a218-10e914b63232",
    "papermill": {
     "duration": 0.027272,
     "end_time": "2023-12-07T20:21:11.043591",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.016319",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "The best tuned lambda is at `0.0004`."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 15,
   "id": "81c67f60",
   "metadata": {
    "_cell_guid": "265b1379-bce5-4b84-8b24-76d6faf9970d",
    "_uuid": "1ad1e26a-da5a-4891-ae7e-86e529d45664",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.101136Z",
     "iopub.status.busy": "2023-12-07T20:21:11.099383Z",
     "iopub.status.idle": "2023-12-07T20:21:11.124250Z",
     "shell.execute_reply": "2023-12-07T20:21:11.122243Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.056382,
     "end_time": "2023-12-07T20:21:11.126793",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.070411",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>alpha</th><th scope=col>lambda</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>5</th><td>0</td><td>4e-04</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & alpha & lambda\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t5 & 0 & 4e-04\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 2\n",
       "\n",
       "| <!--/--> | alpha &lt;dbl&gt; | lambda &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 5 | 0 | 4e-04 |\n",
       "\n"
      ],
      "text/plain": [
       "  alpha lambda\n",
       "5 0     4e-04 "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "caret_logistic_ridge$bestTune"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 16,
   "id": "47b9a1b2",
   "metadata": {
    "_cell_guid": "42805c0b-8b36-481f-8ef5-93f9f9ff081a",
    "_uuid": "8f0b4c89-9132-4805-bb55-3160836d55b1",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.185204Z",
     "iopub.status.busy": "2023-12-07T20:21:11.183405Z",
     "iopub.status.idle": "2023-12-07T20:21:11.204281Z",
     "shell.execute_reply": "2023-12-07T20:21:11.202238Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.05279,
     "end_time": "2023-12-07T20:21:11.206936",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.154146",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.495048674081407"
      ],
      "text/latex": [
       "0.495048674081407"
      ],
      "text/markdown": [
       "0.495048674081407"
      ],
      "text/plain": [
       "[1] 0.4950487"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "log_loss_ridge <- caret_logistic_ridge$results[5, ][,3]\n",
    "log_loss_ridge"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 17,
   "id": "6e8a9e1e",
   "metadata": {
    "_cell_guid": "6793afda-197e-4c9d-996d-2638ab6c41cb",
    "_uuid": "b0ae7ea4-e2be-48f2-94ea-b0c173bad9a0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.265933Z",
     "iopub.status.busy": "2023-12-07T20:21:11.264143Z",
     "iopub.status.idle": "2023-12-07T20:21:11.557756Z",
     "shell.execute_reply": "2023-12-07T20:21:11.555806Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.325767,
     "end_time": "2023-12-07T20:21:11.560202",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.234435",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>31851</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 31851\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 31851\n",
       "2. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 31851     2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "ridge_predicted_te <- predict(caret_logistic_ridge,smoking_train_te, type='prob')\n",
    "\n",
    "dim(ridge_predicted_te)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 18,
   "id": "09cbb97d",
   "metadata": {
    "_cell_guid": "212b6b24-f1e1-4ff0-ae07-fc848964b2c1",
    "_uuid": "b21ce440-7a9b-42d8-b4ed-d2573dc4beea",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.619662Z",
     "iopub.status.busy": "2023-12-07T20:21:11.617927Z",
     "iopub.status.idle": "2023-12-07T20:21:11.689418Z",
     "shell.execute_reply": "2023-12-07T20:21:11.686818Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.104376,
     "end_time": "2023-12-07T20:21:11.692502",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.588126",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Assuming the positive class is 1\n",
      "\n",
      "Assuming the positive class has higher x values\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "0.832055323536497"
      ],
      "text/latex": [
       "0.832055323536497"
      ],
      "text/markdown": [
       "0.832055323536497"
      ],
      "text/plain": [
       "[1] 0.8320553"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cut.obj_ridge <- cutpointr(x    = ridge_predicted_te$Positive,\n",
    "                     class = smoking_train_te$smoking,\n",
    "                    na.rm = TRUE,\n",
    "                          method = maximize_metric, \n",
    "                           metric = accuracy)\n",
    "\n",
    "auc_ridge <- auc(cut.obj_ridge)\n",
    "auc_ridge"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 19,
   "id": "701640ad",
   "metadata": {
    "_cell_guid": "555eb4df-5924-4200-bd54-d990a37e6206",
    "_uuid": "db610593-cc1f-4e0f-9eed-65c41a3fc022",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.752717Z",
     "iopub.status.busy": "2023-12-07T20:21:11.751004Z",
     "iopub.status.idle": "2023-12-07T20:21:11.766602Z",
     "shell.execute_reply": "2023-12-07T20:21:11.764584Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.049383,
     "end_time": "2023-12-07T20:21:11.769787",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.720404",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "opt_cut_ridge <- cut.obj_ridge$optimal_cutpoint"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 20,
   "id": "443dfe31",
   "metadata": {
    "_cell_guid": "7211c880-8940-4a5d-8dcc-eba44ef9d0d0",
    "_uuid": "164cee02-536e-458a-ae71-2f28d6af31d9",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.830701Z",
     "iopub.status.busy": "2023-12-07T20:21:11.829003Z",
     "iopub.status.idle": "2023-12-07T20:21:11.893493Z",
     "shell.execute_reply": "2023-12-07T20:21:11.891109Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.099183,
     "end_time": "2023-12-07T20:21:11.896987",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.797804",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   pred_class_ridge\n",
       "        0     1\n",
       "  0 12485  5522\n",
       "  1  2364 11480"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.752409657467583"
      ],
      "text/latex": [
       "0.752409657467583"
      ],
      "text/markdown": [
       "0.752409657467583"
      ],
      "text/plain": [
       "[1] 0.7524097"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "pred_class_ridge <- ifelse(ridge_predicted_te$Positive > opt_cut_ridge,1,0)\n",
    "\n",
    "confusion_ridge <- table(smoking_train_te$smoking, pred_class_ridge)\n",
    "confusion_ridge\n",
    "\n",
    "acc_ridge <- sum(diag(confusion_ridge))/sum(confusion_ridge)\n",
    "acc_ridge"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 21,
   "id": "b792f47a",
   "metadata": {
    "_cell_guid": "7bfd0df6-54ac-4043-95e4-fadb16f36613",
    "_uuid": "7fdb9554-3145-447c-8dc1-f2e294726aa4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:11.960045Z",
     "iopub.status.busy": "2023-12-07T20:21:11.958353Z",
     "iopub.status.idle": "2023-12-07T20:21:12.010626Z",
     "shell.execute_reply": "2023-12-07T20:21:12.008658Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.086688,
     "end_time": "2023-12-07T20:21:12.013755",
     "exception": false,
     "start_time": "2023-12-07T20:21:11.927067",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Accuracy: 0.7524097 \n",
      "Log Loss: 0.4950487 \n",
      "AUC: 0.8320553 \n",
      "True Negative Rate (TNR)/Specificity: 0.6933415 \n",
      "True Positive Rate (TPR)/Sensitivity: 0.6752147 \n",
      "Precision: 0.8292401 \n"
     ]
    }
   ],
   "source": [
    "## Metrics for Logistic regression with Ridge Regularization\n",
    "\n",
    "# Accuracy\n",
    "acc_ridge <- sum(diag(confusion_ridge))/sum(confusion_ridge)\n",
    "\n",
    "\n",
    "# True Negative Rate (TNR) or Specificity\n",
    "TNR_ridge <- confusion_ridge[1, 1] / sum(confusion_ridge[1, ])\n",
    "\n",
    "# True Positive Rate (TPR) or Sensitivity or Recall\n",
    "TPR_ridge <- confusion_ridge[2, 2] / sum(confusion_ridge[,2])\n",
    "\n",
    "# Precision\n",
    "Precision_ridge <- confusion_ridge[2, 2] / sum(confusion_ridge[2, 2], confusion_ridge[2, 1])\n",
    "\n",
    "# Print the results\n",
    "cat(\"Accuracy:\", acc_ridge, \"\\n\")\n",
    "cat(\"Log Loss:\", log_loss_ridge, \"\\n\")\n",
    "cat(\"AUC:\", auc_ridge, \"\\n\")\n",
    "cat(\"True Negative Rate (TNR)/Specificity:\", TNR_ridge , \"\\n\")\n",
    "cat(\"True Positive Rate (TPR)/Sensitivity:\", TPR_ridge, \"\\n\")\n",
    "cat(\"Precision:\", Precision_ridge, \"\\n\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "2f5a9462",
   "metadata": {
    "_cell_guid": "26cff3ab-1f13-4b37-ac3a-6b943c0e6472",
    "_uuid": "3cfb82aa-b947-49e3-9e47-69b933973094",
    "papermill": {
     "duration": 0.029163,
     "end_time": "2023-12-07T20:21:12.073836",
     "exception": false,
     "start_time": "2023-12-07T20:21:12.044673",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "### **LASSO Regression**\n",
    "\n",
    "The LASSO logistic regression model was fitted using the glmnet package in caret. The alpha parameter was set to 1 for full L1 regularization. The lambda value controlling regularization strength was tuned through 10-fold cross-validation over a grid from -0.05 to 0.05."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 22,
   "id": "be1580ca",
   "metadata": {
    "_cell_guid": "0418212e-9017-4af3-91ee-7e66a2ff8ae9",
    "_uuid": "0100760c-55b9-4e56-92a0-a6fe9c894ca1",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:12.135686Z",
     "iopub.status.busy": "2023-12-07T20:21:12.134049Z",
     "iopub.status.idle": "2023-12-07T20:21:12.156875Z",
     "shell.execute_reply": "2023-12-07T20:21:12.154375Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.057478,
     "end_time": "2023-12-07T20:21:12.160018",
     "exception": false,
     "start_time": "2023-12-07T20:21:12.102540",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>101</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 101\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 101\n",
       "2. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 101   2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "grid <- data.frame(alpha = 1, lambda = c(seq(-0.05,.05,.001))) \n",
    "\n",
    "dim(grid)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 23,
   "id": "8d6a960c",
   "metadata": {
    "_cell_guid": "e51fd336-6a3e-4eea-ba83-35a74788bddf",
    "_uuid": "9b91cd57-d45d-4ebf-a1b3-e36313c826cc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:21:12.222722Z",
     "iopub.status.busy": "2023-12-07T20:21:12.220914Z",
     "iopub.status.idle": "2023-12-07T20:23:12.616107Z",
     "shell.execute_reply": "2023-12-07T20:23:12.612977Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 120.460062,
     "end_time": "2023-12-07T20:23:12.649182",
     "exception": false,
     "start_time": "2023-12-07T20:21:12.189120",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 20:21:12 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 20:23:12 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "Sys.time()\n",
    "\n",
    "caret_logistic_lasso <- caret::train(blueprint_smoking, \n",
    "                                     data      = smoking_train_tr, \n",
    "                                     method    = \"glmnet\",\n",
    "                                     family    = 'binomial',\n",
    "                                     metric    = 'logLoss',\n",
    "                                     trControl = cv,\n",
    "                                     tuneGrid  = grid)\n",
    "\n",
    "Sys.time()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 24,
   "id": "1359aa05",
   "metadata": {
    "_cell_guid": "58351a51-7c28-4c43-95b9-9ab4958bcae3",
    "_uuid": "4cd64e66-d249-4b04-bb6d-909b0c8e0763",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:12.715698Z",
     "iopub.status.busy": "2023-12-07T20:23:12.713938Z",
     "iopub.status.idle": "2023-12-07T20:23:12.892060Z",
     "shell.execute_reply": "2023-12-07T20:23:12.890027Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.214336,
     "end_time": "2023-12-07T20:23:12.894476",
     "exception": false,
     "start_time": "2023-12-07T20:23:12.680140",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(caret_logistic_lasso)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 25,
   "id": "721ea014",
   "metadata": {
    "_cell_guid": "29e9853c-7ac2-4a74-bf72-505f507ad33c",
    "_uuid": "56808d6e-2cd8-42c5-b399-35e1be694975",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:12.961750Z",
     "iopub.status.busy": "2023-12-07T20:23:12.959918Z",
     "iopub.status.idle": "2023-12-07T20:23:12.983490Z",
     "shell.execute_reply": "2023-12-07T20:23:12.981444Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.061063,
     "end_time": "2023-12-07T20:23:12.986283",
     "exception": false,
     "start_time": "2023-12-07T20:23:12.925220",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 2</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>alpha</th><th scope=col>lambda</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>51</th><td>1</td><td>0</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 2\n",
       "\\begin{tabular}{r|ll}\n",
       "  & alpha & lambda\\\\\n",
       "  & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t51 & 1 & 0\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 2\n",
       "\n",
       "| <!--/--> | alpha &lt;dbl&gt; | lambda &lt;dbl&gt; |\n",
       "|---|---|---|\n",
       "| 51 | 1 | 0 |\n",
       "\n"
      ],
      "text/plain": [
       "   alpha lambda\n",
       "51 1     0     "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "caret_logistic_lasso$bestTune"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 26,
   "id": "1c5ecbc1",
   "metadata": {
    "_cell_guid": "104eeb6d-6928-408e-b854-08f6939cc105",
    "_uuid": "d64ceac5-00d3-444d-8ce5-86b54c5af9b4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:13.052974Z",
     "iopub.status.busy": "2023-12-07T20:23:13.051067Z",
     "iopub.status.idle": "2023-12-07T20:23:13.074187Z",
     "shell.execute_reply": "2023-12-07T20:23:13.071578Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.060466,
     "end_time": "2023-12-07T20:23:13.077754",
     "exception": false,
     "start_time": "2023-12-07T20:23:13.017288",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.491871315406127"
      ],
      "text/latex": [
       "0.491871315406127"
      ],
      "text/markdown": [
       "0.491871315406127"
      ],
      "text/plain": [
       "[1] 0.4918713"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "log_loss_lasso <- caret_logistic_lasso$results[51, ][,3]\n",
    "log_loss_lasso"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 27,
   "id": "d26e61c2",
   "metadata": {
    "_cell_guid": "5fdb644d-9dd7-4dd9-a4e7-d77d073b8a23",
    "_uuid": "319dc03a-4307-4b7f-83ba-aa84ff61d099",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:13.144128Z",
     "iopub.status.busy": "2023-12-07T20:23:13.142160Z",
     "iopub.status.idle": "2023-12-07T20:23:13.426445Z",
     "shell.execute_reply": "2023-12-07T20:23:13.423827Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.32072,
     "end_time": "2023-12-07T20:23:13.429508",
     "exception": false,
     "start_time": "2023-12-07T20:23:13.108788",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>31851</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 31851\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 31851\n",
       "2. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 31851     2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "lasso_predicted_te <- predict(caret_logistic_lasso, smoking_train_te, type='prob')\n",
    "\n",
    "dim(lasso_predicted_te)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 28,
   "id": "ba2f16aa",
   "metadata": {
    "_cell_guid": "8ac20573-57ad-4b5a-8f12-0737e854a1e1",
    "_uuid": "e47f1634-ebdf-4aed-8c2c-c4a3fa6e0101",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:13.496653Z",
     "iopub.status.busy": "2023-12-07T20:23:13.494628Z",
     "iopub.status.idle": "2023-12-07T20:23:13.559883Z",
     "shell.execute_reply": "2023-12-07T20:23:13.557994Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.101699,
     "end_time": "2023-12-07T20:23:13.562459",
     "exception": false,
     "start_time": "2023-12-07T20:23:13.460760",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Assuming the positive class is 1\n",
      "\n",
      "Assuming the positive class has higher x values\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "0.834712645939305"
      ],
      "text/latex": [
       "0.834712645939305"
      ],
      "text/markdown": [
       "0.834712645939305"
      ],
      "text/plain": [
       "[1] 0.8347126"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cut.obj_lasso <- cutpointr(x = lasso_predicted_te$Positive,\n",
    "                     class = smoking_train_te$smoking,\n",
    "                          na.rm = TRUE,\n",
    "                        method = maximize_metric, \n",
    "                           metric = prod_sens_spec)\n",
    "\n",
    "auc_lasso <- auc(cut.obj_lasso)\n",
    "auc_lasso"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 29,
   "id": "9f3787ff",
   "metadata": {
    "_cell_guid": "b81ce2a4-8bfa-49bf-99a3-88bc79c1e25c",
    "_uuid": "1b54cdee-3ac2-4c93-afea-e0fa80a3d56f",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:13.630030Z",
     "iopub.status.busy": "2023-12-07T20:23:13.628262Z",
     "iopub.status.idle": "2023-12-07T20:23:15.546744Z",
     "shell.execute_reply": "2023-12-07T20:23:15.544689Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.95555,
     "end_time": "2023-12-07T20:23:15.549982",
     "exception": false,
     "start_time": "2023-12-07T20:23:13.594432",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "image/png": "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\nciCtVNaxc/LMB2a10co9eAsAoHYSbrFzP3gCwQ5AZLFY2Mwv/u2Kpapgd/HiRf9Wo5EJp7eu\nWnOxyFrDaOtz3y9a+vXOvuPv/L+HZgSd3bDw4XftHrwFAOAJ6f0tiK5YAG/l5eWxKV2aSItd\nRkaGf6vReGpfDU+wvP71iaQpSyZcm0REbV/lJsx49YuMmdPjdO7eAgDwjPRa7DB4AsBb4kKx\nTeQZO6PRKE4xGGBqXQ3PXLzlgsl23XVx7KVKP7B7kHL/piz3bwEAeEjCLXbuu2JtNpsYAQGa\nufz8fPZDE+mKJaLMzEy9Xu/fyjSGWlfDs5QfIaIrtf/9XXqFVv7bkWK61d1bzG+//XbgwAH2\nM8/zDz30kIe1Yv9ayuVyX87zJ5PJeJ735Rl5/lJThVar9fEK7mq12tuV8eqDrcinUCh8eXnl\ncrm/bqhOp2ukG1paWpqfn+9UeElJSWVlZfX5Te12u7iakUsWiyU3N7eioqL6bqWlpWz+0aKi\nIvF0xcXF7Gee52fNmtW7d28PL6/7uVelF+zEuOZ+STFCbyxAFdZix/N8WFiYf2vCVhUjooyM\njCuuuMK/lfELu7mciMLl//WWRChk1jKT+7eYw4cP//DDD+xnuVz++OOPe3VqmUwmLtHrM+I/\nyL7E/rz3JV+mOlGzuqGFhYVEVF5enpubW1lZmZOTU1FRYbfbc3Jy2OpBRUVFRqORddaVlZWx\nNiCLxVJaWspmpy8uLmZ5yGKxlJeXm81mbxcQalQDBgzo169fTcHGift1saUX7GptsRO/duiN\nBWBYsDMYDB7+q9F4IiMjlUqlxWIJ4Mfs3OOVGiIqtNqDqn4l51faZHql+7eYVq1aJScns5/l\ncrn4j2Gt5HI5x3F2u93974OGxZYV8WXPCcdx7BtutVp92WInl8ttNpuPzyjFG2qz2QoLC0tL\nS8vKynJyctjzGIWFhXl5eUVFRSUlJRUVFdnZ2Sylmc3m8vJy1kgmJjYJcWpPVavVjpk4JCRE\nDOUcxxkMhhYtWnh+Q+12u5tML+FgV9NfSOJ2yX0PABoJ64qNiIjwd0WI5/no6Oi0tLRmG+wU\nui5EW05VWONVl/5dPl1hDR2od/8WM3ny5MmTJ4sv2dyEnggJCVEqlZWVlaWlpQ3zMTzAfpM5\nLeXXqBQKRWhoKDl0e/lGWFiY0Wi0WGoeMdPQQkNDFQqFxWIpKyvz2Uk1Go1SqXS8oRUVFamp\n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\nsnlpR27n6tu3D+VeKvybRXvLT//2kOduPIsLqk6fe7N8xYodK5meE8FE+ym0qZncizPpeQHR\n/vqc9IeJqUVOJ+YZnqVjOqJ1+Rn1GQs/2dpx6sRAKWND6/yjek+dMXf+Z5Os7GMlJKHR8ueC\nnYqs9itHdCpLh3V0p6IC/UpQ66h4/cpxnQoAwF2InNhpss4SUQ3Vs0sz1VXS1LPma5ha2o1n\ncUHVyf2aL168uKoXy73UZl5afT+z/GuR3Mt/MrWPji7p02/QyDcH9+z/xsq4s8VvnaVjOqJ1\n+V3fPvNqULfhNQOKjKRQct/QypUrR0SUt7KPlZCERsufC3YqstqvHNGpLB3W0Z2KCvQrQa2j\n4vUrx3UqAAB3IfI9doa8LCIKkj7LL4NlrC4zl+duPIsLrc7k1qk9S75Yra3UYeqrYUSk19zL\nZGUVgpt8tnGGvzHjzz2rP/9mmqLKuqHV/G2uzsoxHdo6g+bB7B+udF/yMZ9ILNVYJCshCW2d\nXSrls5ujOxU9368c0anI8tnsLnds68z6lSM6lZWoHNepAADchciJnUTuRUQpOoM3+2Qk47FW\nz/rLee7Gs7jQ6ohIk5KweumSn/9JbtnrndkD2igZhohYeWhsbOzTXRTN+068vPf0wW/PD53f\nzObqrBzTca0jojt7FmaqW/YKVfOJxFKNRbISktDW2aVSPrs59GMvpF+x9u9UZPls9hznwNZR\ngX7liE5lJSrHdSoAAHch8qVYmbYPdDoAAAcbSURBVLoWESXk6ExbruTo/Gqaf5u3tBvP4kKr\ny7j16+iRk+Opzrxv1rw/sK3S8hpQ0S94adP/K2Z1lo7poNYREZHxuy03KvXvyTMSm1kJybYP\np5iV8tnNcR87z37liE5lOqwjOxXx6VfF71RWonJcpwIAcBciJ3ZK/9Zl5ey+o4ncS23WmZMZ\nmnrtQnjuxrO4oOqMhuzZk5Yr2o5ZPn1kZPBzT9tKvbzsjTdHPdQYnm4wHL6f7V+janGqs3JM\nR7SOk5245VSGZlirMsVpHR9WQhLaOrtUymc3B33slvqVIzqVlcM6rlNRYf3KEZ3KSlSO61QA\nAO6CjYmJEbN+hq1miN/8/e7giGpeuQ83zfv8nqLZjIEtGKLrWzfsOHUruk6ktd0sF7e5uuxH\na1dsu9ijR9usxIf3n0pMUYWUVsr9Kh2P3bzjTHLYC77Z/9098P2CPVcN788cUkbO2lydtWM6\n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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(cut.obj_lasso)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 30,
   "id": "61b97982",
   "metadata": {
    "_cell_guid": "d8a625b9-c875-40ae-a856-8d8bc614dcbb",
    "_uuid": "a7be284c-0dea-4f0f-bd2d-a4743dc3fa0d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:15.622370Z",
     "iopub.status.busy": "2023-12-07T20:23:15.620531Z",
     "iopub.status.idle": "2023-12-07T20:23:15.641592Z",
     "shell.execute_reply": "2023-12-07T20:23:15.639668Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.060334,
     "end_time": "2023-12-07T20:23:15.644272",
     "exception": false,
     "start_time": "2023-12-07T20:23:15.583938",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.426159593896795"
      ],
      "text/latex": [
       "0.426159593896795"
      ],
      "text/markdown": [
       "0.426159593896795"
      ],
      "text/plain": [
       "[1] 0.4261596"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "opt_cut_lasso <- cut.obj_lasso$optimal_cutpoint\n",
    "opt_cut_lasso"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 31,
   "id": "4471d8a5",
   "metadata": {
    "_cell_guid": "67600e8c-af51-43b1-9c95-36cc5173487e",
    "_uuid": "87d5d2d7-fc91-48af-a8fa-463ef5522b9d",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:15.715759Z",
     "iopub.status.busy": "2023-12-07T20:23:15.713907Z",
     "iopub.status.idle": "2023-12-07T20:23:15.777187Z",
     "shell.execute_reply": "2023-12-07T20:23:15.775123Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.102033,
     "end_time": "2023-12-07T20:23:15.779794",
     "exception": false,
     "start_time": "2023-12-07T20:23:15.677761",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   pred_class_lasso\n",
       "        0     1\n",
       "  0 12636  5371\n",
       "  1  2470 11374"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.753822485950206"
      ],
      "text/latex": [
       "0.753822485950206"
      ],
      "text/markdown": [
       "0.753822485950206"
      ],
      "text/plain": [
       "[1] 0.7538225"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "pred_class_lasso <- ifelse(lasso_predicted_te$Positive > opt_cut_lasso,1,0)\n",
    "\n",
    "confusion_lasso <- table(smoking_train_te$smoking, pred_class_lasso)\n",
    "confusion_lasso\n",
    "\n",
    "acc_lasso <- sum(diag(confusion_lasso))/sum(confusion_lasso)\n",
    "acc_lasso"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 32,
   "id": "62cb2fb7",
   "metadata": {
    "_cell_guid": "a0dbbd6c-e8c5-489b-993e-6ccdcb033a9f",
    "_uuid": "4a97beb0-18bf-4c45-b1fe-24fe7879e88a",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:15.851404Z",
     "iopub.status.busy": "2023-12-07T20:23:15.849532Z",
     "iopub.status.idle": "2023-12-07T20:23:15.897636Z",
     "shell.execute_reply": "2023-12-07T20:23:15.895530Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.086621,
     "end_time": "2023-12-07T20:23:15.900169",
     "exception": false,
     "start_time": "2023-12-07T20:23:15.813548",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Accuracy: 0.7538225 \n",
      "Log Loss: 0.4918713 \n",
      "AUC: 0.8347126 \n",
      "True Negative Rate (TNR)/Specificity: 0.7017271 \n",
      "True Positive Rate (TPR)/Sensitivity: 0.6792475 \n",
      "Precision: 0.8215834 \n"
     ]
    }
   ],
   "source": [
    "## Metrics for Logistic regression without Lasso\n",
    "\n",
    "# Accuracy\n",
    "acc_lasso <- sum(diag(confusion_lasso))/sum(confusion_lasso)\n",
    "\n",
    "\n",
    "# True Negative Rate (TNR) or Specificity\n",
    "TNR_lasso <- confusion_lasso[1, 1] / sum(confusion_lasso[1, ])\n",
    "\n",
    "# True Positive Rate (TPR) or Sensitivity or Recall\n",
    "TPR_lasso <- confusion_lasso[2, 2] / sum(confusion_lasso[,2])\n",
    "\n",
    "# Precision\n",
    "Precision_lasso <- confusion_lasso[2, 2] / sum(confusion_lasso[2, 2], confusion_lasso[2, 1])\n",
    "\n",
    "# Print the results\n",
    "cat(\"Accuracy:\", acc_lasso, \"\\n\")\n",
    "cat(\"Log Loss:\", log_loss_lasso, \"\\n\")\n",
    "cat(\"AUC:\", auc_lasso, \"\\n\")\n",
    "cat(\"True Negative Rate (TNR)/Specificity:\", TNR_lasso, \"\\n\")\n",
    "cat(\"True Positive Rate (TPR)/Sensitivity:\", TPR_lasso, \"\\n\")\n",
    "cat(\"Precision:\", Precision_lasso, \"\\n\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "89f52bad",
   "metadata": {
    "_cell_guid": "e7c3b398-1ece-4d0f-9c15-d648c0c2871b",
    "_uuid": "de23a102-69a0-4dc0-a566-5caf6cc689d3",
    "papermill": {
     "duration": 0.035312,
     "end_time": "2023-12-07T20:23:15.969362",
     "exception": false,
     "start_time": "2023-12-07T20:23:15.934050",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Gradient Boosting**\n",
    "\n",
    "A gradient boosting model was trained using caret's gbm method. The shrinkage hyperparameter was specified at 0.01. The number of trees, controlling model complexity, was tuned from 1 to 10,000 trees. An interaction depth of 7 and a bag fraction of 0.5 were defined, with each node split requiring a minimum of 40 observations."
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 33,
   "id": "a7449f9c",
   "metadata": {
    "_cell_guid": "e3322239-e353-4836-b0aa-e5174466467f",
    "_uuid": "63910489-5a33-4aef-93e4-4506ad2b1fc4",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:16.042289Z",
     "iopub.status.busy": "2023-12-07T20:23:16.039968Z",
     "iopub.status.idle": "2023-12-07T20:23:16.057407Z",
     "shell.execute_reply": "2023-12-07T20:23:16.055294Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.057224,
     "end_time": "2023-12-07T20:23:16.060475",
     "exception": false,
     "start_time": "2023-12-07T20:23:16.003251",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "grid <- expand.grid(shrinkage         = 0.1,\n",
    "                    n.trees           = 1:1000,\n",
    "                    interaction.depth = 7,\n",
    "                    n.minobsinnode    = 40)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 34,
   "id": "b1b02b36",
   "metadata": {
    "_cell_guid": "4cc18f1c-3627-4012-b2c0-3b4bc405f34b",
    "_uuid": "c830aff6-172a-48db-a962-3074b4789c02",
    "execution": {
     "iopub.execute_input": "2023-12-07T20:23:16.133818Z",
     "iopub.status.busy": "2023-12-07T20:23:16.131854Z",
     "iopub.status.idle": "2023-12-07T21:19:44.711922Z",
     "shell.execute_reply": "2023-12-07T21:19:44.708909Z"
    },
    "papermill": {
     "duration": 3388.665716,
     "end_time": "2023-12-07T21:19:44.760642",
     "exception": false,
     "start_time": "2023-12-07T20:23:16.094926",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 20:23:16 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Loading required namespace: gbm\n",
      "\n",
      "Loaded gbm 2.1.8.1\n",
      "\n",
      "------------------------------------------------------------------------------\n",
      "\n",
      "You have loaded plyr after dplyr - this is likely to cause problems.\n",
      "If you need functions from both plyr and dplyr, please load plyr first, then dplyr:\n",
      "library(plyr); library(dplyr)\n",
      "\n",
      "------------------------------------------------------------------------------\n",
      "\n",
      "\n",
      "Attaching package: ‘plyr’\n",
      "\n",
      "\n",
      "The following objects are masked from ‘package:dplyr’:\n",
      "\n",
      "    arrange, count, desc, failwith, id, mutate, rename, summarise,\n",
      "    summarize\n",
      "\n",
      "\n",
      "The following object is masked from ‘package:purrr’:\n",
      "\n",
      "    compact\n",
      "\n",
      "\n"
     ]
    },
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3118            -nan     0.1000    0.0297\n",
      "     2        1.2627            -nan     0.1000    0.0244\n",
      "     3        1.2216            -nan     0.1000    0.0203\n",
      "     4        1.1871            -nan     0.1000    0.0170\n",
      "     5        1.1579            -nan     0.1000    0.0145\n",
      "     6        1.1327            -nan     0.1000    0.0126\n",
      "     7        1.1108            -nan     0.1000    0.0111\n",
      "     8        1.0922            -nan     0.1000    0.0092\n",
      "     9        1.0753            -nan     0.1000    0.0084\n",
      "    10        1.0605            -nan     0.1000    0.0073\n",
      "    20        0.9816            -nan     0.1000    0.0024\n",
      "    40        0.9334            -nan     0.1000    0.0008\n",
      "    60        0.9139            -nan     0.1000    0.0002\n",
      "    80        0.9033            -nan     0.1000    0.0002\n",
      "   100        0.8973            -nan     0.1000    0.0000\n",
      "   120        0.8930            -nan     0.1000    0.0001\n",
      "   140        0.8895            -nan     0.1000    0.0000\n",
      "   160        0.8864            -nan     0.1000    0.0000\n",
      "   180        0.8834            -nan     0.1000   -0.0000\n",
      "   200        0.8811            -nan     0.1000   -0.0000\n",
      "   220        0.8787            -nan     0.1000    0.0000\n",
      "   240        0.8764            -nan     0.1000   -0.0000\n",
      "   260        0.8740            -nan     0.1000   -0.0000\n",
      "   280        0.8720            -nan     0.1000   -0.0000\n",
      "   300        0.8698            -nan     0.1000    0.0000\n",
      "   320        0.8678            -nan     0.1000   -0.0000\n",
      "   340        0.8661            -nan     0.1000    0.0000\n",
      "   360        0.8643            -nan     0.1000    0.0000\n",
      "   380        0.8622            -nan     0.1000   -0.0000\n",
      "   400        0.8603            -nan     0.1000    0.0000\n",
      "   420        0.8588            -nan     0.1000   -0.0000\n",
      "   440        0.8571            -nan     0.1000   -0.0000\n",
      "   460        0.8555            -nan     0.1000   -0.0000\n",
      "   480        0.8540            -nan     0.1000   -0.0000\n",
      "   500        0.8524            -nan     0.1000   -0.0000\n",
      "   520        0.8506            -nan     0.1000   -0.0000\n",
      "   540        0.8492            -nan     0.1000   -0.0000\n",
      "   560        0.8479            -nan     0.1000   -0.0000\n",
      "   580        0.8465            -nan     0.1000   -0.0000\n",
      "   600        0.8450            -nan     0.1000   -0.0000\n",
      "   620        0.8436            -nan     0.1000   -0.0000\n",
      "   640        0.8422            -nan     0.1000   -0.0000\n",
      "   660        0.8410            -nan     0.1000   -0.0000\n",
      "   680        0.8396            -nan     0.1000   -0.0000\n",
      "   700        0.8382            -nan     0.1000   -0.0000\n",
      "   720        0.8368            -nan     0.1000   -0.0000\n",
      "   740        0.8356            -nan     0.1000   -0.0000\n",
      "   760        0.8344            -nan     0.1000   -0.0000\n",
      "   780        0.8332            -nan     0.1000   -0.0000\n",
      "   800        0.8318            -nan     0.1000   -0.0000\n",
      "   820        0.8304            -nan     0.1000    0.0000\n",
      "   840        0.8291            -nan     0.1000    0.0000\n",
      "   860        0.8281            -nan     0.1000   -0.0000\n",
      "   880        0.8267            -nan     0.1000   -0.0000\n",
      "   900        0.8256            -nan     0.1000   -0.0000\n",
      "   920        0.8243            -nan     0.1000   -0.0000\n",
      "   940        0.8231            -nan     0.1000   -0.0000\n",
      "   960        0.8220            -nan     0.1000   -0.0000\n",
      "   980        0.8208            -nan     0.1000   -0.0000\n",
      "  1000        0.8196            -nan     0.1000    0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3118            -nan     0.1000    0.0296\n",
      "     2        1.2630            -nan     0.1000    0.0243\n",
      "     3        1.2222            -nan     0.1000    0.0202\n",
      "     4        1.1876            -nan     0.1000    0.0173\n",
      "     5        1.1586            -nan     0.1000    0.0143\n",
      "     6        1.1334            -nan     0.1000    0.0126\n",
      "     7        1.1120            -nan     0.1000    0.0107\n",
      "     8        1.0935            -nan     0.1000    0.0092\n",
      "     9        1.0771            -nan     0.1000    0.0082\n",
      "    10        1.0629            -nan     0.1000    0.0070\n",
      "    20        0.9816            -nan     0.1000    0.0023\n",
      "    40        0.9326            -nan     0.1000    0.0007\n",
      "    60        0.9138            -nan     0.1000    0.0003\n",
      "    80        0.9038            -nan     0.1000    0.0001\n",
      "   100        0.8973            -nan     0.1000    0.0000\n",
      "   120        0.8926            -nan     0.1000    0.0001\n",
      "   140        0.8887            -nan     0.1000    0.0000\n",
      "   160        0.8857            -nan     0.1000   -0.0000\n",
      "   180        0.8828            -nan     0.1000    0.0000\n",
      "   200        0.8801            -nan     0.1000    0.0000\n",
      "   220        0.8773            -nan     0.1000   -0.0000\n",
      "   240        0.8751            -nan     0.1000    0.0000\n",
      "   260        0.8729            -nan     0.1000    0.0000\n",
      "   280        0.8709            -nan     0.1000    0.0000\n",
      "   300        0.8688            -nan     0.1000   -0.0000\n",
      "   320        0.8667            -nan     0.1000    0.0000\n",
      "   340        0.8648            -nan     0.1000   -0.0000\n",
      "   360        0.8629            -nan     0.1000   -0.0000\n",
      "   380        0.8611            -nan     0.1000    0.0000\n",
      "   400        0.8593            -nan     0.1000   -0.0000\n",
      "   420        0.8577            -nan     0.1000   -0.0000\n",
      "   440        0.8562            -nan     0.1000   -0.0000\n",
      "   460        0.8546            -nan     0.1000    0.0000\n",
      "   480        0.8530            -nan     0.1000   -0.0000\n",
      "   500        0.8515            -nan     0.1000   -0.0000\n",
      "   520        0.8502            -nan     0.1000   -0.0000\n",
      "   540        0.8487            -nan     0.1000    0.0000\n",
      "   560        0.8472            -nan     0.1000   -0.0000\n",
      "   580        0.8458            -nan     0.1000    0.0000\n",
      "   600        0.8443            -nan     0.1000   -0.0000\n",
      "   620        0.8427            -nan     0.1000   -0.0000\n",
      "   640        0.8412            -nan     0.1000   -0.0000\n",
      "   660        0.8399            -nan     0.1000   -0.0000\n",
      "   680        0.8384            -nan     0.1000   -0.0000\n",
      "   700        0.8371            -nan     0.1000   -0.0000\n",
      "   720        0.8357            -nan     0.1000   -0.0000\n",
      "   740        0.8345            -nan     0.1000   -0.0000\n",
      "   760        0.8332            -nan     0.1000   -0.0000\n",
      "   780        0.8319            -nan     0.1000   -0.0000\n",
      "   800        0.8306            -nan     0.1000   -0.0000\n",
      "   820        0.8293            -nan     0.1000   -0.0000\n",
      "   840        0.8281            -nan     0.1000   -0.0000\n",
      "   860        0.8269            -nan     0.1000   -0.0000\n",
      "   880        0.8257            -nan     0.1000   -0.0000\n",
      "   900        0.8244            -nan     0.1000   -0.0000\n",
      "   920        0.8232            -nan     0.1000   -0.0000\n",
      "   940        0.8221            -nan     0.1000   -0.0000\n",
      "   960        0.8209            -nan     0.1000   -0.0000\n",
      "   980        0.8198            -nan     0.1000   -0.0000\n",
      "  1000        0.8185            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3127            -nan     0.1000    0.0295\n",
      "     2        1.2635            -nan     0.1000    0.0245\n",
      "     3        1.2227            -nan     0.1000    0.0205\n",
      "     4        1.1887            -nan     0.1000    0.0169\n",
      "     5        1.1592            -nan     0.1000    0.0147\n",
      "     6        1.1339            -nan     0.1000    0.0125\n",
      "     7        1.1125            -nan     0.1000    0.0107\n",
      "     8        1.0936            -nan     0.1000    0.0094\n",
      "     9        1.0774            -nan     0.1000    0.0079\n",
      "    10        1.0630            -nan     0.1000    0.0072\n",
      "    20        0.9827            -nan     0.1000    0.0023\n",
      "    40        0.9336            -nan     0.1000    0.0007\n",
      "    60        0.9139            -nan     0.1000    0.0004\n",
      "    80        0.9042            -nan     0.1000    0.0001\n",
      "   100        0.8979            -nan     0.1000    0.0001\n",
      "   120        0.8935            -nan     0.1000    0.0000\n",
      "   140        0.8897            -nan     0.1000    0.0001\n",
      "   160        0.8870            -nan     0.1000   -0.0000\n",
      "   180        0.8842            -nan     0.1000   -0.0000\n",
      "   200        0.8816            -nan     0.1000   -0.0000\n",
      "   220        0.8794            -nan     0.1000   -0.0000\n",
      "   240        0.8774            -nan     0.1000    0.0000\n",
      "   260        0.8751            -nan     0.1000    0.0000\n",
      "   280        0.8731            -nan     0.1000   -0.0000\n",
      "   300        0.8713            -nan     0.1000   -0.0000\n",
      "   320        0.8693            -nan     0.1000   -0.0000\n",
      "   340        0.8672            -nan     0.1000   -0.0000\n",
      "   360        0.8654            -nan     0.1000    0.0000\n",
      "   380        0.8637            -nan     0.1000   -0.0000\n",
      "   400        0.8618            -nan     0.1000   -0.0000\n",
      "   420        0.8600            -nan     0.1000    0.0000\n",
      "   440        0.8583            -nan     0.1000    0.0000\n",
      "   460        0.8569            -nan     0.1000   -0.0000\n",
      "   480        0.8553            -nan     0.1000   -0.0000\n",
      "   500        0.8539            -nan     0.1000   -0.0000\n",
      "   520        0.8524            -nan     0.1000   -0.0000\n",
      "   540        0.8509            -nan     0.1000   -0.0001\n",
      "   560        0.8494            -nan     0.1000   -0.0000\n",
      "   580        0.8479            -nan     0.1000   -0.0000\n",
      "   600        0.8463            -nan     0.1000   -0.0000\n",
      "   620        0.8447            -nan     0.1000   -0.0000\n",
      "   640        0.8431            -nan     0.1000   -0.0000\n",
      "   660        0.8418            -nan     0.1000   -0.0000\n",
      "   680        0.8405            -nan     0.1000   -0.0000\n",
      "   700        0.8391            -nan     0.1000   -0.0000\n",
      "   720        0.8378            -nan     0.1000   -0.0000\n",
      "   740        0.8364            -nan     0.1000   -0.0000\n",
      "   760        0.8351            -nan     0.1000   -0.0000\n",
      "   780        0.8337            -nan     0.1000   -0.0000\n",
      "   800        0.8325            -nan     0.1000   -0.0000\n",
      "   820        0.8311            -nan     0.1000   -0.0000\n",
      "   840        0.8298            -nan     0.1000    0.0000\n",
      "   860        0.8286            -nan     0.1000   -0.0000\n",
      "   880        0.8274            -nan     0.1000   -0.0000\n",
      "   900        0.8262            -nan     0.1000   -0.0000\n",
      "   920        0.8251            -nan     0.1000   -0.0000\n",
      "   940        0.8241            -nan     0.1000   -0.0000\n",
      "   960        0.8228            -nan     0.1000   -0.0000\n",
      "   980        0.8216            -nan     0.1000   -0.0000\n",
      "  1000        0.8205            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3111            -nan     0.1000    0.0296\n",
      "     2        1.2622            -nan     0.1000    0.0243\n",
      "     3        1.2218            -nan     0.1000    0.0202\n",
      "     4        1.1873            -nan     0.1000    0.0172\n",
      "     5        1.1585            -nan     0.1000    0.0143\n",
      "     6        1.1331            -nan     0.1000    0.0126\n",
      "     7        1.1117            -nan     0.1000    0.0106\n",
      "     8        1.0931            -nan     0.1000    0.0092\n",
      "     9        1.0773            -nan     0.1000    0.0079\n",
      "    10        1.0628            -nan     0.1000    0.0071\n",
      "    20        0.9825            -nan     0.1000    0.0021\n",
      "    40        0.9333            -nan     0.1000    0.0006\n",
      "    60        0.9150            -nan     0.1000    0.0002\n",
      "    80        0.9047            -nan     0.1000    0.0001\n",
      "   100        0.8985            -nan     0.1000    0.0001\n",
      "   120        0.8940            -nan     0.1000    0.0000\n",
      "   140        0.8903            -nan     0.1000    0.0000\n",
      "   160        0.8868            -nan     0.1000    0.0000\n",
      "   180        0.8839            -nan     0.1000    0.0000\n",
      "   200        0.8814            -nan     0.1000   -0.0000\n",
      "   220        0.8793            -nan     0.1000    0.0000\n",
      "   240        0.8773            -nan     0.1000   -0.0000\n",
      "   260        0.8750            -nan     0.1000   -0.0000\n",
      "   280        0.8730            -nan     0.1000   -0.0000\n",
      "   300        0.8712            -nan     0.1000    0.0000\n",
      "   320        0.8688            -nan     0.1000    0.0000\n",
      "   340        0.8668            -nan     0.1000    0.0000\n",
      "   360        0.8652            -nan     0.1000   -0.0000\n",
      "   380        0.8634            -nan     0.1000    0.0000\n",
      "   400        0.8616            -nan     0.1000    0.0000\n",
      "   420        0.8600            -nan     0.1000   -0.0000\n",
      "   440        0.8583            -nan     0.1000   -0.0000\n",
      "   460        0.8567            -nan     0.1000   -0.0000\n",
      "   480        0.8551            -nan     0.1000   -0.0000\n",
      "   500        0.8536            -nan     0.1000   -0.0000\n",
      "   520        0.8521            -nan     0.1000   -0.0000\n",
      "   540        0.8504            -nan     0.1000   -0.0000\n",
      "   560        0.8488            -nan     0.1000   -0.0000\n",
      "   580        0.8473            -nan     0.1000   -0.0000\n",
      "   600        0.8458            -nan     0.1000   -0.0000\n",
      "   620        0.8444            -nan     0.1000   -0.0000\n",
      "   640        0.8431            -nan     0.1000   -0.0000\n",
      "   660        0.8416            -nan     0.1000   -0.0000\n",
      "   680        0.8401            -nan     0.1000   -0.0000\n",
      "   700        0.8388            -nan     0.1000   -0.0000\n",
      "   720        0.8375            -nan     0.1000   -0.0000\n",
      "   740        0.8362            -nan     0.1000   -0.0000\n",
      "   760        0.8348            -nan     0.1000   -0.0000\n",
      "   780        0.8335            -nan     0.1000   -0.0000\n",
      "   800        0.8321            -nan     0.1000   -0.0000\n",
      "   820        0.8307            -nan     0.1000   -0.0000\n",
      "   840        0.8295            -nan     0.1000   -0.0000\n",
      "   860        0.8282            -nan     0.1000   -0.0000\n",
      "   880        0.8270            -nan     0.1000   -0.0000\n",
      "   900        0.8257            -nan     0.1000   -0.0000\n",
      "   920        0.8245            -nan     0.1000   -0.0000\n",
      "   940        0.8232            -nan     0.1000   -0.0000\n",
      "   960        0.8220            -nan     0.1000   -0.0000\n",
      "   980        0.8207            -nan     0.1000   -0.0000\n",
      "  1000        0.8197            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3118            -nan     0.1000    0.0296\n",
      "     2        1.2630            -nan     0.1000    0.0242\n",
      "     3        1.2226            -nan     0.1000    0.0202\n",
      "     4        1.1881            -nan     0.1000    0.0172\n",
      "     5        1.1585            -nan     0.1000    0.0146\n",
      "     6        1.1334            -nan     0.1000    0.0124\n",
      "     7        1.1115            -nan     0.1000    0.0108\n",
      "     8        1.0929            -nan     0.1000    0.0092\n",
      "     9        1.0769            -nan     0.1000    0.0080\n",
      "    10        1.0628            -nan     0.1000    0.0069\n",
      "    20        0.9822            -nan     0.1000    0.0023\n",
      "    40        0.9323            -nan     0.1000    0.0007\n",
      "    60        0.9136            -nan     0.1000    0.0003\n",
      "    80        0.9031            -nan     0.1000    0.0001\n",
      "   100        0.8970            -nan     0.1000    0.0001\n",
      "   120        0.8917            -nan     0.1000    0.0000\n",
      "   140        0.8880            -nan     0.1000    0.0000\n",
      "   160        0.8853            -nan     0.1000    0.0000\n",
      "   180        0.8823            -nan     0.1000    0.0000\n",
      "   200        0.8799            -nan     0.1000   -0.0000\n",
      "   220        0.8776            -nan     0.1000   -0.0000\n",
      "   240        0.8755            -nan     0.1000   -0.0000\n",
      "   260        0.8735            -nan     0.1000    0.0000\n",
      "   280        0.8715            -nan     0.1000    0.0000\n",
      "   300        0.8695            -nan     0.1000   -0.0000\n",
      "   320        0.8674            -nan     0.1000   -0.0000\n",
      "   340        0.8652            -nan     0.1000   -0.0000\n",
      "   360        0.8637            -nan     0.1000   -0.0000\n",
      "   380        0.8621            -nan     0.1000   -0.0000\n",
      "   400        0.8604            -nan     0.1000   -0.0000\n",
      "   420        0.8587            -nan     0.1000   -0.0000\n",
      "   440        0.8570            -nan     0.1000   -0.0000\n",
      "   460        0.8556            -nan     0.1000   -0.0000\n",
      "   480        0.8540            -nan     0.1000   -0.0000\n",
      "   500        0.8524            -nan     0.1000   -0.0000\n",
      "   520        0.8509            -nan     0.1000   -0.0000\n",
      "   540        0.8494            -nan     0.1000   -0.0000\n",
      "   560        0.8479            -nan     0.1000   -0.0000\n",
      "   580        0.8465            -nan     0.1000   -0.0000\n",
      "   600        0.8450            -nan     0.1000   -0.0000\n",
      "   620        0.8435            -nan     0.1000   -0.0000\n",
      "   640        0.8421            -nan     0.1000   -0.0000\n",
      "   660        0.8407            -nan     0.1000   -0.0000\n",
      "   680        0.8392            -nan     0.1000   -0.0000\n",
      "   700        0.8379            -nan     0.1000   -0.0000\n",
      "   720        0.8364            -nan     0.1000    0.0000\n",
      "   740        0.8352            -nan     0.1000   -0.0000\n",
      "   760        0.8337            -nan     0.1000   -0.0000\n",
      "   780        0.8325            -nan     0.1000   -0.0000\n",
      "   800        0.8312            -nan     0.1000   -0.0000\n",
      "   820        0.8298            -nan     0.1000   -0.0000\n",
      "   840        0.8286            -nan     0.1000   -0.0000\n",
      "   860        0.8273            -nan     0.1000   -0.0000\n",
      "   880        0.8262            -nan     0.1000   -0.0000\n",
      "   900        0.8250            -nan     0.1000   -0.0000\n",
      "   920        0.8238            -nan     0.1000    0.0000\n",
      "   940        0.8226            -nan     0.1000   -0.0000\n",
      "   960        0.8215            -nan     0.1000   -0.0000\n",
      "   980        0.8203            -nan     0.1000    0.0000\n",
      "  1000        0.8190            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3110            -nan     0.1000    0.0297\n",
      "     2        1.2620            -nan     0.1000    0.0244\n",
      "     3        1.2213            -nan     0.1000    0.0202\n",
      "     4        1.1873            -nan     0.1000    0.0169\n",
      "     5        1.1581            -nan     0.1000    0.0148\n",
      "     6        1.1327            -nan     0.1000    0.0127\n",
      "     7        1.1113            -nan     0.1000    0.0107\n",
      "     8        1.0928            -nan     0.1000    0.0093\n",
      "     9        1.0762            -nan     0.1000    0.0082\n",
      "    10        1.0619            -nan     0.1000    0.0071\n",
      "    20        0.9807            -nan     0.1000    0.0026\n",
      "    40        0.9320            -nan     0.1000    0.0005\n",
      "    60        0.9123            -nan     0.1000    0.0002\n",
      "    80        0.9028            -nan     0.1000    0.0001\n",
      "   100        0.8964            -nan     0.1000    0.0001\n",
      "   120        0.8918            -nan     0.1000    0.0000\n",
      "   140        0.8883            -nan     0.1000    0.0001\n",
      "   160        0.8849            -nan     0.1000    0.0000\n",
      "   180        0.8820            -nan     0.1000   -0.0000\n",
      "   200        0.8794            -nan     0.1000    0.0000\n",
      "   220        0.8771            -nan     0.1000    0.0000\n",
      "   240        0.8748            -nan     0.1000    0.0000\n",
      "   260        0.8728            -nan     0.1000   -0.0000\n",
      "   280        0.8708            -nan     0.1000   -0.0000\n",
      "   300        0.8689            -nan     0.1000   -0.0000\n",
      "   320        0.8669            -nan     0.1000   -0.0000\n",
      "   340        0.8649            -nan     0.1000   -0.0000\n",
      "   360        0.8631            -nan     0.1000   -0.0000\n",
      "   380        0.8613            -nan     0.1000    0.0000\n",
      "   400        0.8596            -nan     0.1000    0.0000\n",
      "   420        0.8577            -nan     0.1000    0.0000\n",
      "   440        0.8562            -nan     0.1000   -0.0000\n",
      "   460        0.8547            -nan     0.1000   -0.0000\n",
      "   480        0.8530            -nan     0.1000   -0.0000\n",
      "   500        0.8515            -nan     0.1000   -0.0000\n",
      "   520        0.8498            -nan     0.1000   -0.0000\n",
      "   540        0.8484            -nan     0.1000   -0.0000\n",
      "   560        0.8469            -nan     0.1000    0.0000\n",
      "   580        0.8455            -nan     0.1000   -0.0000\n",
      "   600        0.8439            -nan     0.1000   -0.0000\n",
      "   620        0.8425            -nan     0.1000   -0.0000\n",
      "   640        0.8411            -nan     0.1000   -0.0000\n",
      "   660        0.8399            -nan     0.1000   -0.0000\n",
      "   680        0.8385            -nan     0.1000   -0.0000\n",
      "   700        0.8372            -nan     0.1000   -0.0000\n",
      "   720        0.8358            -nan     0.1000   -0.0000\n",
      "   740        0.8344            -nan     0.1000   -0.0000\n",
      "   760        0.8333            -nan     0.1000   -0.0000\n",
      "   780        0.8320            -nan     0.1000   -0.0000\n",
      "   800        0.8308            -nan     0.1000   -0.0000\n",
      "   820        0.8295            -nan     0.1000   -0.0000\n",
      "   840        0.8284            -nan     0.1000   -0.0000\n",
      "   860        0.8271            -nan     0.1000   -0.0000\n",
      "   880        0.8256            -nan     0.1000   -0.0000\n",
      "   900        0.8243            -nan     0.1000   -0.0000\n",
      "   920        0.8232            -nan     0.1000   -0.0000\n",
      "   940        0.8220            -nan     0.1000   -0.0000\n",
      "   960        0.8207            -nan     0.1000   -0.0000\n",
      "   980        0.8196            -nan     0.1000   -0.0000\n",
      "  1000        0.8184            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3116            -nan     0.1000    0.0296\n",
      "     2        1.2627            -nan     0.1000    0.0243\n",
      "     3        1.2216            -nan     0.1000    0.0205\n",
      "     4        1.1878            -nan     0.1000    0.0169\n",
      "     5        1.1585            -nan     0.1000    0.0147\n",
      "     6        1.1335            -nan     0.1000    0.0125\n",
      "     7        1.1121            -nan     0.1000    0.0108\n",
      "     8        1.0934            -nan     0.1000    0.0093\n",
      "     9        1.0772            -nan     0.1000    0.0081\n",
      "    10        1.0626            -nan     0.1000    0.0072\n",
      "    20        0.9822            -nan     0.1000    0.0021\n",
      "    40        0.9327            -nan     0.1000    0.0006\n",
      "    60        0.9141            -nan     0.1000    0.0002\n",
      "    80        0.9041            -nan     0.1000    0.0001\n",
      "   100        0.8976            -nan     0.1000    0.0000\n",
      "   120        0.8926            -nan     0.1000    0.0000\n",
      "   140        0.8888            -nan     0.1000    0.0001\n",
      "   160        0.8862            -nan     0.1000    0.0000\n",
      "   180        0.8834            -nan     0.1000   -0.0000\n",
      "   200        0.8811            -nan     0.1000   -0.0000\n",
      "   220        0.8787            -nan     0.1000   -0.0000\n",
      "   240        0.8766            -nan     0.1000   -0.0000\n",
      "   260        0.8742            -nan     0.1000   -0.0000\n",
      "   280        0.8723            -nan     0.1000   -0.0000\n",
      "   300        0.8701            -nan     0.1000   -0.0000\n",
      "   320        0.8683            -nan     0.1000   -0.0000\n",
      "   340        0.8665            -nan     0.1000   -0.0000\n",
      "   360        0.8648            -nan     0.1000   -0.0000\n",
      "   380        0.8630            -nan     0.1000    0.0000\n",
      "   400        0.8613            -nan     0.1000   -0.0000\n",
      "   420        0.8599            -nan     0.1000   -0.0000\n",
      "   440        0.8583            -nan     0.1000    0.0000\n",
      "   460        0.8568            -nan     0.1000   -0.0000\n",
      "   480        0.8552            -nan     0.1000   -0.0000\n",
      "   500        0.8536            -nan     0.1000   -0.0000\n",
      "   520        0.8520            -nan     0.1000    0.0000\n",
      "   540        0.8507            -nan     0.1000   -0.0000\n",
      "   560        0.8490            -nan     0.1000   -0.0000\n",
      "   580        0.8477            -nan     0.1000   -0.0000\n",
      "   600        0.8462            -nan     0.1000   -0.0000\n",
      "   620        0.8449            -nan     0.1000   -0.0000\n",
      "   640        0.8436            -nan     0.1000   -0.0000\n",
      "   660        0.8422            -nan     0.1000   -0.0000\n",
      "   680        0.8409            -nan     0.1000   -0.0000\n",
      "   700        0.8395            -nan     0.1000   -0.0000\n",
      "   720        0.8380            -nan     0.1000   -0.0000\n",
      "   740        0.8367            -nan     0.1000   -0.0000\n",
      "   760        0.8355            -nan     0.1000   -0.0000\n",
      "   780        0.8342            -nan     0.1000   -0.0000\n",
      "   800        0.8330            -nan     0.1000   -0.0000\n",
      "   820        0.8319            -nan     0.1000   -0.0000\n",
      "   840        0.8307            -nan     0.1000   -0.0000\n",
      "   860        0.8293            -nan     0.1000   -0.0000\n",
      "   880        0.8281            -nan     0.1000   -0.0000\n",
      "   900        0.8269            -nan     0.1000   -0.0000\n",
      "   920        0.8257            -nan     0.1000   -0.0000\n",
      "   940        0.8243            -nan     0.1000   -0.0000\n",
      "   960        0.8230            -nan     0.1000   -0.0000\n",
      "   980        0.8220            -nan     0.1000   -0.0000\n",
      "  1000        0.8208            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3115            -nan     0.1000    0.0298\n",
      "     2        1.2627            -nan     0.1000    0.0244\n",
      "     3        1.2218            -nan     0.1000    0.0204\n",
      "     4        1.1872            -nan     0.1000    0.0172\n",
      "     5        1.1582            -nan     0.1000    0.0143\n",
      "     6        1.1327            -nan     0.1000    0.0127\n",
      "     7        1.1104            -nan     0.1000    0.0110\n",
      "     8        1.0915            -nan     0.1000    0.0093\n",
      "     9        1.0748            -nan     0.1000    0.0083\n",
      "    10        1.0598            -nan     0.1000    0.0074\n",
      "    20        0.9800            -nan     0.1000    0.0022\n",
      "    40        0.9317            -nan     0.1000    0.0007\n",
      "    60        0.9127            -nan     0.1000    0.0003\n",
      "    80        0.9023            -nan     0.1000    0.0001\n",
      "   100        0.8961            -nan     0.1000    0.0001\n",
      "   120        0.8916            -nan     0.1000    0.0000\n",
      "   140        0.8878            -nan     0.1000    0.0000\n",
      "   160        0.8845            -nan     0.1000   -0.0000\n",
      "   180        0.8819            -nan     0.1000    0.0000\n",
      "   200        0.8794            -nan     0.1000    0.0000\n",
      "   220        0.8773            -nan     0.1000    0.0000\n",
      "   240        0.8752            -nan     0.1000   -0.0000\n",
      "   260        0.8730            -nan     0.1000   -0.0000\n",
      "   280        0.8709            -nan     0.1000   -0.0000\n",
      "   300        0.8690            -nan     0.1000    0.0000\n",
      "   320        0.8673            -nan     0.1000   -0.0000\n",
      "   340        0.8655            -nan     0.1000   -0.0000\n",
      "   360        0.8637            -nan     0.1000    0.0000\n",
      "   380        0.8618            -nan     0.1000   -0.0000\n",
      "   400        0.8598            -nan     0.1000    0.0000\n",
      "   420        0.8582            -nan     0.1000   -0.0000\n",
      "   440        0.8566            -nan     0.1000   -0.0000\n",
      "   460        0.8550            -nan     0.1000   -0.0000\n",
      "   480        0.8533            -nan     0.1000    0.0000\n",
      "   500        0.8515            -nan     0.1000    0.0000\n",
      "   520        0.8499            -nan     0.1000   -0.0000\n",
      "   540        0.8486            -nan     0.1000    0.0000\n",
      "   560        0.8470            -nan     0.1000   -0.0000\n",
      "   580        0.8455            -nan     0.1000   -0.0000\n",
      "   600        0.8441            -nan     0.1000   -0.0000\n",
      "   620        0.8427            -nan     0.1000   -0.0000\n",
      "   640        0.8412            -nan     0.1000   -0.0000\n",
      "   660        0.8399            -nan     0.1000   -0.0000\n",
      "   680        0.8384            -nan     0.1000    0.0000\n",
      "   700        0.8371            -nan     0.1000   -0.0000\n",
      "   720        0.8358            -nan     0.1000   -0.0000\n",
      "   740        0.8346            -nan     0.1000   -0.0000\n",
      "   760        0.8330            -nan     0.1000   -0.0000\n",
      "   780        0.8317            -nan     0.1000   -0.0000\n",
      "   800        0.8303            -nan     0.1000   -0.0000\n",
      "   820        0.8290            -nan     0.1000   -0.0000\n",
      "   840        0.8278            -nan     0.1000   -0.0000\n",
      "   860        0.8265            -nan     0.1000   -0.0000\n",
      "   880        0.8253            -nan     0.1000   -0.0000\n",
      "   900        0.8241            -nan     0.1000   -0.0000\n",
      "   920        0.8229            -nan     0.1000   -0.0000\n",
      "   940        0.8218            -nan     0.1000   -0.0000\n",
      "   960        0.8206            -nan     0.1000   -0.0000\n",
      "   980        0.8194            -nan     0.1000   -0.0000\n",
      "  1000        0.8182            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3111            -nan     0.1000    0.0297\n",
      "     2        1.2625            -nan     0.1000    0.0245\n",
      "     3        1.2214            -nan     0.1000    0.0204\n",
      "     4        1.1865            -nan     0.1000    0.0172\n",
      "     5        1.1569            -nan     0.1000    0.0146\n",
      "     6        1.1321            -nan     0.1000    0.0125\n",
      "     7        1.1108            -nan     0.1000    0.0106\n",
      "     8        1.0919            -nan     0.1000    0.0094\n",
      "     9        1.0753            -nan     0.1000    0.0084\n",
      "    10        1.0604            -nan     0.1000    0.0074\n",
      "    20        0.9802            -nan     0.1000    0.0024\n",
      "    40        0.9314            -nan     0.1000    0.0008\n",
      "    60        0.9129            -nan     0.1000    0.0002\n",
      "    80        0.9027            -nan     0.1000    0.0002\n",
      "   100        0.8965            -nan     0.1000    0.0000\n",
      "   120        0.8921            -nan     0.1000    0.0001\n",
      "   140        0.8883            -nan     0.1000    0.0001\n",
      "   160        0.8854            -nan     0.1000    0.0000\n",
      "   180        0.8824            -nan     0.1000   -0.0000\n",
      "   200        0.8798            -nan     0.1000   -0.0000\n",
      "   220        0.8776            -nan     0.1000   -0.0000\n",
      "   240        0.8749            -nan     0.1000    0.0000\n",
      "   260        0.8726            -nan     0.1000    0.0000\n",
      "   280        0.8707            -nan     0.1000   -0.0000\n",
      "   300        0.8689            -nan     0.1000   -0.0000\n",
      "   320        0.8669            -nan     0.1000   -0.0000\n",
      "   340        0.8648            -nan     0.1000   -0.0000\n",
      "   360        0.8629            -nan     0.1000   -0.0000\n",
      "   380        0.8610            -nan     0.1000    0.0000\n",
      "   400        0.8591            -nan     0.1000    0.0000\n",
      "   420        0.8574            -nan     0.1000   -0.0000\n",
      "   440        0.8559            -nan     0.1000   -0.0000\n",
      "   460        0.8542            -nan     0.1000    0.0000\n",
      "   480        0.8527            -nan     0.1000   -0.0000\n",
      "   500        0.8512            -nan     0.1000   -0.0000\n",
      "   520        0.8497            -nan     0.1000   -0.0000\n",
      "   540        0.8481            -nan     0.1000   -0.0000\n",
      "   560        0.8466            -nan     0.1000   -0.0000\n",
      "   580        0.8452            -nan     0.1000   -0.0000\n",
      "   600        0.8440            -nan     0.1000   -0.0000\n",
      "   620        0.8427            -nan     0.1000   -0.0000\n",
      "   640        0.8414            -nan     0.1000   -0.0000\n",
      "   660        0.8399            -nan     0.1000    0.0000\n",
      "   680        0.8386            -nan     0.1000   -0.0000\n",
      "   700        0.8372            -nan     0.1000   -0.0000\n",
      "   720        0.8360            -nan     0.1000   -0.0000\n",
      "   740        0.8348            -nan     0.1000   -0.0000\n",
      "   760        0.8334            -nan     0.1000   -0.0000\n",
      "   780        0.8321            -nan     0.1000   -0.0000\n",
      "   800        0.8309            -nan     0.1000   -0.0000\n",
      "   820        0.8297            -nan     0.1000   -0.0000\n",
      "   840        0.8282            -nan     0.1000   -0.0000\n",
      "   860        0.8271            -nan     0.1000   -0.0000\n",
      "   880        0.8258            -nan     0.1000   -0.0000\n",
      "   900        0.8247            -nan     0.1000   -0.0000\n",
      "   920        0.8235            -nan     0.1000   -0.0000\n",
      "   940        0.8223            -nan     0.1000   -0.0000\n",
      "   960        0.8212            -nan     0.1000   -0.0000\n",
      "   980        0.8200            -nan     0.1000   -0.0000\n",
      "  1000        0.8188            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3114            -nan     0.1000    0.0296\n",
      "     2        1.2626            -nan     0.1000    0.0243\n",
      "     3        1.2219            -nan     0.1000    0.0204\n",
      "     4        1.1874            -nan     0.1000    0.0172\n",
      "     5        1.1579            -nan     0.1000    0.0145\n",
      "     6        1.1331            -nan     0.1000    0.0124\n",
      "     7        1.1115            -nan     0.1000    0.0107\n",
      "     8        1.0930            -nan     0.1000    0.0092\n",
      "     9        1.0768            -nan     0.1000    0.0079\n",
      "    10        1.0628            -nan     0.1000    0.0071\n",
      "    20        0.9819            -nan     0.1000    0.0022\n",
      "    40        0.9330            -nan     0.1000    0.0005\n",
      "    60        0.9137            -nan     0.1000    0.0002\n",
      "    80        0.9038            -nan     0.1000    0.0001\n",
      "   100        0.8975            -nan     0.1000    0.0000\n",
      "   120        0.8935            -nan     0.1000   -0.0000\n",
      "   140        0.8895            -nan     0.1000    0.0001\n",
      "   160        0.8864            -nan     0.1000   -0.0000\n",
      "   180        0.8836            -nan     0.1000    0.0000\n",
      "   200        0.8808            -nan     0.1000    0.0000\n",
      "   220        0.8786            -nan     0.1000    0.0000\n",
      "   240        0.8764            -nan     0.1000   -0.0000\n",
      "   260        0.8742            -nan     0.1000   -0.0000\n",
      "   280        0.8720            -nan     0.1000    0.0000\n",
      "   300        0.8698            -nan     0.1000   -0.0000\n",
      "   320        0.8682            -nan     0.1000   -0.0000\n",
      "   340        0.8663            -nan     0.1000   -0.0000\n",
      "   360        0.8647            -nan     0.1000   -0.0000\n",
      "   380        0.8631            -nan     0.1000    0.0000\n",
      "   400        0.8614            -nan     0.1000    0.0000\n",
      "   420        0.8597            -nan     0.1000   -0.0000\n",
      "   440        0.8581            -nan     0.1000   -0.0000\n",
      "   460        0.8564            -nan     0.1000   -0.0000\n",
      "   480        0.8547            -nan     0.1000   -0.0000\n",
      "   500        0.8531            -nan     0.1000   -0.0000\n",
      "   520        0.8516            -nan     0.1000    0.0000\n",
      "   540        0.8499            -nan     0.1000   -0.0000\n",
      "   560        0.8484            -nan     0.1000   -0.0000\n",
      "   580        0.8469            -nan     0.1000   -0.0000\n",
      "   600        0.8456            -nan     0.1000    0.0000\n",
      "   620        0.8441            -nan     0.1000    0.0000\n",
      "   640        0.8427            -nan     0.1000   -0.0000\n",
      "   660        0.8413            -nan     0.1000    0.0000\n",
      "   680        0.8399            -nan     0.1000   -0.0000\n",
      "   700        0.8386            -nan     0.1000   -0.0000\n",
      "   720        0.8372            -nan     0.1000   -0.0000\n",
      "   740        0.8359            -nan     0.1000   -0.0000\n",
      "   760        0.8346            -nan     0.1000    0.0000\n",
      "   780        0.8333            -nan     0.1000   -0.0000\n",
      "   800        0.8320            -nan     0.1000   -0.0000\n",
      "   820        0.8307            -nan     0.1000   -0.0000\n",
      "   840        0.8294            -nan     0.1000   -0.0000\n",
      "   860        0.8281            -nan     0.1000   -0.0000\n",
      "   880        0.8270            -nan     0.1000   -0.0000\n",
      "   900        0.8257            -nan     0.1000   -0.0000\n",
      "   920        0.8246            -nan     0.1000   -0.0000\n",
      "   940        0.8236            -nan     0.1000   -0.0000\n",
      "   960        0.8224            -nan     0.1000   -0.0000\n",
      "   980        0.8213            -nan     0.1000   -0.0000\n",
      "  1000        0.8201            -nan     0.1000   -0.0000\n",
      "\n",
      "Iter   TrainDeviance   ValidDeviance   StepSize   Improve\n",
      "     1        1.3115            -nan     0.1000    0.0296\n",
      "     2        1.2625            -nan     0.1000    0.0245\n",
      "     3        1.2218            -nan     0.1000    0.0202\n",
      "     4        1.1875            -nan     0.1000    0.0170\n",
      "     5        1.1580            -nan     0.1000    0.0149\n",
      "     6        1.1329            -nan     0.1000    0.0125\n",
      "     7        1.1112            -nan     0.1000    0.0108\n",
      "     8        1.0925            -nan     0.1000    0.0094\n",
      "     9        1.0761            -nan     0.1000    0.0081\n",
      "    10        1.0619            -nan     0.1000    0.0071\n",
      "    20        0.9817            -nan     0.1000    0.0024\n",
      "    40        0.9329            -nan     0.1000    0.0005\n",
      "    60        0.9138            -nan     0.1000    0.0003\n",
      "    80        0.9039            -nan     0.1000    0.0001\n",
      "   100        0.8977            -nan     0.1000    0.0000\n",
      "   120        0.8933            -nan     0.1000    0.0000\n",
      "   140        0.8899            -nan     0.1000    0.0000\n",
      "   160        0.8872            -nan     0.1000    0.0000\n",
      "   180        0.8843            -nan     0.1000    0.0000\n",
      "   200        0.8817            -nan     0.1000   -0.0000\n",
      "   220        0.8792            -nan     0.1000   -0.0000\n",
      "   240        0.8772            -nan     0.1000    0.0000\n",
      "   260        0.8750            -nan     0.1000    0.0000\n",
      "   280        0.8733            -nan     0.1000   -0.0000\n",
      "   300        0.8714            -nan     0.1000    0.0000\n",
      "   320        0.8698            -nan     0.1000   -0.0000\n",
      "   340        0.8679            -nan     0.1000    0.0000\n",
      "   360        0.8661            -nan     0.1000   -0.0000\n",
      "   380        0.8644            -nan     0.1000   -0.0000\n",
      "   400        0.8628            -nan     0.1000   -0.0000\n",
      "   420        0.8610            -nan     0.1000   -0.0000\n",
      "   440        0.8595            -nan     0.1000   -0.0000\n",
      "   460        0.8581            -nan     0.1000   -0.0000\n",
      "   480        0.8567            -nan     0.1000   -0.0000\n",
      "   500        0.8552            -nan     0.1000   -0.0000\n",
      "   520        0.8539            -nan     0.1000    0.0000\n",
      "   540        0.8525            -nan     0.1000   -0.0000\n",
      "   560        0.8512            -nan     0.1000   -0.0000\n",
      "   580        0.8498            -nan     0.1000   -0.0000\n",
      "   600        0.8484            -nan     0.1000   -0.0000\n",
      "   620        0.8470            -nan     0.1000   -0.0000\n",
      "   640        0.8456            -nan     0.1000   -0.0000\n",
      "   660        0.8441            -nan     0.1000   -0.0000\n",
      "   680        0.8428            -nan     0.1000   -0.0000\n",
      "   700        0.8413            -nan     0.1000   -0.0000\n",
      "   720        0.8400            -nan     0.1000   -0.0000\n",
      "   740        0.8389            -nan     0.1000   -0.0000\n",
      "   760        0.8376            -nan     0.1000   -0.0000\n",
      "   780        0.8364            -nan     0.1000   -0.0000\n",
      "   800        0.8353            -nan     0.1000   -0.0000\n",
      "   820        0.8342            -nan     0.1000   -0.0000\n",
      "   840        0.8329            -nan     0.1000   -0.0000\n",
      "   860        0.8317            -nan     0.1000   -0.0000\n",
      "   880        0.8305            -nan     0.1000    0.0000\n",
      "   900        0.8294            -nan     0.1000   -0.0000\n",
      "   920        0.8282            -nan     0.1000   -0.0000\n",
      "   940        0.8271            -nan     0.1000   -0.0000\n",
      "   960        0.8260            -nan     0.1000   -0.0000\n",
      "   980        0.8249            -nan     0.1000   -0.0000\n",
      "  1000        0.8239            -nan     0.1000   -0.0000\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/plain": [
       "[1] \"2023-12-07 21:19:44 UTC\""
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "Sys.time()\n",
    "\n",
    "\n",
    "gbm1 <- caret::train(blueprint_smoking,\n",
    "                     data         = smoking_train_tr,\n",
    "                     method       = 'gbm',\n",
    "                     trControl    = cv,\n",
    "                     tuneGrid     = grid,\n",
    "                     bag.fraction = 0.5,\n",
    "                     metric       = 'logLoss')\n",
    "Sys.time()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 35,
   "id": "59b52a22",
   "metadata": {
    "_cell_guid": "cbee0085-6690-44d8-ae91-f1653913e622",
    "_uuid": "2e3271e6-ab0f-4979-a0d8-f2c195ac09e9",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:45.043776Z",
     "iopub.status.busy": "2023-12-07T21:19:45.042049Z",
     "iopub.status.idle": "2023-12-07T21:19:45.184622Z",
     "shell.execute_reply": "2023-12-07T21:19:45.182563Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.387503,
     "end_time": "2023-12-07T21:19:45.187236",
     "exception": false,
     "start_time": "2023-12-07T21:19:44.799733",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 1 × 4</caption>\n",
       "<thead>\n",
       "\t<tr><th></th><th scope=col>n.trees</th><th scope=col>interaction.depth</th><th scope=col>shrinkage</th><th scope=col>n.minobsinnode</th></tr>\n",
       "\t<tr><th></th><th scope=col>&lt;int&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><th scope=row>1000</th><td>1000</td><td>7</td><td>0.1</td><td>40</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 1 × 4\n",
       "\\begin{tabular}{r|llll}\n",
       "  & n.trees & interaction.depth & shrinkage & n.minobsinnode\\\\\n",
       "  & <int> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t1000 & 1000 & 7 & 0.1 & 40\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 1 × 4\n",
       "\n",
       "| <!--/--> | n.trees &lt;int&gt; | interaction.depth &lt;dbl&gt; | shrinkage &lt;dbl&gt; | n.minobsinnode &lt;dbl&gt; |\n",
       "|---|---|---|---|---|\n",
       "| 1000 | 1000 | 7 | 0.1 | 40 |\n",
       "\n"
      ],
      "text/plain": [
       "     n.trees interaction.depth shrinkage n.minobsinnode\n",
       "1000 1000    7                 0.1       40            "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "image/png": "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"
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "plot(gbm1,type='l')\n",
    "\n",
    "\n",
    "gbm1$bestTune"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 36,
   "id": "f9f0e04d",
   "metadata": {
    "_cell_guid": "2973f928-def3-4792-a879-0a455c883740",
    "_uuid": "f8007f1c-1a11-4eb3-9e86-5616a549faac",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:45.268060Z",
     "iopub.status.busy": "2023-12-07T21:19:45.266286Z",
     "iopub.status.idle": "2023-12-07T21:19:45.287142Z",
     "shell.execute_reply": "2023-12-07T21:19:45.285212Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.064663,
     "end_time": "2023-12-07T21:19:45.289679",
     "exception": false,
     "start_time": "2023-12-07T21:19:45.225016",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.441153531802469"
      ],
      "text/latex": [
       "0.441153531802469"
      ],
      "text/markdown": [
       "0.441153531802469"
      ],
      "text/plain": [
       "[1] 0.4411535"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "log_loss_gbm1 <- gbm1$results[967, 5]\n",
    "log_loss_gbm1"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 37,
   "id": "52c54afc",
   "metadata": {
    "_cell_guid": "e647eb82-b8c1-4b75-ab09-2e4d672fc793",
    "_uuid": "00253100-bd61-45d8-9d52-7ba2625440fc",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:45.368547Z",
     "iopub.status.busy": "2023-12-07T21:19:45.366778Z",
     "iopub.status.idle": "2023-12-07T21:19:46.547759Z",
     "shell.execute_reply": "2023-12-07T21:19:46.545812Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 1.22326,
     "end_time": "2023-12-07T21:19:46.550346",
     "exception": false,
     "start_time": "2023-12-07T21:19:45.327086",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>31851</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 31851\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 31851\n",
       "2. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 31851     2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "gbm1_predicted_te <- predict(gbm1, smoking_train_te, type='prob')\n",
    "\n",
    "dim(gbm1_predicted_te)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 38,
   "id": "f2561a2f",
   "metadata": {
    "_cell_guid": "ca6e3176-9472-49d2-a33f-c2768f5ab697",
    "_uuid": "c0738fc0-ffe6-47d6-ba06-6c85292ced27",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:46.630791Z",
     "iopub.status.busy": "2023-12-07T21:19:46.628967Z",
     "iopub.status.idle": "2023-12-07T21:19:46.697205Z",
     "shell.execute_reply": "2023-12-07T21:19:46.695109Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.111089,
     "end_time": "2023-12-07T21:19:46.699900",
     "exception": false,
     "start_time": "2023-12-07T21:19:46.588811",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Assuming the positive class is 1\n",
      "\n",
      "Assuming the positive class has higher x values\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "0.866136831888244"
      ],
      "text/latex": [
       "0.866136831888244"
      ],
      "text/markdown": [
       "0.866136831888244"
      ],
      "text/plain": [
       "[1] 0.8661368"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "cut.obj_gbm <- cutpointr(x = gbm1_predicted_te$Positive,\n",
    "                     class = smoking_train_te$smoking,\n",
    "                          na.rm = TRUE,\n",
    "                        method = maximize_metric, \n",
    "                           metric = prod_sens_spec)\n",
    "\n",
    "auc_gbm1 <- auc(cut.obj_gbm )\n",
    "auc_gbm1"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 39,
   "id": "5cf287f6",
   "metadata": {
    "_cell_guid": "6d9c9181-b880-4894-8220-9feabf321601",
    "_uuid": "2751f86d-25bc-4c16-b678-90d2551bc508",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:46.780753Z",
     "iopub.status.busy": "2023-12-07T21:19:46.778893Z",
     "iopub.status.idle": "2023-12-07T21:19:46.801349Z",
     "shell.execute_reply": "2023-12-07T21:19:46.799279Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.065753,
     "end_time": "2023-12-07T21:19:46.803882",
     "exception": false,
     "start_time": "2023-12-07T21:19:46.738129",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "0.486829456431213"
      ],
      "text/latex": [
       "0.486829456431213"
      ],
      "text/markdown": [
       "0.486829456431213"
      ],
      "text/plain": [
       "[1] 0.4868295"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "opt_cut_gbm <- cut.obj_gbm$optimal_cutpoint\n",
    "opt_cut_gbm"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 40,
   "id": "8a8316c0",
   "metadata": {
    "_cell_guid": "4a22ed83-6481-43f5-8346-2501924cd92f",
    "_uuid": "d456fa96-6b21-47b8-ad59-65452f8193f0",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:46.884624Z",
     "iopub.status.busy": "2023-12-07T21:19:46.882760Z",
     "iopub.status.idle": "2023-12-07T21:19:46.945845Z",
     "shell.execute_reply": "2023-12-07T21:19:46.943711Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.106421,
     "end_time": "2023-12-07T21:19:46.948357",
     "exception": false,
     "start_time": "2023-12-07T21:19:46.841936",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/plain": [
       "   pred_class_gbm1\n",
       "        0     1\n",
       "  0 13675  4332\n",
       "  1  2579 11265"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "0.783020941257731"
      ],
      "text/latex": [
       "0.783020941257731"
      ],
      "text/markdown": [
       "0.783020941257731"
      ],
      "text/plain": [
       "[1] 0.7830209"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "pred_class_gbm1 <- ifelse(gbm1_predicted_te$Positive > opt_cut_gbm,1,0)\n",
    "\n",
    "confusion_gbm1 <- table(smoking_train_te$smoking,pred_class_gbm1)\n",
    "confusion_gbm1\n",
    "\n",
    "acc_gbm1 <- sum(diag(confusion_gbm1))/sum(confusion_gbm1)\n",
    "acc_gbm1"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 41,
   "id": "85610c70",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:47.029995Z",
     "iopub.status.busy": "2023-12-07T21:19:47.028172Z",
     "iopub.status.idle": "2023-12-07T21:19:47.077351Z",
     "shell.execute_reply": "2023-12-07T21:19:47.075220Z"
    },
    "papermill": {
     "duration": 0.092856,
     "end_time": "2023-12-07T21:19:47.079993",
     "exception": false,
     "start_time": "2023-12-07T21:19:46.987137",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stdout",
     "output_type": "stream",
     "text": [
      "Accuracy: 0.7830209 \n",
      "Log Loss: 0.4411535 \n",
      "AUC: 0.8661368 \n",
      "True Negative Rate (TNR)/Specificity: 0.7594269 \n",
      "True Positive Rate (TPR)/Sensitivity: 0.7222543 \n",
      "Precision: 0.8137099 \n"
     ]
    }
   ],
   "source": [
    "## Metrics for Logistic regression without Lasso\n",
    "\n",
    "# Accuracy\n",
    "acc_gbm1 <- sum(diag(confusion_gbm1))/sum(confusion_gbm1)\n",
    "\n",
    "\n",
    "# True Negative Rate (TNR) or Specificity\n",
    "TNR_gbm1 <- confusion_gbm1[1, 1] / sum(confusion_gbm1[1, ])\n",
    "\n",
    "# True Positive Rate (TPR) or Sensitivity or Recall\n",
    "TPR_gbm1 <- confusion_gbm1[2, 2] / sum(confusion_gbm1[,2])\n",
    "\n",
    "# Precision\n",
    "Precision_gbm1 <- confusion_gbm1[2, 2] / sum(confusion_gbm1[2, 2], confusion_gbm1[2, 1])\n",
    "\n",
    "# Print the results\n",
    "cat(\"Accuracy:\", acc_gbm1, \"\\n\")\n",
    "cat(\"Log Loss:\", log_loss_gbm1, \"\\n\")\n",
    "cat(\"AUC:\", auc_gbm1, \"\\n\")\n",
    "cat(\"True Negative Rate (TNR)/Specificity:\", TNR_gbm1, \"\\n\")\n",
    "cat(\"True Positive Rate (TPR)/Sensitivity:\", TPR_gbm1, \"\\n\")\n",
    "cat(\"Precision:\", Precision_gbm1, \"\\n\")"
   ]
  },
  {
   "cell_type": "markdown",
   "id": "b19a5165",
   "metadata": {
    "_cell_guid": "ad277bb9-2f25-411e-ba65-2c7d0d041b80",
    "_uuid": "252757ef-654d-4cbc-b7a9-4e51befafb8a",
    "papermill": {
     "duration": 0.04082,
     "end_time": "2023-12-07T21:19:47.160909",
     "exception": false,
     "start_time": "2023-12-07T21:19:47.120089",
     "status": "completed"
    },
    "tags": []
   },
   "source": [
    "## **Variable Importance**"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 42,
   "id": "92ddc34a",
   "metadata": {
    "_cell_guid": "c335ca2a-fb7b-4e09-96e3-5eea065649bf",
    "_uuid": "9a3169b8-0176-438b-89a5-82003fa36ea2",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:47.244417Z",
     "iopub.status.busy": "2023-12-07T21:19:47.242543Z",
     "iopub.status.idle": "2023-12-07T21:19:47.376554Z",
     "shell.execute_reply": "2023-12-07T21:19:47.374541Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.178758,
     "end_time": "2023-12-07T21:19:47.379250",
     "exception": false,
     "start_time": "2023-12-07T21:19:47.200492",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>19</li><li>21</li><li>20</li><li>6</li><li>5</li><li>3</li><li>8</li><li>7</li><li>9</li><li>12</li><li>16</li><li>4</li><li>15</li><li>10</li><li>17</li><li>1</li><li>13</li><li>11</li><li>18</li><li>14</li><li>2</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 19\n",
       "\\item 21\n",
       "\\item 20\n",
       "\\item 6\n",
       "\\item 5\n",
       "\\item 3\n",
       "\\item 8\n",
       "\\item 7\n",
       "\\item 9\n",
       "\\item 12\n",
       "\\item 16\n",
       "\\item 4\n",
       "\\item 15\n",
       "\\item 10\n",
       "\\item 17\n",
       "\\item 1\n",
       "\\item 13\n",
       "\\item 11\n",
       "\\item 18\n",
       "\\item 14\n",
       "\\item 2\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 19\n",
       "2. 21\n",
       "3. 20\n",
       "4. 6\n",
       "5. 5\n",
       "6. 3\n",
       "7. 8\n",
       "8. 7\n",
       "9. 9\n",
       "10. 12\n",
       "11. 16\n",
       "12. 4\n",
       "13. 15\n",
       "14. 10\n",
       "15. 17\n",
       "16. 1\n",
       "17. 13\n",
       "18. 11\n",
       "19. 18\n",
       "20. 14\n",
       "21. 2\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       " [1] 19 21 20  6  5  3  8  7  9 12 16  4 15 10 17  1 13 11 18 14  2"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "top_gbm1 <- (varImp(gbm1)[[1]])\n",
    "\n",
    "order(top_gbm1$Overall)\n",
    "\n",
    "top_gbm1$features <- rownames(top_gbm1)"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 43,
   "id": "7b6cac15",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:47.463916Z",
     "iopub.status.busy": "2023-12-07T21:19:47.462155Z",
     "iopub.status.idle": "2023-12-07T21:19:47.477393Z",
     "shell.execute_reply": "2023-12-07T21:19:47.475420Z"
    },
    "papermill": {
     "duration": 0.060093,
     "end_time": "2023-12-07T21:19:47.480051",
     "exception": false,
     "start_time": "2023-12-07T21:19:47.419958",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "top_gbm1 <- top_gbm1[order(top_gbm1$Overall, decreasing = TRUE),]"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 44,
   "id": "f490e82e",
   "metadata": {
    "_cell_guid": "1cbf3162-9875-45e9-8a11-254b37198185",
    "_uuid": "117af2cf-86ff-4daa-a90d-bab6a1fbc220",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:47.564139Z",
     "iopub.status.busy": "2023-12-07T21:19:47.562444Z",
     "iopub.status.idle": "2023-12-07T21:19:47.888921Z",
     "shell.execute_reply": "2023-12-07T21:19:47.886828Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.371565,
     "end_time": "2023-12-07T21:19:47.891315",
     "exception": false,
     "start_time": "2023-12-07T21:19:47.519750",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Warning message:\n",
      "“\u001b[1m\u001b[22mThe `size` argument of `element_line()` is deprecated as of ggplot2 3.4.0.\n",
      "\u001b[36mℹ\u001b[39m Please use the `linewidth` argument instead.”\n"
     ]
    },
    {
     "data": {
      "image/png": "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\nAICJ+D+bZfpU7NBhKQAAAABJRU5ErkJggg=="
     },
     "metadata": {
      "image/png": {
       "height": 420,
       "width": 420
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "library(ggplot2)\n",
    "\n",
    "plot_imp <- ggplot(top_gbm1, aes( Overall, reorder(features, Overall))) +\n",
    "  geom_bar(stat=\"identity\", fill = \"skyblue\") +\n",
    "  theme_classic() +\n",
    " labs(title=\"Feature Importance (Gradient Boosting Machine)\", x=\"Importance\", y=\"Features\") +\n",
    " theme(axis.text.y = element_text(angle = 0, hjust = 1)) +\n",
    "theme(panel.grid.major.x = element_line(color = \"grey\",\n",
    "                                          size = 0.5,\n",
    "                                          linetype = 1))\n",
    "plot_imp "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 45,
   "id": "40a3a555",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:47.977487Z",
     "iopub.status.busy": "2023-12-07T21:19:47.975680Z",
     "iopub.status.idle": "2023-12-07T21:19:48.374863Z",
     "shell.execute_reply": "2023-12-07T21:19:48.372715Z"
    },
    "papermill": {
     "duration": 0.444888,
     "end_time": "2023-12-07T21:19:48.377500",
     "exception": false,
     "start_time": "2023-12-07T21:19:47.932612",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "\n",
    "ggsave(\"plot_imp.png\", width = 5, height = 5) "
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 46,
   "id": "098fd843",
   "metadata": {
    "_cell_guid": "434ead64-f38b-41e0-aae5-acd35f4993ac",
    "_uuid": "e21c983a-116c-4ba6-8b18-53d61caf7c86",
    "collapsed": false,
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:48.464334Z",
     "iopub.status.busy": "2023-12-07T21:19:48.462515Z",
     "iopub.status.idle": "2023-12-07T21:19:48.555422Z",
     "shell.execute_reply": "2023-12-07T21:19:48.553433Z"
    },
    "jupyter": {
     "outputs_hidden": false
    },
    "papermill": {
     "duration": 0.139059,
     "end_time": "2023-12-07T21:19:48.557913",
     "exception": false,
     "start_time": "2023-12-07T21:19:48.418854",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>'Logistic Regression with Ridge Penalty'</li><li>'Linear Regression with Lasso Penalty'</li><li>'Gradient Boosting Machine'</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 'Logistic Regression with Ridge Penalty'\n",
       "\\item 'Linear Regression with Lasso Penalty'\n",
       "\\item 'Gradient Boosting Machine'\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 'Logistic Regression with Ridge Penalty'\n",
       "2. 'Linear Regression with Lasso Penalty'\n",
       "3. 'Gradient Boosting Machine'\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] \"Logistic Regression with Ridge Penalty\"\n",
       "[2] \"Linear Regression with Lasso Penalty\"  \n",
       "[3] \"Gradient Boosting Machine\"             "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.832</li><li>0.835</li><li>0.866</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.832\n",
       "\\item 0.835\n",
       "\\item 0.866\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.832\n",
       "2. 0.835\n",
       "3. 0.866\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.832 0.835 0.866"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.752</li><li>0.754</li><li>0.783</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.752\n",
       "\\item 0.754\n",
       "\\item 0.783\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.752\n",
       "2. 0.754\n",
       "3. 0.783\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.752 0.754 0.783"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.495</li><li>0.492</li><li>0.441</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.495\n",
       "\\item 0.492\n",
       "\\item 0.441\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.495\n",
       "2. 0.492\n",
       "3. 0.441\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.495 0.492 0.441"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.693</li><li>0.702</li><li>0.759</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.693\n",
       "\\item 0.702\n",
       "\\item 0.759\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.693\n",
       "2. 0.702\n",
       "3. 0.759\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.693 0.702 0.759"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.675</li><li>0.679</li><li>0.722</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.675\n",
       "\\item 0.679\n",
       "\\item 0.722\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.675\n",
       "2. 0.679\n",
       "3. 0.722\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.675 0.679 0.722"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<style>\n",
       ".list-inline {list-style: none; margin:0; padding: 0}\n",
       ".list-inline>li {display: inline-block}\n",
       ".list-inline>li:not(:last-child)::after {content: \"\\00b7\"; padding: 0 .5ex}\n",
       "</style>\n",
       "<ol class=list-inline><li>0.829</li><li>0.822</li><li>0.814</li></ol>\n"
      ],
      "text/latex": [
       "\\begin{enumerate*}\n",
       "\\item 0.829\n",
       "\\item 0.822\n",
       "\\item 0.814\n",
       "\\end{enumerate*}\n"
      ],
      "text/markdown": [
       "1. 0.829\n",
       "2. 0.822\n",
       "3. 0.814\n",
       "\n",
       "\n"
      ],
      "text/plain": [
       "[1] 0.829 0.822 0.814"
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    },
    {
     "data": {
      "text/html": [
       "<table class=\"dataframe\">\n",
       "<caption>A data.frame: 3 × 7</caption>\n",
       "<thead>\n",
       "\t<tr><th scope=col>Model</th><th scope=col>AUC</th><th scope=col>Accuracy</th><th scope=col>Log Loss</th><th scope=col>TNR</th><th scope=col>TPR</th><th scope=col>Precision</th></tr>\n",
       "\t<tr><th scope=col>&lt;chr&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th><th scope=col>&lt;dbl&gt;</th></tr>\n",
       "</thead>\n",
       "<tbody>\n",
       "\t<tr><td>Logistic Regression with Ridge Penalty</td><td>0.832</td><td>0.752</td><td>0.495</td><td>0.693</td><td>0.675</td><td>0.829</td></tr>\n",
       "\t<tr><td>Linear Regression with Lasso Penalty  </td><td>0.835</td><td>0.754</td><td>0.492</td><td>0.702</td><td>0.679</td><td>0.822</td></tr>\n",
       "\t<tr><td>Gradient Boosting Machine             </td><td>0.866</td><td>0.783</td><td>0.441</td><td>0.759</td><td>0.722</td><td>0.814</td></tr>\n",
       "</tbody>\n",
       "</table>\n"
      ],
      "text/latex": [
       "A data.frame: 3 × 7\n",
       "\\begin{tabular}{lllllll}\n",
       " Model & AUC & Accuracy & Log Loss & TNR & TPR & Precision\\\\\n",
       " <chr> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl> & <dbl>\\\\\n",
       "\\hline\n",
       "\t Logistic Regression with Ridge Penalty & 0.832 & 0.752 & 0.495 & 0.693 & 0.675 & 0.829\\\\\n",
       "\t Linear Regression with Lasso Penalty   & 0.835 & 0.754 & 0.492 & 0.702 & 0.679 & 0.822\\\\\n",
       "\t Gradient Boosting Machine              & 0.866 & 0.783 & 0.441 & 0.759 & 0.722 & 0.814\\\\\n",
       "\\end{tabular}\n"
      ],
      "text/markdown": [
       "\n",
       "A data.frame: 3 × 7\n",
       "\n",
       "| Model &lt;chr&gt; | AUC &lt;dbl&gt; | Accuracy &lt;dbl&gt; | Log Loss &lt;dbl&gt; | TNR &lt;dbl&gt; | TPR &lt;dbl&gt; | Precision &lt;dbl&gt; |\n",
       "|---|---|---|---|---|---|---|\n",
       "| Logistic Regression with Ridge Penalty | 0.832 | 0.752 | 0.495 | 0.693 | 0.675 | 0.829 |\n",
       "| Linear Regression with Lasso Penalty   | 0.835 | 0.754 | 0.492 | 0.702 | 0.679 | 0.822 |\n",
       "| Gradient Boosting Machine              | 0.866 | 0.783 | 0.441 | 0.759 | 0.722 | 0.814 |\n",
       "\n"
      ],
      "text/plain": [
       "  Model                                  AUC   Accuracy Log Loss TNR   TPR  \n",
       "1 Logistic Regression with Ridge Penalty 0.832 0.752    0.495    0.693 0.675\n",
       "2 Linear Regression with Lasso Penalty   0.835 0.754    0.492    0.702 0.679\n",
       "3 Gradient Boosting Machine              0.866 0.783    0.441    0.759 0.722\n",
       "  Precision\n",
       "1 0.829    \n",
       "2 0.822    \n",
       "3 0.814    "
      ]
     },
     "metadata": {},
     "output_type": "display_data"
    }
   ],
   "source": [
    "\n",
    "\n",
    "title <- c(\"Logistic Regression with Ridge Penalty\", \"Linear Regression with Lasso Penalty\", \"Gradient Boosting Machine\")\n",
    "title\n",
    "auc_all <- c(auc_ridge,auc_lasso, auc_gbm1)\n",
    "round(auc_all, digits = 3)\n",
    "\n",
    "acc_all <- c(acc_ridge, acc_lasso,acc_gbm1)\n",
    "round(acc_all, digits = 3)\n",
    "\n",
    "logLoss_all <- c(log_loss_ridge, log_loss_lasso, log_loss_gbm1)\n",
    "round(logLoss_all, digits = 3)\n",
    "\n",
    "TNR_all <- c(TNR_ridge, TNR_lasso, TNR_gbm1)\n",
    "round(TNR_all, digits = 3)\n",
    "\n",
    "TPR_all <- c(TPR_ridge, TPR_lasso, TPR_gbm1)\n",
    "round(TPR_all, digits = 3)\n",
    "\n",
    "Precision_all <- c(Precision_ridge, Precision_lasso, Precision_gbm1)\n",
    "round(Precision_all, digits = 3)\n",
    "\n",
    "\n",
    "\n",
    "\n",
    "final_mod_metrics <- data.frame(title,\n",
    "                                round(auc_all, digits = 3), round(acc_all, digits = 3),round(logLoss_all, digits = 3),\n",
    "                                round(TNR_all, digits = 3), round(TPR_all, digits = 3), round(Precision_all, digits = 3))\n",
    "\n",
    "\n",
    "new_colnames <- c(\"Model\", \"AUC\",\"Accuracy\", \"Log Loss\", \"TNR\", \"TPR\", \"Precision\")\n",
    "colnames(final_mod_metrics) <- new_colnames\n",
    "\n",
    "final_mod_metrics"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 47,
   "id": "79e4d175",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:19:48.648196Z",
     "iopub.status.busy": "2023-12-07T21:19:48.646325Z",
     "iopub.status.idle": "2023-12-07T21:20:01.583183Z",
     "shell.execute_reply": "2023-12-07T21:20:01.580306Z"
    },
    "papermill": {
     "duration": 12.990342,
     "end_time": "2023-12-07T21:20:01.591553",
     "exception": false,
     "start_time": "2023-12-07T21:19:48.601211",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [
    {
     "name": "stderr",
     "output_type": "stream",
     "text": [
      "Installing package into ‘/usr/local/lib/R/site-library’\n",
      "(as ‘lib’ is unspecified)\n",
      "\n"
     ]
    },
    {
     "data": {
      "text/html": [
       "<!doctype html>\n",
       "<html>\n",
       "\t<head>\n",
       "\t\t<meta charset=\"utf-8\">\n",
       "\t\t<script title=\"htmlwidgets\" src=\"data:application/javascript;base64,KGZ1bmN0aW9uKCkgewogIC8vIElmIHdpbmRvdy5IVE1MV2lkZ2V0cyBpcyBhbHJlYWR5IGRlZmluZWQsIHRoZW4gdXNlIGl0OyBvdGhlcndpc2UgY3JlYXRlIGEKICAvLyBuZXcgb2JqZWN0LiBUaGlzIGFsbG93cyBwcmVjZWRpbmcgY29kZSB0byBzZXQgb3B0aW9ucyB0aGF0IGFmZmVjdCB0aGUKICAvLyBpbml0aWFsaXphdGlvbiBwcm9jZXNzICh0aG91Z2ggbm9uZSBjdXJyZW50bHkgZXhpc3QpLgogIHdpbmRvdy5IVE1MV2lkZ2V0cyA9IHdpbmRvdy5IVE1MV2lkZ2V0cyB8fCB7fTsKCiAgLy8gU2VlIGlmIHdlJ3JlIHJ1bm5pbmcgaW4gYSB2aWV3ZXIgcGFuZS4gSWYgbm90LCB3ZSdyZSBpbiBhIHdlYiBicm93c2VyLgogIHZhciB2aWV3ZXJNb2RlID0gd2luZG93LkhUTUxXaWRnZXRzLnZpZXdlck1vZGUgPQogICAgICAvXGJ2aWV3ZXJfcGFuZT0xXGIvLnRlc3Qod2luZG93LmxvY2F0aW9uKTsKCiAgLy8gU2VlIGlmIHdlJ3JlIHJ1bm5pbmcgaW4gU2hpbnkgbW9kZS4gSWYgbm90LCBpdCdzIGEgc3RhdGljIGRvY3VtZW50LgogIC8vIE5vdGUgdGhhdCBzdGF0aWMgd2lkZ2V0cyBjYW4gYXBwZWFyIGluIGJvdGggU2hpbnkgYW5kIHN0YXRpYyBtb2RlcywgYnV0CiAgLy8gb2J2aW91c2x5LCBTaGlueSB3aWRnZXRzIGNhbiBvbmx5IGFwcGVhciBpbiBTaGlueSBhcHBzL2RvY3VtZW50cy4KICB2YXIgc2hpbnlNb2RlID0gd2luZG93LkhUTUxXaWRnZXRzLnNoaW55TW9kZSA9CiAgICAgIHR5cGVvZih3aW5kb3cuU2hpbnkpICE9PSAidW5kZWZpbmVkIiAmJiAhIXdpbmRvdy5TaGlueS5vdXRwdXRCaW5kaW5nczsKCiAgLy8gV2UgY2FuJ3QgY291bnQgb24galF1ZXJ5IGJlaW5nIGF2YWlsYWJsZSwgc28gd2UgaW1wbGVtZW50IG91ciBvd24KICAvLyB2ZXJzaW9uIGlmIG5lY2Vzc2FyeS4KICBmdW5jdGlvbiBxdWVyeVNlbGVjdG9yQWxsKHNjb3BlLCBzZWxlY3RvcikgewogICAgaWYgKHR5cGVvZihqUXVlcnkpICE9PSAidW5kZWZpbmVkIiAmJiBzY29wZSBpbnN0YW5jZW9mIGpRdWVyeSkgewogICAgICByZXR1cm4gc2NvcGUuZmluZChzZWxlY3Rvcik7CiAgICB9CiAgICBpZiAoc2NvcGUucXVlcnlTZWxlY3RvckFsbCkgewogICAgICByZXR1cm4gc2NvcGUucXVlcnlTZWxlY3RvckFsbChzZWxlY3Rvcik7CiAgICB9CiAgfQoKICBmdW5jdGlvbiBhc0FycmF5KHZhbHVlKSB7CiAgICBpZiAodmFsdWUgPT09IG51bGwpCiAgICAgIHJldHVybiBbXTsKICAgIGlmICgkLmlzQXJyYXkodmFsdWUpKQogICAgICByZXR1cm4gdmFsdWU7CiAgICByZXR1cm4gW3ZhbHVlXTsKICB9CgogIC8vIEltcGxlbWVudCBqUXVlcnkncyBleHRlbmQKICBmdW5jdGlvbiBleHRlbmQodGFyZ2V0IC8qLCAuLi4gKi8pIHsKICAgIGlmIChhcmd1bWVudHMubGVuZ3RoID09IDEpIHsKICAgICAgcmV0dXJuIHRhcmdldDsKICAgIH0KICAgIGZvciAodmFyIGkgPSAxOyBpIDwgYXJndW1lbnRzLmxlbmd0aDsgaSsrKSB7CiAgICAgIHZhciBzb3VyY2UgPSBhcmd1bWVudHNbaV07CiAgICAgIGZvciAodmFyIHByb3AgaW4gc291cmNlKSB7CiAgICAgICAgaWYgKHNvdXJjZS5oYXNPd25Qcm9wZXJ0eShwcm9wKSkgewogICAgICAgICAgdGFyZ2V0W3Byb3BdID0gc291cmNlW3Byb3BdOwogICAgICAgIH0KICAgICAgfQogICAgfQogICAgcmV0dXJuIHRhcmdldDsKICB9CgogIC8vIElFOCBkb2Vzbid0IHN1cHBvcnQgQXJyYXkuZm9yRWFjaC4KICBmdW5jdGlvbiBmb3JFYWNoKHZhbHVlcywgY2FsbGJhY2ssIHRoaXNBcmcpIHsKICAgIGlmICh2YWx1ZXMuZm9yRWFjaCkgewogICAgICB2YWx1ZXMuZm9yRWFjaChjYWxsYmFjaywgdGhpc0FyZyk7CiAgICB9IGVsc2UgewogICAgICBmb3IgKHZhciBpID0gMDsgaSA8IHZhbHVlcy5sZW5ndGg7IGkrKykgewogICAgICAgIGNhbGxiYWNrLmNhbGwodGhpc0FyZywgdmFsdWVzW2ldLCBpLCB2YWx1ZXMpOwogICAgICB9CiAgICB9CiAgfQoKICAvLyBSZXBsYWNlcyB0aGUgc3BlY2lmaWVkIG1ldGhvZCB3aXRoIHRoZSByZXR1cm4gdmFsdWUgb2YgZnVuY1NvdXJjZS4KICAvLwogIC8vIE5vdGUgdGhhdCBmdW5jU291cmNlIHNob3VsZCBub3QgQkUgdGhlIG5ldyBtZXRob2QsIGl0IHNob3VsZCBiZSBhIGZ1bmN0aW9uCiAgLy8gdGhhdCBSRVRVUk5TIHRoZSBuZXcgbWV0aG9kLiBmdW5jU291cmNlIHJlY2VpdmVzIGEgc2luZ2xlIGFyZ3VtZW50IHRoYXQgaXMKICAvLyB0aGUgb3ZlcnJpZGRlbiBtZXRob2QsIGl0IGNhbiBiZSBjYWxsZWQgZnJvbSB0aGUgbmV3IG1ldGhvZC4gVGhlIG92ZXJyaWRkZW4KICAvLyBtZXRob2QgY2FuIGJlIGNhbGxlZCBsaWtlIGEgcmVndWxhciBmdW5jdGlvbiwgaXQgaGFzIHRoZSB0YXJnZXQgcGVybWFuZW50bHkKICAvLyBib3VuZCB0byBpdCBzbyAidGhpcyIgd2lsbCB3b3JrIGNvcnJlY3RseS4KICBmdW5jdGlvbiBvdmVycmlkZU1ldGhvZCh0YXJnZXQsIG1ldGhvZE5hbWUsIGZ1bmNTb3VyY2UpIHsKICAgIHZhciBzdXBlckZ1bmMgPSB0YXJnZXRbbWV0aG9kTmFtZV0gfHwgZnVuY3Rpb24oKSB7fTsKICAgIHZhciBzdXBlckZ1bmNCb3VuZCA9IGZ1bmN0aW9uKCkgewogICAgICByZXR1cm4gc3VwZXJGdW5jLmFwcGx5KHRhcmdldCwgYXJndW1lbnRzKTsKICAgIH07CiAgICB0YXJnZXRbbWV0aG9kTmFtZV0gPSBmdW5jU291cmNlKHN1cGVyRnVuY0JvdW5kKTsKICB9CgogIC8vIEFkZCBhIG1ldGhvZCB0byBkZWxlZ2F0b3IgdGhhdCwgd2hlbiBpbnZva2VkLCBjYWxscwogIC8vIGRlbGVnYXRlZS5tZXRob2ROYW1lLiBJZiB0aGVyZSBpcyBubyBzdWNoIG1ldGhvZCBvbgogIC8vIHRoZSBkZWxlZ2F0ZWUsIGJ1dCB0aGVyZSB3YXMgb25lIG9uIGRlbGVnYXRvciBiZWZvcmUKICAvLyBkZWxlZ2F0ZU1ldGhvZCB3YXMgY2FsbGVkLCB0aGVuIHRoZSBvcmlnaW5hbCB2ZXJzaW9uCiAgLy8gaXMgaW52b2tlZCBpbnN0ZWFkLgogIC8vIEZvciBleGFtcGxlOgogIC8vCiAgLy8gdmFyIGEgPSB7CiAgLy8gICBtZXRob2QxOiBmdW5jdGlvbigpIHsgY29uc29sZS5sb2coJ2ExJyk7IH0KICAvLyAgIG1ldGhvZDI6IGZ1bmN0aW9uKCkgeyBjb25zb2xlLmxvZygnYTInKTsgfQogIC8vIH07CiAgLy8gdmFyIGIgPSB7CiAgLy8gICBtZXRob2QxOiBmdW5jdGlvbigpIHsgY29uc29sZS5sb2coJ2IxJyk7IH0KICAvLyB9OwogIC8vIGRlbGVnYXRlTWV0aG9kKGEsIGIsICJtZXRob2QxIik7CiAgLy8gZGVsZWdhdGVNZXRob2QoYSwgYiwgIm1ldGhvZDIiKTsKICAvLyBhLm1ldGhvZDEoKTsKICAvLyBhLm1ldGhvZDIoKTsKICAvLwogIC8vIFRoZSBvdXRwdXQgd291bGQgYmUgImIxIiwgImEyIi4KICBmdW5jdGlvbiBkZWxlZ2F0ZU1ldGhvZChkZWxlZ2F0b3IsIGRlbGVnYXRlZSwgbWV0aG9kTmFtZSkgewogICAgdmFyIGluaGVyaXRlZCA9IGRlbGVnYXRvclttZXRob2ROYW1lXTsKICAgIGRlbGVnYXRvclttZXRob2ROYW1lXSA9IGZ1bmN0aW9uKCkgewogICAgICB2YXIgdGFyZ2V0ID0gZGVsZWdhdGVlOwogICAgICB2YXIgbWV0aG9kID0gZGVsZWdhdGVlW21ldGhvZE5hbWVdOwoKICAgICAgLy8gVGhlIG1ldGhvZCBkb2Vzbid0IGV4aXN0IG9uIHRoZSBkZWxlZ2F0ZWUuIEluc3RlYWQsCiAgICAgIC8vIGNhbGwgdGhlIG1ldGhvZCBvbiB0aGUgZGVsZWdhdG9yLCBpZiBpdCBleGlzdHMuCiAgICAgIGlmICghbWV0aG9kKSB7CiAgICAgICAgdGFyZ2V0ID0gZGVsZWdhdG9yOwogICAgICAgIG1ldGhvZCA9IGluaGVyaXRlZDsKICAgICAgfQoKICAgICAgaWYgKG1ldGhvZCkgewogICAgICAgIHJldHVybiBtZXRob2QuYXBwbHkodGFyZ2V0LCBhcmd1bWVudHMpOwogICAgICB9CiAgICB9OwogIH0KCiAgLy8gSW1wbGVtZW50IGEgdmFndWUgZmFjc2ltaWxpZSBvZiBqUXVlcnkncyBkYXRhIG1ldGhvZAogIGZ1bmN0aW9uIGVsZW1lbnREYXRhKGVsLCBuYW1lLCB2YWx1ZSkgewogICAgaWYgKGFyZ3VtZW50cy5sZW5ndGggPT0gMikgewogICAgICByZXR1cm4gZWxbImh0bWx3aWRnZXRfZGF0YV8iICsgbmFtZV07CiAgICB9IGVsc2UgaWYgKGFyZ3VtZW50cy5sZW5ndGggPT0gMykgewogICAgICBlbFsiaHRtbHdpZGdldF9kYXRhXyIgKyBuYW1lXSA9IHZhbHVlOwogICAgICByZXR1cm4gZWw7CiAgICB9IGVsc2UgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIldyb25nIG51bWJlciBvZiBhcmd1bWVudHMgZm9yIGVsZW1lbnREYXRhOiAiICsKICAgICAgICBhcmd1bWVudHMubGVuZ3RoKTsKICAgIH0KICB9CgogIC8vIGh0dHA6Ly9zdGFja292ZXJmbG93LmNvbS9xdWVzdGlvbnMvMzQ0NjE3MC9lc2NhcGUtc3RyaW5nLWZvci11c2UtaW4tamF2YXNjcmlwdC1yZWdleAogIGZ1bmN0aW9uIGVzY2FwZVJlZ0V4cChzdHIpIHsKICAgIHJldHVybiBzdHIucmVwbGFjZSgvW1wtXFtcXVwvXHtcfVwoXClcKlwrXD9cLlxcXF5cJFx8XS9nLCAiXFwkJiIpOwogIH0KCiAgZnVuY3Rpb24gaGFzQ2xhc3MoZWwsIGNsYXNzTmFtZSkgewogICAgdmFyIHJlID0gbmV3IFJlZ0V4cCgiXFxiIiArIGVzY2FwZVJlZ0V4cChjbGFzc05hbWUpICsgIlxcYiIpOwogICAgcmV0dXJuIHJlLnRlc3QoZWwuY2xhc3NOYW1lKTsKICB9CgogIC8vIGVsZW1lbnRzIC0gYXJyYXkgKG9yIGFycmF5LWxpa2Ugb2JqZWN0KSBvZiBIVE1MIGVsZW1lbnRzCiAgLy8gY2xhc3NOYW1lIC0gY2xhc3MgbmFtZSB0byB0ZXN0IGZvcgogIC8vIGluY2x1ZGUgLSBpZiB0cnVlLCBvbmx5IHJldHVybiBlbGVtZW50cyB3aXRoIGdpdmVuIGNsYXNzTmFtZTsKICAvLyAgIGlmIGZhbHNlLCBvbmx5IHJldHVybiBlbGVtZW50cyAqd2l0aG91dCogZ2l2ZW4gY2xhc3NOYW1lCiAgZnVuY3Rpb24gZmlsdGVyQnlDbGFzcyhlbGVtZW50cywgY2xhc3NOYW1lLCBpbmNsdWRlKSB7CiAgICB2YXIgcmVzdWx0cyA9IFtdOwogICAgZm9yICh2YXIgaSA9IDA7IGkgPCBlbGVtZW50cy5sZW5ndGg7IGkrKykgewogICAgICBpZiAoaGFzQ2xhc3MoZWxlbWVudHNbaV0sIGNsYXNzTmFtZSkgPT0gaW5jbHVkZSkKICAgICAgICByZXN1bHRzLnB1c2goZWxlbWVudHNbaV0pOwogICAgfQogICAgcmV0dXJuIHJlc3VsdHM7CiAgfQoKICBmdW5jdGlvbiBvbihvYmosIGV2ZW50TmFtZSwgZnVuYykgewogICAgaWYgKG9iai5hZGRFdmVudExpc3RlbmVyKSB7CiAgICAgIG9iai5hZGRFdmVudExpc3RlbmVyKGV2ZW50TmFtZSwgZnVuYywgZmFsc2UpOwogICAgfSBlbHNlIGlmIChvYmouYXR0YWNoRXZlbnQpIHsKICAgICAgb2JqLmF0dGFjaEV2ZW50KGV2ZW50TmFtZSwgZnVuYyk7CiAgICB9CiAgfQoKICBmdW5jdGlvbiBvZmYob2JqLCBldmVudE5hbWUsIGZ1bmMpIHsKICAgIGlmIChvYmoucmVtb3ZlRXZlbnRMaXN0ZW5lcikKICAgICAgb2JqLnJlbW92ZUV2ZW50TGlzdGVuZXIoZXZlbnROYW1lLCBmdW5jLCBmYWxzZSk7CiAgICBlbHNlIGlmIChvYmouZGV0YWNoRXZlbnQpIHsKICAgICAgb2JqLmRldGFjaEV2ZW50KGV2ZW50TmFtZSwgZnVuYyk7CiAgICB9CiAgfQoKICAvLyBUcmFuc2xhdGUgYXJyYXkgb2YgdmFsdWVzIHRvIHRvcC9yaWdodC9ib3R0b20vbGVmdCwgYXMgdXN1YWwgd2l0aAogIC8vIHRoZSAicGFkZGluZyIgQ1NTIHByb3BlcnR5CiAgLy8gaHR0cHM6Ly9kZXZlbG9wZXIubW96aWxsYS5vcmcvZW4tVVMvZG9jcy9XZWIvQ1NTL3BhZGRpbmcKICBmdW5jdGlvbiB1bnBhY2tQYWRkaW5nKHZhbHVlKSB7CiAgICBpZiAodHlwZW9mKHZhbHVlKSA9PT0gIm51bWJlciIpCiAgICAgIHZhbHVlID0gW3ZhbHVlXTsKICAgIGlmICh2YWx1ZS5sZW5ndGggPT09IDEpIHsKICAgICAgcmV0dXJuIHt0b3A6IHZhbHVlWzBdLCByaWdodDogdmFsdWVbMF0sIGJvdHRvbTogdmFsdWVbMF0sIGxlZnQ6IHZhbHVlWzBdfTsKICAgIH0KICAgIGlmICh2YWx1ZS5sZW5ndGggPT09IDIpIHsKICAgICAgcmV0dXJuIHt0b3A6IHZhbHVlWzBdLCByaWdodDogdmFsdWVbMV0sIGJvdHRvbTogdmFsdWVbMF0sIGxlZnQ6IHZhbHVlWzFdfTsKICAgIH0KICAgIGlmICh2YWx1ZS5sZW5ndGggPT09IDMpIHsKICAgICAgcmV0dXJuIHt0b3A6IHZhbHVlWzBdLCByaWdodDogdmFsdWVbMV0sIGJvdHRvbTogdmFsdWVbMl0sIGxlZnQ6IHZhbHVlWzFdfTsKICAgIH0KICAgIGlmICh2YWx1ZS5sZW5ndGggPT09IDQpIHsKICAgICAgcmV0dXJuIHt0b3A6IHZhbHVlWzBdLCByaWdodDogdmFsdWVbMV0sIGJvdHRvbTogdmFsdWVbMl0sIGxlZnQ6IHZhbHVlWzNdfTsKICAgIH0KICB9CgogIC8vIENvbnZlcnQgYW4gdW5wYWNrZWQgcGFkZGluZyBvYmplY3QgdG8gYSBDU1MgdmFsdWUKICBmdW5jdGlvbiBwYWRkaW5nVG9Dc3MocGFkZGluZ09iaikgewogICAgcmV0dXJuIHBhZGRpbmdPYmoudG9wICsgInB4ICIgKyBwYWRkaW5nT2JqLnJpZ2h0ICsgInB4ICIgKyBwYWRkaW5nT2JqLmJvdHRvbSArICJweCAiICsgcGFkZGluZ09iai5sZWZ0ICsgInB4IjsKICB9CgogIC8vIE1ha2VzIGEgbnVtYmVyIHN1aXRhYmxlIGZvciBDU1MKICBmdW5jdGlvbiBweCh4KSB7CiAgICBpZiAodHlwZW9mKHgpID09PSAibnVtYmVyIikKICAgICAgcmV0dXJuIHggKyAicHgiOwogICAgZWxzZQogICAgICByZXR1cm4geDsKICB9CgogIC8vIFJldHJpZXZlcyBydW50aW1lIHdpZGdldCBzaXppbmcgaW5mb3JtYXRpb24gZm9yIGFuIGVsZW1lbnQuCiAgLy8gVGhlIHJldHVybiB2YWx1ZSBpcyBlaXRoZXIgbnVsbCwgb3IgYW4gb2JqZWN0IHdpdGggZmlsbCwgcGFkZGluZywKICAvLyBkZWZhdWx0V2lkdGgsIGRlZmF1bHRIZWlnaHQgZmllbGRzLgogIGZ1bmN0aW9uIHNpemluZ1BvbGljeShlbCkgewogICAgdmFyIHNpemluZ0VsID0gZG9jdW1lbnQucXVlcnlTZWxlY3Rvcigic2NyaXB0W2RhdGEtZm9yPSciICsgZWwuaWQgKyAiJ11bdHlwZT0nYXBwbGljYXRpb24vaHRtbHdpZGdldC1zaXppbmcnXSIpOwogICAgaWYgKCFzaXppbmdFbCkKICAgICAgcmV0dXJuIG51bGw7CiAgICB2YXIgc3AgPSBKU09OLnBhcnNlKHNpemluZ0VsLnRleHRDb250ZW50IHx8IHNpemluZ0VsLnRleHQgfHwgInt9Iik7CiAgICBpZiAodmlld2VyTW9kZSkgewogICAgICByZXR1cm4gc3Audmlld2VyOwogICAgfSBlbHNlIHsKICAgICAgcmV0dXJuIHNwLmJyb3dzZXI7CiAgICB9CiAgfQoKICAvLyBAcGFyYW0gdGFza3MgQXJyYXkgb2Ygc3RyaW5ncyAob3IgZmFsc3kgdmFsdWUsIGluIHdoaWNoIGNhc2Ugbm8tb3ApLgogIC8vICAgRWFjaCBlbGVtZW50IG11c3QgYmUgYSB2YWxpZCBKYXZhU2NyaXB0IGV4cHJlc3Npb24gdGhhdCB5aWVsZHMgYQogIC8vICAgZnVuY3Rpb24uIE9yLCBjYW4gYmUgYW4gYXJyYXkgb2Ygb2JqZWN0cyB3aXRoICJjb2RlIiBhbmQgImRhdGEiCiAgLy8gICBwcm9wZXJ0aWVzOyBpbiB0aGlzIGNhc2UsIHRoZSAiY29kZSIgcHJvcGVydHkgc2hvdWxkIGJlIGEgc3RyaW5nCiAgLy8gICBvZiBKUyB0aGF0J3MgYW4gZXhwciB0aGF0IHlpZWxkcyBhIGZ1bmN0aW9uLCBhbmQgImRhdGEiIHNob3VsZCBiZQogIC8vICAgYW4gb2JqZWN0IHRoYXQgd2lsbCBiZSBhZGRlZCBhcyBhbiBhZGRpdGlvbmFsIGFyZ3VtZW50IHdoZW4gdGhhdAogIC8vICAgZnVuY3Rpb24gaXMgY2FsbGVkLgogIC8vIEBwYXJhbSB0YXJnZXQgVGhlIG9iamVjdCB0aGF0IHdpbGwgYmUgInRoaXMiIGZvciBlYWNoIGZ1bmN0aW9uCiAgLy8gICBleGVjdXRpb24uCiAgLy8gQHBhcmFtIGFyZ3MgQXJyYXkgb2YgYXJndW1lbnRzIHRvIGJlIHBhc3NlZCB0byB0aGUgZnVuY3Rpb25zLiAoVGhlCiAgLy8gICBzYW1lIGFyZ3VtZW50cyB3aWxsIGJlIHBhc3NlZCB0byBhbGwgZnVuY3Rpb25zLikKICBmdW5jdGlvbiBldmFsQW5kUnVuKHRhc2tzLCB0YXJnZXQsIGFyZ3MpIHsKICAgIGlmICh0YXNrcykgewogICAgICBmb3JFYWNoKHRhc2tzLCBmdW5jdGlvbih0YXNrKSB7CiAgICAgICAgdmFyIHRoZXNlQXJncyA9IGFyZ3M7CiAgICAgICAgaWYgKHR5cGVvZih0YXNrKSA9PT0gIm9iamVjdCIpIHsKICAgICAgICAgIHRoZXNlQXJncyA9IHRoZXNlQXJncy5jb25jYXQoW3Rhc2suZGF0YV0pOwogICAgICAgICAgdGFzayA9IHRhc2suY29kZTsKICAgICAgICB9CiAgICAgICAgdmFyIHRhc2tGdW5jID0gdHJ5RXZhbCh0YXNrKTsKICAgICAgICBpZiAodHlwZW9mKHRhc2tGdW5jKSAhPT0gImZ1bmN0aW9uIikgewogICAgICAgICAgdGhyb3cgbmV3IEVycm9yKCJUYXNrIG11c3QgYmUgYSBmdW5jdGlvbiEgU291cmNlOlxuIiArIHRhc2spOwogICAgICAgIH0KICAgICAgICB0YXNrRnVuYy5hcHBseSh0YXJnZXQsIHRoZXNlQXJncyk7CiAgICAgIH0pOwogICAgfQogIH0KCiAgLy8gQXR0ZW1wdCBldmFsKCkgYm90aCB3aXRoIGFuZCB3aXRob3V0IGVuY2xvc2luZyBpbiBwYXJlbnRoZXNlcy4KICAvLyBOb3RlIHRoYXQgZW5jbG9zaW5nIGNvZXJjZXMgYSBmdW5jdGlvbiBkZWNsYXJhdGlvbiBpbnRvCiAgLy8gYW4gZXhwcmVzc2lvbiB0aGF0IGV2YWwoKSBjYW4gcGFyc2UKICAvLyAob3RoZXJ3aXNlLCBhIFN5bnRheEVycm9yIGlzIHRocm93bikKICBmdW5jdGlvbiB0cnlFdmFsKGNvZGUpIHsKICAgIHZhciByZXN1bHQgPSBudWxsOwogICAgdHJ5IHsKICAgICAgcmVzdWx0ID0gZXZhbCgiKCIgKyBjb2RlICsgIikiKTsKICAgIH0gY2F0Y2goZXJyb3IpIHsKICAgICAgaWYgKCEoZXJyb3IgaW5zdGFuY2VvZiBTeW50YXhFcnJvcikpIHsKICAgICAgICB0aHJvdyBlcnJvcjsKICAgICAgfQogICAgICB0cnkgewogICAgICAgIHJlc3VsdCA9IGV2YWwoY29kZSk7CiAgICAgIH0gY2F0Y2goZSkgewogICAgICAgIGlmIChlIGluc3RhbmNlb2YgU3ludGF4RXJyb3IpIHsKICAgICAgICAgIHRocm93IGVycm9yOwogICAgICAgIH0gZWxzZSB7CiAgICAgICAgICB0aHJvdyBlOwogICAgICAgIH0KICAgICAgfQogICAgfQogICAgcmV0dXJuIHJlc3VsdDsKICB9CgogIGZ1bmN0aW9uIGluaXRTaXppbmcoZWwpIHsKICAgIHZhciBzaXppbmcgPSBzaXppbmdQb2xpY3koZWwpOwogICAgaWYgKCFzaXppbmcpCiAgICAgIHJldHVybjsKCiAgICB2YXIgY2VsID0gZG9jdW1lbnQuZ2V0RWxlbWVudEJ5SWQoImh0bWx3aWRnZXRfY29udGFpbmVyIik7CiAgICBpZiAoIWNlbCkKICAgICAgcmV0dXJuOwoKICAgIGlmICh0eXBlb2Yoc2l6aW5nLnBhZGRpbmcpICE9PSAidW5kZWZpbmVkIikgewogICAgICBkb2N1bWVudC5ib2R5LnN0eWxlLm1hcmdpbiA9ICIwIjsKICAgICAgZG9jdW1lbnQuYm9keS5zdHlsZS5wYWRkaW5nID0gcGFkZGluZ1RvQ3NzKHVucGFja1BhZGRpbmcoc2l6aW5nLnBhZGRpbmcpKTsKICAgIH0KCiAgICBpZiAoc2l6aW5nLmZpbGwpIHsKICAgICAgZG9jdW1lbnQuYm9keS5zdHlsZS5vdmVyZmxvdyA9ICJoaWRkZW4iOwogICAgICBkb2N1bWVudC5ib2R5LnN0eWxlLndpZHRoID0gIjEwMCUiOwogICAgICBkb2N1bWVudC5ib2R5LnN0eWxlLmhlaWdodCA9ICIxMDAlIjsKICAgICAgZG9jdW1lbnQuZG9jdW1lbnRFbGVtZW50LnN0eWxlLndpZHRoID0gIjEwMCUiOwogICAgICBkb2N1bWVudC5kb2N1bWVudEVsZW1lbnQuc3R5bGUuaGVpZ2h0ID0gIjEwMCUiOwogICAgICBjZWwuc3R5bGUucG9zaXRpb24gPSAiYWJzb2x1dGUiOwogICAgICB2YXIgcGFkID0gdW5wYWNrUGFkZGluZyhzaXppbmcucGFkZGluZyk7CiAgICAgIGNlbC5zdHlsZS50b3AgPSBwYWQudG9wICsgInB4IjsKICAgICAgY2VsLnN0eWxlLnJpZ2h0ID0gcGFkLnJpZ2h0ICsgInB4IjsKICAgICAgY2VsLnN0eWxlLmJvdHRvbSA9IHBhZC5ib3R0b20gKyAicHgiOwogICAgICBjZWwuc3R5bGUubGVmdCA9IHBhZC5sZWZ0ICsgInB4IjsKICAgICAgZWwuc3R5bGUud2lkdGggPSAiMTAwJSI7CiAgICAgIGVsLnN0eWxlLmhlaWdodCA9ICIxMDAlIjsKCiAgICAgIHJldHVybiB7CiAgICAgICAgZ2V0V2lkdGg6IGZ1bmN0aW9uKCkgeyByZXR1cm4gY2VsLmdldEJvdW5kaW5nQ2xpZW50UmVjdCgpLndpZHRoOyB9LAogICAgICAgIGdldEhlaWdodDogZnVuY3Rpb24oKSB7IHJldHVybiBjZWwuZ2V0Qm91bmRpbmdDbGllbnRSZWN0KCkuaGVpZ2h0OyB9CiAgICAgIH07CgogICAgfSBlbHNlIHsKICAgICAgZWwuc3R5bGUud2lkdGggPSBweChzaXppbmcud2lkdGgpOwogICAgICBlbC5zdHlsZS5oZWlnaHQgPSBweChzaXppbmcuaGVpZ2h0KTsKCiAgICAgIHJldHVybiB7CiAgICAgICAgZ2V0V2lkdGg6IGZ1bmN0aW9uKCkgeyByZXR1cm4gY2VsLmdldEJvdW5kaW5nQ2xpZW50UmVjdCgpLndpZHRoOyB9LAogICAgICAgIGdldEhlaWdodDogZnVuY3Rpb24oKSB7IHJldHVybiBjZWwuZ2V0Qm91bmRpbmdDbGllbnRSZWN0KCkuaGVpZ2h0OyB9CiAgICAgIH07CiAgICB9CiAgfQoKICAvLyBEZWZhdWx0IGltcGxlbWVudGF0aW9ucyBmb3IgbWV0aG9kcwogIHZhciBkZWZhdWx0cyA9IHsKICAgIGZpbmQ6IGZ1bmN0aW9uKHNjb3BlKSB7CiAgICAgIHJldHVybiBxdWVyeVNlbGVjdG9yQWxsKHNjb3BlLCAiLiIgKyB0aGlzLm5hbWUpOwogICAgfSwKICAgIHJlbmRlckVycm9yOiBmdW5jdGlvbihlbCwgZXJyKSB7CiAgICAgIHZhciAkZWwgPSAkKGVsKTsKCiAgICAgIHRoaXMuY2xlYXJFcnJvcihlbCk7CgogICAgICAvLyBBZGQgYWxsIHRoZXNlIGVycm9yIGNsYXNzZXMsIGFzIFNoaW55IGRvZXMKICAgICAgdmFyIGVyckNsYXNzID0gInNoaW55LW91dHB1dC1lcnJvciI7CiAgICAgIGlmIChlcnIudHlwZSAhPT0gbnVsbCkgewogICAgICAgIC8vIHVzZSB0aGUgY2xhc3NlcyBvZiB0aGUgZXJyb3IgY29uZGl0aW9uIGFzIENTUyBjbGFzcyBuYW1lcwogICAgICAgIGVyckNsYXNzID0gZXJyQ2xhc3MgKyAiICIgKyAkLm1hcChhc0FycmF5KGVyci50eXBlKSwgZnVuY3Rpb24odHlwZSkgewogICAgICAgICAgcmV0dXJuIGVyckNsYXNzICsgIi0iICsgdHlwZTsKICAgICAgICB9KS5qb2luKCIgIik7CiAgICAgIH0KICAgICAgZXJyQ2xhc3MgPSBlcnJDbGFzcyArICIgaHRtbHdpZGdldHMtZXJyb3IiOwoKICAgICAgLy8gSXMgZWwgaW5saW5lIG9yIGJsb2NrPyBJZiBpbmxpbmUgb3IgaW5saW5lLWJsb2NrLCBqdXN0IGRpc3BsYXk6bm9uZSBpdAogICAgICAvLyBhbmQgYWRkIGFuIGlubGluZSBlcnJvci4KICAgICAgdmFyIGRpc3BsYXkgPSAkZWwuY3NzKCJkaXNwbGF5Iik7CiAgICAgICRlbC5kYXRhKCJyZXN0b3JlLWRpc3BsYXktbW9kZSIsIGRpc3BsYXkpOwoKICAgICAgaWYgKGRpc3BsYXkgPT09ICJpbmxpbmUiIHx8IGRpc3BsYXkgPT09ICJpbmxpbmUtYmxvY2siKSB7CiAgICAgICAgJGVsLmhpZGUoKTsKICAgICAgICBpZiAoZXJyLm1lc3NhZ2UgIT09ICIiKSB7CiAgICAgICAgICB2YXIgZXJyb3JTcGFuID0gJCgiPHNwYW4+IikuYWRkQ2xhc3MoZXJyQ2xhc3MpOwogICAgICAgICAgZXJyb3JTcGFuLnRleHQoZXJyLm1lc3NhZ2UpOwogICAgICAgICAgJGVsLmFmdGVyKGVycm9yU3Bhbik7CiAgICAgICAgfQogICAgICB9IGVsc2UgaWYgKGRpc3BsYXkgPT09ICJibG9jayIpIHsKICAgICAgICAvLyBJZiBibG9jaywgYWRkIGFuIGVycm9yIGp1c3QgYWZ0ZXIgdGhlIGVsLCBzZXQgdmlzaWJpbGl0eTpub25lIG9uIHRoZQogICAgICAgIC8vIGVsLCBhbmQgcG9zaXRpb24gdGhlIGVycm9yIHRvIGJlIG9uIHRvcCBvZiB0aGUgZWwuCiAgICAgICAgLy8gTWFyayBpdCB3aXRoIGEgdW5pcXVlIElEIGFuZCBDU1MgY2xhc3Mgc28gd2UgY2FuIHJlbW92ZSBpdCBsYXRlci4KICAgICAgICAkZWwuY3NzKCJ2aXNpYmlsaXR5IiwgImhpZGRlbiIpOwogICAgICAgIGlmIChlcnIubWVzc2FnZSAhPT0gIiIpIHsKICAgICAgICAgIHZhciBlcnJvckRpdiA9ICQoIjxkaXY+IikuYWRkQ2xhc3MoZXJyQ2xhc3MpLmNzcygicG9zaXRpb24iLCAiYWJzb2x1dGUiKQogICAgICAgICAgICAuY3NzKCJ0b3AiLCBlbC5vZmZzZXRUb3ApCiAgICAgICAgICAgIC5jc3MoImxlZnQiLCBlbC5vZmZzZXRMZWZ0KQogICAgICAgICAgICAvLyBzZXR0aW5nIHdpZHRoIGNhbiBwdXNoIG91dCB0aGUgcGFnZSBzaXplLCBmb3JjaW5nIG90aGVyd2lzZQogICAgICAgICAgICAvLyB1bm5lY2Vzc2FyeSBzY3JvbGxiYXJzIHRvIGFwcGVhciBhbmQgbWFraW5nIGl0IGltcG9zc2libGUgZm9yCiAgICAgICAgICAgIC8vIHRoZSBlbGVtZW50IHRvIHNocmluazsgc28gdXNlIG1heC13aWR0aCBpbnN0ZWFkCiAgICAgICAgICAgIC5jc3MoIm1heFdpZHRoIiwgZWwub2Zmc2V0V2lkdGgpCiAgICAgICAgICAgIC5jc3MoImhlaWdodCIsIGVsLm9mZnNldEhlaWdodCk7CiAgICAgICAgICBlcnJvckRpdi50ZXh0KGVyci5tZXNzYWdlKTsKICAgICAgICAgICRlbC5hZnRlcihlcnJvckRpdik7CgogICAgICAgICAgLy8gUmVhbGx5IGR1bWIgd2F5IHRvIGtlZXAgdGhlIHNpemUvcG9zaXRpb24gb2YgdGhlIGVycm9yIGluIHN5bmMgd2l0aAogICAgICAgICAgLy8gdGhlIHBhcmVudCBlbGVtZW50IGFzIHRoZSB3aW5kb3cgaXMgcmVzaXplZCBvciB3aGF0ZXZlci4KICAgICAgICAgIHZhciBpbnRJZCA9IHNldEludGVydmFsKGZ1bmN0aW9uKCkgewogICAgICAgICAgICBpZiAoIWVycm9yRGl2WzBdLnBhcmVudEVsZW1lbnQpIHsKICAgICAgICAgICAgICBjbGVhckludGVydmFsKGludElkKTsKICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgICAgIH0KICAgICAgICAgICAgZXJyb3JEaXYKICAgICAgICAgICAgICAuY3NzKCJ0b3AiLCBlbC5vZmZzZXRUb3ApCiAgICAgICAgICAgICAgLmNzcygibGVmdCIsIGVsLm9mZnNldExlZnQpCiAgICAgICAgICAgICAgLmNzcygibWF4V2lkdGgiLCBlbC5vZmZzZXRXaWR0aCkKICAgICAgICAgICAgICAuY3NzKCJoZWlnaHQiLCBlbC5vZmZzZXRIZWlnaHQpOwogICAgICAgICAgfSwgNTAwKTsKICAgICAgICB9CiAgICAgIH0KICAgIH0sCiAgICBjbGVhckVycm9yOiBmdW5jdGlvbihlbCkgewogICAgICB2YXIgJGVsID0gJChlbCk7CiAgICAgIHZhciBkaXNwbGF5ID0gJGVsLmRhdGEoInJlc3RvcmUtZGlzcGxheS1tb2RlIik7CiAgICAgICRlbC5kYXRhKCJyZXN0b3JlLWRpc3BsYXktbW9kZSIsIG51bGwpOwoKICAgICAgaWYgKGRpc3BsYXkgPT09ICJpbmxpbmUiIHx8IGRpc3BsYXkgPT09ICJpbmxpbmUtYmxvY2siKSB7CiAgICAgICAgaWYgKGRpc3BsYXkpCiAgICAgICAgICAkZWwuY3NzKCJkaXNwbGF5IiwgZGlzcGxheSk7CiAgICAgICAgJChlbC5uZXh0U2libGluZykuZmlsdGVyKCIuaHRtbHdpZGdldHMtZXJyb3IiKS5yZW1vdmUoKTsKICAgICAgfSBlbHNlIGlmIChkaXNwbGF5ID09PSAiYmxvY2siKXsKICAgICAgICAkZWwuY3NzKCJ2aXNpYmlsaXR5IiwgImluaGVyaXQiKTsKICAgICAgICAkKGVsLm5leHRTaWJsaW5nKS5maWx0ZXIoIi5odG1sd2lkZ2V0cy1lcnJvciIpLnJlbW92ZSgpOwogICAgICB9CiAgICB9LAogICAgc2l6aW5nOiB7fQogIH07CgogIC8vIENhbGxlZCBieSB3aWRnZXQgYmluZGluZ3MgdG8gcmVnaXN0ZXIgYSBuZXcgdHlwZSBvZiB3aWRnZXQuIFRoZSBkZWZpbml0aW9uCiAgLy8gb2JqZWN0IGNhbiBjb250YWluIHRoZSBmb2xsb3dpbmcgcHJvcGVydGllczoKICAvLyAtIG5hbWUgKHJlcXVpcmVkKSAtIEEgc3RyaW5nIGluZGljYXRpbmcgdGhlIGJpbmRpbmcgbmFtZSwgd2hpY2ggd2lsbCBiZQogIC8vICAgdXNlZCBieSBkZWZhdWx0IGFzIHRoZSBDU1MgY2xhc3NuYW1lIHRvIGxvb2sgZm9yLgogIC8vIC0gaW5pdGlhbGl6ZSAob3B0aW9uYWwpIC0gQSBmdW5jdGlvbihlbCkgdGhhdCB3aWxsIGJlIGNhbGxlZCBvbmNlIHBlcgogIC8vICAgd2lkZ2V0IGVsZW1lbnQ7IGlmIGEgdmFsdWUgaXMgcmV0dXJuZWQsIGl0IHdpbGwgYmUgcGFzc2VkIGFzIHRoZSB0aGlyZAogIC8vICAgdmFsdWUgdG8gcmVuZGVyVmFsdWUuCiAgLy8gLSByZW5kZXJWYWx1ZSAocmVxdWlyZWQpIC0gQSBmdW5jdGlvbihlbCwgZGF0YSwgaW5pdFZhbHVlKSB0aGF0IHdpbGwgYmUKICAvLyAgIGNhbGxlZCB3aXRoIGRhdGEuIFN0YXRpYyBjb250ZXh0cyB3aWxsIGNhdXNlIHRoaXMgdG8gYmUgY2FsbGVkIG9uY2UgcGVyCiAgLy8gICBlbGVtZW50OyBTaGlueSBhcHBzIHdpbGwgY2F1c2UgdGhpcyB0byBiZSBjYWxsZWQgbXVsdGlwbGUgdGltZXMgcGVyCiAgLy8gICBlbGVtZW50LCBhcyB0aGUgZGF0YSBjaGFuZ2VzLgogIHdpbmRvdy5IVE1MV2lkZ2V0cy53aWRnZXQgPSBmdW5jdGlvbihkZWZpbml0aW9uKSB7CiAgICBpZiAoIWRlZmluaXRpb24ubmFtZSkgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIldpZGdldCBtdXN0IGhhdmUgYSBuYW1lIik7CiAgICB9CiAgICBpZiAoIWRlZmluaXRpb24udHlwZSkgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIldpZGdldCBtdXN0IGhhdmUgYSB0eXBlIik7CiAgICB9CiAgICAvLyBDdXJyZW50bHkgd2Ugb25seSBzdXBwb3J0IG91dHB1dCB3aWRnZXRzCiAgICBpZiAoZGVmaW5pdGlvbi50eXBlICE9PSAib3V0cHV0IikgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIlVucmVjb2duaXplZCB3aWRnZXQgdHlwZSAnIiArIGRlZmluaXRpb24udHlwZSArICInIik7CiAgICB9CiAgICAvLyBUT0RPOiBWZXJpZnkgdGhhdCAubmFtZSBpcyBhIHZhbGlkIENTUyBjbGFzc25hbWUKCiAgICAvLyBTdXBwb3J0IG5ldy1zdHlsZSBpbnN0YW5jZS1ib3VuZCBkZWZpbml0aW9ucy4gT2xkLXN0eWxlIGNsYXNzLWJvdW5kCiAgICAvLyBkZWZpbml0aW9ucyBoYXZlIG9uZSB3aWRnZXQgIm9iamVjdCIgcGVyIHdpZGdldCBwZXIgdHlwZS9jbGFzcyBvZgogICAgLy8gd2lkZ2V0OyB0aGUgcmVuZGVyVmFsdWUgYW5kIHJlc2l6ZSBtZXRob2RzIG9uIHN1Y2ggd2lkZ2V0IG9iamVjdHMKICAgIC8vIHRha2UgZWwgYW5kIGluc3RhbmNlIGFyZ3VtZW50cywgYmVjYXVzZSB0aGUgd2lkZ2V0IG9iamVjdCBjYW4ndAogICAgLy8gc3RvcmUgdGhlbS4gTmV3LXN0eWxlIGluc3RhbmNlLWJvdW5kIGRlZmluaXRpb25zIGhhdmUgb25lIHdpZGdldAogICAgLy8gb2JqZWN0IHBlciB3aWRnZXQgaW5zdGFuY2U7IHRoZSBkZWZpbml0aW9uIHRoYXQncyBwYXNzZWQgaW4gZG9lc24ndAogICAgLy8gcHJvdmlkZSByZW5kZXJWYWx1ZSBvciByZXNpemUgbWV0aG9kcyBhdCBhbGwsIGp1c3QgdGhlIHNpbmdsZSBtZXRob2QKICAgIC8vICAgZmFjdG9yeShlbCwgd2lkdGgsIGhlaWdodCkKICAgIC8vIHdoaWNoIHJldHVybnMgYW4gb2JqZWN0IHRoYXQgaGFzIHJlbmRlclZhbHVlKHgpIGFuZCByZXNpemUodywgaCkuCiAgICAvLyBUaGlzIGVuYWJsZXMgYSBmYXIgbW9yZSBuYXR1cmFsIHByb2dyYW1taW5nIHN0eWxlIGZvciB0aGUgd2lkZ2V0CiAgICAvLyBhdXRob3IsIHdobyBjYW4gc3RvcmUgcGVyLWluc3RhbmNlIHN0YXRlIHVzaW5nIGVpdGhlciBPTy1zdHlsZQogICAgLy8gaW5zdGFuY2UgZmllbGRzIG9yIGZ1bmN0aW9uYWwtc3R5bGUgY2xvc3VyZSB2YXJpYWJsZXMgKEkgZ3Vlc3MgdGhpcwogICAgLy8gaXMgaW4gY29udHJhc3QgdG8gd2hhdCBjYW4gb25seSBiZSBjYWxsZWQgQy1zdHlsZSBwc2V1ZG8tT08gd2hpY2ggaXMKICAgIC8vIHdoYXQgd2UgcmVxdWlyZWQgYmVmb3JlKS4KICAgIGlmIChkZWZpbml0aW9uLmZhY3RvcnkpIHsKICAgICAgZGVmaW5pdGlvbiA9IGNyZWF0ZUxlZ2FjeURlZmluaXRpb25BZGFwdGVyKGRlZmluaXRpb24pOwogICAgfQoKICAgIGlmICghZGVmaW5pdGlvbi5yZW5kZXJWYWx1ZSkgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIldpZGdldCBtdXN0IGhhdmUgYSByZW5kZXJWYWx1ZSBmdW5jdGlvbiIpOwogICAgfQoKICAgIC8vIEZvciBzdGF0aWMgcmVuZGVyaW5nIChub24tU2hpbnkpLCB1c2UgYSBzaW1wbGUgd2lkZ2V0IHJlZ2lzdHJhdGlvbgogICAgLy8gc2NoZW1lLiBXZSBhbHNvIHVzZSB0aGlzIHNjaGVtZSBmb3IgU2hpbnkgYXBwcy9kb2N1bWVudHMgdGhhdCBhbHNvCiAgICAvLyBjb250YWluIHN0YXRpYyB3aWRnZXRzLgogICAgd2luZG93LkhUTUxXaWRnZXRzLndpZGdldHMgPSB3aW5kb3cuSFRNTFdpZGdldHMud2lkZ2V0cyB8fCBbXTsKICAgIC8vIE1lcmdlIGRlZmF1bHRzIGludG8gdGhlIGRlZmluaXRpb247IGRvbid0IG11dGF0ZSB0aGUgb3JpZ2luYWwgZGVmaW5pdGlvbi4KICAgIHZhciBzdGF0aWNCaW5kaW5nID0gZXh0ZW5kKHt9LCBkZWZhdWx0cywgZGVmaW5pdGlvbik7CiAgICBvdmVycmlkZU1ldGhvZChzdGF0aWNCaW5kaW5nLCAiZmluZCIsIGZ1bmN0aW9uKHN1cGVyZnVuYykgewogICAgICByZXR1cm4gZnVuY3Rpb24oc2NvcGUpIHsKICAgICAgICB2YXIgcmVzdWx0cyA9IHN1cGVyZnVuYyhzY29wZSk7CiAgICAgICAgLy8gRmlsdGVyIG91dCBTaGlueSBvdXRwdXRzLCB3ZSBvbmx5IHdhbnQgdGhlIHN0YXRpYyBraW5kCiAgICAgICAgcmV0dXJuIGZpbHRlckJ5Q2xhc3MocmVzdWx0cywgImh0bWwtd2lkZ2V0LW91dHB1dCIsIGZhbHNlKTsKICAgICAgfTsKICAgIH0pOwogICAgd2luZG93LkhUTUxXaWRnZXRzLndpZGdldHMucHVzaChzdGF0aWNCaW5kaW5nKTsKCiAgICBpZiAoc2hpbnlNb2RlKSB7CiAgICAgIC8vIFNoaW55IGlzIHJ1bm5pbmcuIFJlZ2lzdGVyIHRoZSBkZWZpbml0aW9uIHdpdGggYW4gb3V0cHV0IGJpbmRpbmcuCiAgICAgIC8vIFRoZSBkZWZpbml0aW9uIGl0c2VsZiB3aWxsIG5vdCBiZSB0aGUgb3V0cHV0IGJpbmRpbmcsIGluc3RlYWQKICAgICAgLy8gd2Ugd2lsbCBtYWtlIGFuIG91dHB1dCBiaW5kaW5nIG9iamVjdCB0aGF0IGRlbGVnYXRlcyB0byB0aGUKICAgICAgLy8gZGVmaW5pdGlvbi4gVGhpcyBpcyBiZWNhdXNlIHdlIGZvb2xpc2hseSB1c2VkIHRoZSBzYW1lIG1ldGhvZAogICAgICAvLyBuYW1lIChyZW5kZXJWYWx1ZSkgZm9yIGh0bWx3aWRnZXRzIGRlZmluaXRpb24gYW5kIFNoaW55IGJpbmRpbmdzCiAgICAgIC8vIGJ1dCB0aGV5IGFjdHVhbGx5IGhhdmUgcXVpdGUgZGlmZmVyZW50IHNlbWFudGljcyAodGhlIFNoaW55CiAgICAgIC8vIGJpbmRpbmdzIHJlY2VpdmUgZGF0YSB0aGF0IGluY2x1ZGVzIGxvdHMgb2YgbWV0YWRhdGEgdGhhdCBpdAogICAgICAvLyBzdHJpcHMgb2ZmIGJlZm9yZSBjYWxsaW5nIGh0bWx3aWRnZXRzIHJlbmRlclZhbHVlKS4gV2UgY2FuJ3QKICAgICAgLy8ganVzdCBpZ25vcmUgdGhlIGRpZmZlcmVuY2UgYmVjYXVzZSBpbiBzb21lIHdpZGdldHMgaXQncyBoZWxwZnVsCiAgICAgIC8vIHRvIGNhbGwgdGhpcy5yZW5kZXJWYWx1ZSgpIGZyb20gaW5zaWRlIG9mIHJlc2l6ZSgpLCBhbmQgaWYKICAgICAgLy8gd2UncmUgbm90IGRlbGVnYXRpbmcsIHRoZW4gdGhhdCBjYWxsIHdpbGwgZ28gdG8gdGhlIFNoaW55CiAgICAgIC8vIHZlcnNpb24gaW5zdGVhZCBvZiB0aGUgaHRtbHdpZGdldHMgdmVyc2lvbi4KCiAgICAgIC8vIE1lcmdlIGRlZmF1bHRzIHdpdGggZGVmaW5pdGlvbiwgd2l0aG91dCBtdXRhdGluZyBlaXRoZXIuCiAgICAgIHZhciBiaW5kaW5nRGVmID0gZXh0ZW5kKHt9LCBkZWZhdWx0cywgZGVmaW5pdGlvbik7CgogICAgICAvLyBUaGlzIG9iamVjdCB3aWxsIGJlIG91ciBhY3R1YWwgU2hpbnkgYmluZGluZy4KICAgICAgdmFyIHNoaW55QmluZGluZyA9IG5ldyBTaGlueS5PdXRwdXRCaW5kaW5nKCk7CgogICAgICAvLyBXaXRoIGEgZmV3IGV4Y2VwdGlvbnMsIHdlJ2xsIHdhbnQgdG8gc2ltcGx5IHVzZSB0aGUgYmluZGluZ0RlZidzCiAgICAgIC8vIHZlcnNpb24gb2YgbWV0aG9kcyBpZiB0aGV5IGFyZSBhdmFpbGFibGUsIG90aGVyd2lzZSBmYWxsIGJhY2sgdG8KICAgICAgLy8gU2hpbnkncyBkZWZhdWx0cy4gTk9URTogSWYgU2hpbnkncyBvdXRwdXQgYmluZGluZ3MgZ2FpbiBhZGRpdGlvbmFsCiAgICAgIC8vIG1ldGhvZHMgaW4gdGhlIGZ1dHVyZSwgYW5kIHdlIHdhbnQgdGhlbSB0byBiZSBvdmVycmlkZWFibGUgYnkKICAgICAgLy8gSFRNTFdpZGdldCBiaW5kaW5nIGRlZmluaXRpb25zLCB0aGVuIHdlJ2xsIG5lZWQgdG8gYWRkIHRoZW0gdG8gdGhpcwogICAgICAvLyBsaXN0LgogICAgICBkZWxlZ2F0ZU1ldGhvZChzaGlueUJpbmRpbmcsIGJpbmRpbmdEZWYsICJnZXRJZCIpOwogICAgICBkZWxlZ2F0ZU1ldGhvZChzaGlueUJpbmRpbmcsIGJpbmRpbmdEZWYsICJvblZhbHVlQ2hhbmdlIik7CiAgICAgIGRlbGVnYXRlTWV0aG9kKHNoaW55QmluZGluZywgYmluZGluZ0RlZiwgIm9uVmFsdWVFcnJvciIpOwogICAgICBkZWxlZ2F0ZU1ldGhvZChzaGlueUJpbmRpbmcsIGJpbmRpbmdEZWYsICJyZW5kZXJFcnJvciIpOwogICAgICBkZWxlZ2F0ZU1ldGhvZChzaGlueUJpbmRpbmcsIGJpbmRpbmdEZWYsICJjbGVhckVycm9yIik7CiAgICAgIGRlbGVnYXRlTWV0aG9kKHNoaW55QmluZGluZywgYmluZGluZ0RlZiwgInNob3dQcm9ncmVzcyIpOwoKICAgICAgLy8gVGhlIGZpbmQsIHJlbmRlclZhbHVlLCBhbmQgcmVzaXplIGFyZSBoYW5kbGVkIGRpZmZlcmVudGx5LCBiZWNhdXNlIHdlCiAgICAgIC8vIHdhbnQgdG8gYWN0dWFsbHkgZGVjb3JhdGUgdGhlIGJlaGF2aW9yIG9mIHRoZSBiaW5kaW5nRGVmIG1ldGhvZHMuCgogICAgICBzaGlueUJpbmRpbmcuZmluZCA9IGZ1bmN0aW9uKHNjb3BlKSB7CiAgICAgICAgdmFyIHJlc3VsdHMgPSBiaW5kaW5nRGVmLmZpbmQoc2NvcGUpOwoKICAgICAgICAvLyBPbmx5IHJldHVybiBlbGVtZW50cyB0aGF0IGFyZSBTaGlueSBvdXRwdXRzLCBub3Qgc3RhdGljIG9uZXMKICAgICAgICB2YXIgZHluYW1pY1Jlc3VsdHMgPSByZXN1bHRzLmZpbHRlcigiLmh0bWwtd2lkZ2V0LW91dHB1dCIpOwoKICAgICAgICAvLyBJdCdzIHBvc3NpYmxlIHRoYXQgd2hhdGV2ZXIgY2F1c2VkIFNoaW55IHRvIHRoaW5rIHRoZXJlIG1pZ2h0IGJlCiAgICAgICAgLy8gbmV3IGR5bmFtaWMgb3V0cHV0cywgYWxzbyBjYXVzZWQgdGhlcmUgdG8gYmUgbmV3IHN0YXRpYyBvdXRwdXRzLgogICAgICAgIC8vIFNpbmNlIHRoZXJlIG1pZ2h0IGJlIGxvdHMgb2YgZGlmZmVyZW50IGh0bWx3aWRnZXRzIGJpbmRpbmdzLCB3ZQogICAgICAgIC8vIHNjaGVkdWxlIGV4ZWN1dGlvbiBmb3IgbGF0ZXItLW5vIG5lZWQgdG8gc3RhdGljUmVuZGVyIG11bHRpcGxlCiAgICAgICAgLy8gdGltZXMuCiAgICAgICAgaWYgKHJlc3VsdHMubGVuZ3RoICE9PSBkeW5hbWljUmVzdWx0cy5sZW5ndGgpCiAgICAgICAgICBzY2hlZHVsZVN0YXRpY1JlbmRlcigpOwoKICAgICAgICByZXR1cm4gZHluYW1pY1Jlc3VsdHM7CiAgICAgIH07CgogICAgICAvLyBXcmFwIHJlbmRlclZhbHVlIHRvIGhhbmRsZSBpbml0aWFsaXphdGlvbiwgd2hpY2ggdW5mb3J0dW5hdGVseSBpc24ndAogICAgICAvLyBzdXBwb3J0ZWQgbmF0aXZlbHkgYnkgU2hpbnkgYXQgdGhlIHRpbWUgb2YgdGhpcyB3cml0aW5nLgoKICAgICAgc2hpbnlCaW5kaW5nLnJlbmRlclZhbHVlID0gZnVuY3Rpb24oZWwsIGRhdGEpIHsKICAgICAgICBTaGlueS5yZW5kZXJEZXBlbmRlbmNpZXMoZGF0YS5kZXBzKTsKICAgICAgICAvLyBSZXNvbHZlIHN0cmluZ3MgbWFya2VkIGFzIGphdmFzY3JpcHQgbGl0ZXJhbHMgdG8gb2JqZWN0cwogICAgICAgIGlmICghKGRhdGEuZXZhbHMgaW5zdGFuY2VvZiBBcnJheSkpIGRhdGEuZXZhbHMgPSBbZGF0YS5ldmFsc107CiAgICAgICAgZm9yICh2YXIgaSA9IDA7IGRhdGEuZXZhbHMgJiYgaSA8IGRhdGEuZXZhbHMubGVuZ3RoOyBpKyspIHsKICAgICAgICAgIHdpbmRvdy5IVE1MV2lkZ2V0cy5ldmFsdWF0ZVN0cmluZ01lbWJlcihkYXRhLngsIGRhdGEuZXZhbHNbaV0pOwogICAgICAgIH0KICAgICAgICBpZiAoIWJpbmRpbmdEZWYucmVuZGVyT25OdWxsVmFsdWUpIHsKICAgICAgICAgIGlmIChkYXRhLnggPT09IG51bGwpIHsKICAgICAgICAgICAgZWwuc3R5bGUudmlzaWJpbGl0eSA9ICJoaWRkZW4iOwogICAgICAgICAgICByZXR1cm47CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBlbC5zdHlsZS52aXNpYmlsaXR5ID0gImluaGVyaXQiOwogICAgICAgICAgfQogICAgICAgIH0KICAgICAgICBpZiAoIWVsZW1lbnREYXRhKGVsLCAiaW5pdGlhbGl6ZWQiKSkgewogICAgICAgICAgaW5pdFNpemluZyhlbCk7CgogICAgICAgICAgZWxlbWVudERhdGEoZWwsICJpbml0aWFsaXplZCIsIHRydWUpOwogICAgICAgICAgaWYgKGJpbmRpbmdEZWYuaW5pdGlhbGl6ZSkgewogICAgICAgICAgICB2YXIgcmVjdCA9IGVsLmdldEJvdW5kaW5nQ2xpZW50UmVjdCgpOwogICAgICAgICAgICB2YXIgcmVzdWx0ID0gYmluZGluZ0RlZi5pbml0aWFsaXplKGVsLCByZWN0LndpZHRoLCByZWN0LmhlaWdodCk7CiAgICAgICAgICAgIGVsZW1lbnREYXRhKGVsLCAiaW5pdF9yZXN1bHQiLCByZXN1bHQpOwogICAgICAgICAgfQogICAgICAgIH0KICAgICAgICBiaW5kaW5nRGVmLnJlbmRlclZhbHVlKGVsLCBkYXRhLngsIGVsZW1lbnREYXRhKGVsLCAiaW5pdF9yZXN1bHQiKSk7CiAgICAgICAgZXZhbEFuZFJ1bihkYXRhLmpzSG9va3MucmVuZGVyLCBlbGVtZW50RGF0YShlbCwgImluaXRfcmVzdWx0IiksIFtlbCwgZGF0YS54XSk7CiAgICAgIH07CgogICAgICAvLyBPbmx5IG92ZXJyaWRlIHJlc2l6ZSBpZiBiaW5kaW5nRGVmIGltcGxlbWVudHMgaXQKICAgICAgaWYgKGJpbmRpbmdEZWYucmVzaXplKSB7CiAgICAgICAgc2hpbnlCaW5kaW5nLnJlc2l6ZSA9IGZ1bmN0aW9uKGVsLCB3aWR0aCwgaGVpZ2h0KSB7CiAgICAgICAgICAvLyBTaGlueSBjYW4gY2FsbCByZXNpemUgYmVmb3JlIGluaXRpYWxpemUvcmVuZGVyVmFsdWUgaGF2ZSBiZWVuCiAgICAgICAgICAvLyBjYWxsZWQsIHdoaWNoIGRvZXNuJ3QgbWFrZSBzZW5zZSBmb3Igd2lkZ2V0cy4KICAgICAgICAgIGlmIChlbGVtZW50RGF0YShlbCwgImluaXRpYWxpemVkIikpIHsKICAgICAgICAgICAgYmluZGluZ0RlZi5yZXNpemUoZWwsIHdpZHRoLCBoZWlnaHQsIGVsZW1lbnREYXRhKGVsLCAiaW5pdF9yZXN1bHQiKSk7CiAgICAgICAgICB9CiAgICAgICAgfTsKICAgICAgfQoKICAgICAgU2hpbnkub3V0cHV0QmluZGluZ3MucmVnaXN0ZXIoc2hpbnlCaW5kaW5nLCBiaW5kaW5nRGVmLm5hbWUpOwogICAgfQogIH07CgogIHZhciBzY2hlZHVsZVN0YXRpY1JlbmRlclRpbWVySWQgPSBudWxsOwogIGZ1bmN0aW9uIHNjaGVkdWxlU3RhdGljUmVuZGVyKCkgewogICAgaWYgKCFzY2hlZHVsZVN0YXRpY1JlbmRlclRpbWVySWQpIHsKICAgICAgc2NoZWR1bGVTdGF0aWNSZW5kZXJUaW1lcklkID0gc2V0VGltZW91dChmdW5jdGlvbigpIHsKICAgICAgICBzY2hlZHVsZVN0YXRpY1JlbmRlclRpbWVySWQgPSBudWxsOwogICAgICAgIHdpbmRvdy5IVE1MV2lkZ2V0cy5zdGF0aWNSZW5kZXIoKTsKICAgICAgfSwgMSk7CiAgICB9CiAgfQoKICAvLyBSZW5kZXIgc3RhdGljIHdpZGdldHMgYWZ0ZXIgdGhlIGRvY3VtZW50IGZpbmlzaGVzIGxvYWRpbmcKICAvLyBTdGF0aWNhbGx5IHJlbmRlciBhbGwgZWxlbWVudHMgdGhhdCBhcmUgb2YgdGhpcyB3aWRnZXQncyBjbGFzcwogIHdpbmRvdy5IVE1MV2lkZ2V0cy5zdGF0aWNSZW5kZXIgPSBmdW5jdGlvbigpIHsKICAgIHZhciBiaW5kaW5ncyA9IHdpbmRvdy5IVE1MV2lkZ2V0cy53aWRnZXRzIHx8IFtdOwogICAgZm9yRWFjaChiaW5kaW5ncywgZnVuY3Rpb24oYmluZGluZykgewogICAgICB2YXIgbWF0Y2hlcyA9IGJpbmRpbmcuZmluZChkb2N1bWVudC5kb2N1bWVudEVsZW1lbnQpOwogICAgICBmb3JFYWNoKG1hdGNoZXMsIGZ1bmN0aW9uKGVsKSB7CiAgICAgICAgdmFyIHNpemVPYmogPSBpbml0U2l6aW5nKGVsLCBiaW5kaW5nKTsKCiAgICAgICAgdmFyIGdldFNpemUgPSBmdW5jdGlvbihlbCkgewogICAgICAgICAgaWYgKHNpemVPYmopIHsKICAgICAgICAgICAgcmV0dXJuIHt3OiBzaXplT2JqLmdldFdpZHRoKCksIGg6IHNpemVPYmouZ2V0SGVpZ2h0KCl9CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICB2YXIgcmVjdCA9IGVsLmdldEJvdW5kaW5nQ2xpZW50UmVjdCgpOwogICAgICAgICAgICByZXR1cm4ge3c6IHJlY3Qud2lkdGgsIGg6IHJlY3QuaGVpZ2h0fQogICAgICAgICAgfQogICAgICAgIH07CgogICAgICAgIGlmIChoYXNDbGFzcyhlbCwgImh0bWwtd2lkZ2V0LXN0YXRpYy1ib3VuZCIpKQogICAgICAgICAgcmV0dXJuOwogICAgICAgIGVsLmNsYXNzTmFtZSA9IGVsLmNsYXNzTmFtZSArICIgaHRtbC13aWRnZXQtc3RhdGljLWJvdW5kIjsKCiAgICAgICAgdmFyIGluaXRSZXN1bHQ7CiAgICAgICAgaWYgKGJpbmRpbmcuaW5pdGlhbGl6ZSkgewogICAgICAgICAgdmFyIHNpemUgPSBnZXRTaXplKGVsKTsKICAgICAgICAgIGluaXRSZXN1bHQgPSBiaW5kaW5nLmluaXRpYWxpemUoZWwsIHNpemUudywgc2l6ZS5oKTsKICAgICAgICAgIGVsZW1lbnREYXRhKGVsLCAiaW5pdF9yZXN1bHQiLCBpbml0UmVzdWx0KTsKICAgICAgICB9CgogICAgICAgIGlmIChiaW5kaW5nLnJlc2l6ZSkgewogICAgICAgICAgdmFyIGxhc3RTaXplID0gZ2V0U2l6ZShlbCk7CiAgICAgICAgICB2YXIgcmVzaXplSGFuZGxlciA9IGZ1bmN0aW9uKGUpIHsKICAgICAgICAgICAgdmFyIHNpemUgPSBnZXRTaXplKGVsKTsKICAgICAgICAgICAgaWYgKHNpemUudyA9PT0gMCAmJiBzaXplLmggPT09IDApCiAgICAgICAgICAgICAgcmV0dXJuOwogICAgICAgICAgICBpZiAoc2l6ZS53ID09PSBsYXN0U2l6ZS53ICYmIHNpemUuaCA9PT0gbGFzdFNpemUuaCkKICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgICAgIGxhc3RTaXplID0gc2l6ZTsKICAgICAgICAgICAgYmluZGluZy5yZXNpemUoZWwsIHNpemUudywgc2l6ZS5oLCBpbml0UmVzdWx0KTsKICAgICAgICAgIH07CgogICAgICAgICAgb24od2luZG93LCAicmVzaXplIiwgcmVzaXplSGFuZGxlcik7CgogICAgICAgICAgLy8gVGhpcyBpcyBuZWVkZWQgZm9yIGNhc2VzIHdoZXJlIHdlJ3JlIHJ1bm5pbmcgaW4gYSBTaGlueQogICAgICAgICAgLy8gYXBwLCBidXQgdGhlIHdpZGdldCBpdHNlbGYgaXMgbm90IGEgU2hpbnkgb3V0cHV0LCBidXQKICAgICAgICAgIC8vIHJhdGhlciBhIHNpbXBsZSBzdGF0aWMgd2lkZ2V0LiBPbmUgZXhhbXBsZSBvZiB0aGlzIGlzCiAgICAgICAgICAvLyBhbiBybWFya2Rvd24gZG9jdW1lbnQgdGhhdCBoYXMgcnVudGltZTpzaGlueSBhbmQgd2lkZ2V0CiAgICAgICAgICAvLyB0aGF0IGlzbid0IGluIGEgcmVuZGVyIGZ1bmN0aW9uLiBTaGlueSBvbmx5IGtub3dzIHRvCiAgICAgICAgICAvLyBjYWxsIHJlc2l6ZSBoYW5kbGVycyBmb3IgU2hpbnkgb3V0cHV0cywgbm90IGZvciBzdGF0aWMKICAgICAgICAgIC8vIHdpZGdldHMsIHNvIHdlIGRvIGl0IG91cnNlbHZlcy4KICAgICAgICAgIGlmICh3aW5kb3cualF1ZXJ5KSB7CiAgICAgICAgICAgIHdpbmRvdy5qUXVlcnkoZG9jdW1lbnQpLm9uKAogICAgICAgICAgICAgICJzaG93bi5odG1sd2lkZ2V0cyBzaG93bi5icy50YWIuaHRtbHdpZGdldHMgc2hvd24uYnMuY29sbGFwc2UuaHRtbHdpZGdldHMiLAogICAgICAgICAgICAgIHJlc2l6ZUhhbmRsZXIKICAgICAgICAgICAgKTsKICAgICAgICAgICAgd2luZG93LmpRdWVyeShkb2N1bWVudCkub24oCiAgICAgICAgICAgICAgImhpZGRlbi5odG1sd2lkZ2V0cyBoaWRkZW4uYnMudGFiLmh0bWx3aWRnZXRzIGhpZGRlbi5icy5jb2xsYXBzZS5odG1sd2lkZ2V0cyIsCiAgICAgICAgICAgICAgcmVzaXplSGFuZGxlcgogICAgICAgICAgICApOwogICAgICAgICAgfQoKICAgICAgICAgIC8vIFRoaXMgaXMgbmVlZGVkIGZvciB0aGUgc3BlY2lmaWMgY2FzZSBvZiBpb3NsaWRlcywgd2hpY2gKICAgICAgICAgIC8vIGZsaXBzIHNsaWRlcyBiZXR3ZWVuIGRpc3BsYXk6bm9uZSBhbmQgZGlzcGxheTpibG9jay4KICAgICAgICAgIC8vIElkZWFsbHkgd2Ugd291bGQgbm90IGhhdmUgdG8gaGF2ZSBpb3NsaWRlLXNwZWNpZmljIGNvZGUKICAgICAgICAgIC8vIGhlcmUsIGJ1dCByYXRoZXIgaGF2ZSBpb3NsaWRlcyByYWlzZSBhIGdlbmVyaWMgZXZlbnQsCiAgICAgICAgICAvLyBidXQgdGhlIHJtYXJrZG93biBwYWNrYWdlIGp1c3Qgd2VudCB0byBDUkFOIHNvIHRoZQogICAgICAgICAgLy8gd2luZG93IHRvIGdldHRpbmcgdGhhdCBmaXhlZCBtYXkgYmUgbG9uZy4KICAgICAgICAgIGlmICh3aW5kb3cuYWRkRXZlbnRMaXN0ZW5lcikgewogICAgICAgICAgICAvLyBJdCdzIE9LIHRvIGxpbWl0IHRoaXMgdG8gd2luZG93LmFkZEV2ZW50TGlzdGVuZXIKICAgICAgICAgICAgLy8gYnJvd3NlcnMgYmVjYXVzZSBpb3NsaWRlcyBpdHNlbGYgb25seSBzdXBwb3J0cwogICAgICAgICAgICAvLyBzdWNoIGJyb3dzZXJzLgogICAgICAgICAgICBvbihkb2N1bWVudCwgInNsaWRlZW50ZXIiLCByZXNpemVIYW5kbGVyKTsKICAgICAgICAgICAgb24oZG9jdW1lbnQsICJzbGlkZWxlYXZlIiwgcmVzaXplSGFuZGxlcik7CiAgICAgICAgICB9CiAgICAgICAgfQoKICAgICAgICB2YXIgc2NyaXB0RGF0YSA9IGRvY3VtZW50LnF1ZXJ5U2VsZWN0b3IoInNjcmlwdFtkYXRhLWZvcj0nIiArIGVsLmlkICsgIiddW3R5cGU9J2FwcGxpY2F0aW9uL2pzb24nXSIpOwogICAgICAgIGlmIChzY3JpcHREYXRhKSB7CiAgICAgICAgICB2YXIgZGF0YSA9IEpTT04ucGFyc2Uoc2NyaXB0RGF0YS50ZXh0Q29udGVudCB8fCBzY3JpcHREYXRhLnRleHQpOwogICAgICAgICAgLy8gUmVzb2x2ZSBzdHJpbmdzIG1hcmtlZCBhcyBqYXZhc2NyaXB0IGxpdGVyYWxzIHRvIG9iamVjdHMKICAgICAgICAgIGlmICghKGRhdGEuZXZhbHMgaW5zdGFuY2VvZiBBcnJheSkpIGRhdGEuZXZhbHMgPSBbZGF0YS5ldmFsc107CiAgICAgICAgICBmb3IgKHZhciBrID0gMDsgZGF0YS5ldmFscyAmJiBrIDwgZGF0YS5ldmFscy5sZW5ndGg7IGsrKykgewogICAgICAgICAgICB3aW5kb3cuSFRNTFdpZGdldHMuZXZhbHVhdGVTdHJpbmdNZW1iZXIoZGF0YS54LCBkYXRhLmV2YWxzW2tdKTsKICAgICAgICAgIH0KICAgICAgICAgIGJpbmRpbmcucmVuZGVyVmFsdWUoZWwsIGRhdGEueCwgaW5pdFJlc3VsdCk7CiAgICAgICAgICBldmFsQW5kUnVuKGRhdGEuanNIb29rcy5yZW5kZXIsIGluaXRSZXN1bHQsIFtlbCwgZGF0YS54XSk7CiAgICAgICAgfQogICAgICB9KTsKICAgIH0pOwoKICAgIGludm9rZVBvc3RSZW5kZXJIYW5kbGVycygpOwogIH0KCgogIGZ1bmN0aW9uIGhhc19qUXVlcnkzKCkgewogICAgaWYgKCF3aW5kb3cualF1ZXJ5KSB7CiAgICAgIHJldHVybiBmYWxzZTsKICAgIH0KICAgIHZhciAkdmVyc2lvbiA9IHdpbmRvdy5qUXVlcnkuZm4uanF1ZXJ5OwogICAgdmFyICRtYWpvcl92ZXJzaW9uID0gcGFyc2VJbnQoJHZlcnNpb24uc3BsaXQoIi4iKVswXSk7CiAgICByZXR1cm4gJG1ham9yX3ZlcnNpb24gPj0gMzsKICB9CgogIC8qCiAgLyBTaGlueSAxLjQgYnVtcGVkIGpRdWVyeSBmcm9tIDEueCB0byAzLnggd2hpY2ggbWVhbnMgalF1ZXJ5J3MKICAvIG9uLXJlYWR5IGhhbmRsZXIgKGkuZS4sICQoZm4pKSBpcyBub3cgYXN5bmNyb25vdXMgKGkuZS4sIGl0IG5vdwogIC8gcmVhbGx5IG1lYW5zICQoc2V0VGltZW91dChmbikpLgogIC8gaHR0cHM6Ly9qcXVlcnkuY29tL3VwZ3JhZGUtZ3VpZGUvMy4wLyNicmVha2luZy1jaGFuZ2UtZG9jdW1lbnQtcmVhZHktaGFuZGxlcnMtYXJlLW5vdy1hc3luY2hyb25vdXMKICAvCiAgLyBTaW5jZSBTaGlueSB1c2VzICQoKSB0byBzY2hlZHVsZSBpbml0U2hpbnksIHNoaW55Pj0xLjQgY2FsbHMgaW5pdFNoaW55CiAgLyBvbmUgdGljayBsYXRlciB0aGFuIGl0IGRpZCBiZWZvcmUsIHdoaWNoIG1lYW5zIHN0YXRpY1JlbmRlcigpIGlzCiAgLyBjYWxsZWQgcmVuZGVyVmFsdWUoKSBlYXJsaWVyIHRoYW4gKGFkdmFuY2VkKSB3aWRnZXQgYXV0aG9ycyBtaWdodCBiZSBleHBlY3RpbmcuCiAgLyBodHRwczovL2dpdGh1Yi5jb20vcnN0dWRpby9zaGlueS9pc3N1ZXMvMjYzMAogIC8KICAvIEZvciBhIGNvbmNyZXRlIGV4YW1wbGUsIGxlYWZsZXQgaGFzIHNvbWUgbWV0aG9kcyAoZS5nLiwgdXBkYXRlQm91bmRzKQogIC8gd2hpY2ggcmVmZXJlbmNlIFNoaW55IG1ldGhvZHMgcmVnaXN0ZXJlZCBpbiBpbml0U2hpbnkgKGUuZy4sIHNldElucHV0VmFsdWUpLgogIC8gU2luY2UgbGVhZmxldCBpcyBwcml2eSB0byB0aGlzIGxpZmUtY3ljbGUsIGl0IGtub3dzIHRvIHVzZSBzZXRUaW1lb3V0KCkgdG8KICAvIGRlbGF5IGV4ZWN1dGlvbiBvZiB0aG9zZSBtZXRob2RzICh1bnRpbCBTaGlueSBtZXRob2RzIGFyZSByZWFkeSkKICAvIGh0dHBzOi8vZ2l0aHViLmNvbS9yc3R1ZGlvL2xlYWZsZXQvYmxvYi8xOGVjOTgxL2phdmFzY3JpcHQvc3JjL2luZGV4LmpzI0wyNjYtTDI2OAogIC8KICAvIElkZWFsbHkgd2lkZ2V0IGF1dGhvcnMgd291bGRuJ3QgbmVlZCB0byB1c2UgdGhpcyBzZXRUaW1lb3V0KCkgaGFjayB0aGF0CiAgLyBsZWFmbGV0IHVzZXMgdG8gY2FsbCBTaGlueSBtZXRob2RzIG9uIGEgc3RhdGljUmVuZGVyKCkuIEluIHRoZSBsb25nIHJ1biwKICAvIHRoZSBsb2dpYyBpbml0U2hpbnkgc2hvdWxkIGJlIGJyb2tlbiB1cCBzbyB0aGF0IG1ldGhvZCByZWdpc3RyYXRpb24gaGFwcGVucwogIC8gcmlnaHQgYXdheSwgYnV0IGJpbmRpbmcgaGFwcGVucyBsYXRlci4KICAqLwogIGZ1bmN0aW9uIG1heWJlU3RhdGljUmVuZGVyTGF0ZXIoKSB7CiAgICBpZiAoc2hpbnlNb2RlICYmIGhhc19qUXVlcnkzKCkpIHsKICAgICAgd2luZG93LmpRdWVyeSh3aW5kb3cuSFRNTFdpZGdldHMuc3RhdGljUmVuZGVyKTsKICAgIH0gZWxzZSB7CiAgICAgIHdpbmRvdy5IVE1MV2lkZ2V0cy5zdGF0aWNSZW5kZXIoKTsKICAgIH0KICB9CgogIGlmIChkb2N1bWVudC5hZGRFdmVudExpc3RlbmVyKSB7CiAgICBkb2N1bWVudC5hZGRFdmVudExpc3RlbmVyKCJET01Db250ZW50TG9hZGVkIiwgZnVuY3Rpb24oKSB7CiAgICAgIGRvY3VtZW50LnJlbW92ZUV2ZW50TGlzdGVuZXIoIkRPTUNvbnRlbnRMb2FkZWQiLCBhcmd1bWVudHMuY2FsbGVlLCBmYWxzZSk7CiAgICAgIG1heWJlU3RhdGljUmVuZGVyTGF0ZXIoKTsKICAgIH0sIGZhbHNlKTsKICB9IGVsc2UgaWYgKGRvY3VtZW50LmF0dGFjaEV2ZW50KSB7CiAgICBkb2N1bWVudC5hdHRhY2hFdmVudCgib25yZWFkeXN0YXRlY2hhbmdlIiwgZnVuY3Rpb24oKSB7CiAgICAgIGlmIChkb2N1bWVudC5yZWFkeVN0YXRlID09PSAiY29tcGxldGUiKSB7CiAgICAgICAgZG9jdW1lbnQuZGV0YWNoRXZlbnQoIm9ucmVhZHlzdGF0ZWNoYW5nZSIsIGFyZ3VtZW50cy5jYWxsZWUpOwogICAgICAgIG1heWJlU3RhdGljUmVuZGVyTGF0ZXIoKTsKICAgICAgfQogICAgfSk7CiAgfQoKCiAgd2luZG93LkhUTUxXaWRnZXRzLmdldEF0dGFjaG1lbnRVcmwgPSBmdW5jdGlvbihkZXBuYW1lLCBrZXkpIHsKICAgIC8vIElmIG5vIGtleSwgZGVmYXVsdCB0byB0aGUgZmlyc3QgaXRlbQogICAgaWYgKHR5cGVvZihrZXkpID09PSAidW5kZWZpbmVkIikKICAgICAga2V5ID0gMTsKCiAgICB2YXIgbGluayA9IGRvY3VtZW50LmdldEVsZW1lbnRCeUlkKGRlcG5hbWUgKyAiLSIgKyBrZXkgKyAiLWF0dGFjaG1lbnQiKTsKICAgIGlmICghbGluaykgewogICAgICB0aHJvdyBuZXcgRXJyb3IoIkF0dGFjaG1lbnQgIiArIGRlcG5hbWUgKyAiLyIgKyBrZXkgKyAiIG5vdCBmb3VuZCBpbiBkb2N1bWVudCIpOwogICAgfQogICAgcmV0dXJuIGxpbmsuZ2V0QXR0cmlidXRlKCJocmVmIik7CiAgfTsKCiAgd2luZG93LkhUTUxXaWRnZXRzLmRhdGFmcmFtZVRvRDMgPSBmdW5jdGlvbihkZikgewogICAgdmFyIG5hbWVzID0gW107CiAgICB2YXIgbGVuZ3RoOwogICAgZm9yICh2YXIgbmFtZSBpbiBkZikgewogICAgICAgIGlmIChkZi5oYXNPd25Qcm9wZXJ0eShuYW1lKSkKICAgICAgICAgICAgbmFtZXMucHVzaChuYW1lKTsKICAgICAgICBpZiAodHlwZW9mKGRmW25hbWVdKSAhPT0gIm9iamVjdCIgfHwgdHlwZW9mKGRmW25hbWVdLmxlbmd0aCkgPT09ICJ1bmRlZmluZWQiKSB7CiAgICAgICAgICAgIHRocm93IG5ldyBFcnJvcigiQWxsIGZpZWxkcyBtdXN0IGJlIGFycmF5cyIpOwogICAgICAgIH0gZWxzZSBpZiAodHlwZW9mKGxlbmd0aCkgIT09ICJ1bmRlZmluZWQiICYmIGxlbmd0aCAhPT0gZGZbbmFtZV0ubGVuZ3RoKSB7CiAgICAgICAgICAgIHRocm93IG5ldyBFcnJvcigiQWxsIGZpZWxkcyBtdXN0IGJlIGFycmF5cyBvZiB0aGUgc2FtZSBsZW5ndGgiKTsKICAgICAgICB9CiAgICAgICAgbGVuZ3RoID0gZGZbbmFtZV0ubGVuZ3RoOwogICAgfQogICAgdmFyIHJlc3VsdHMgPSBbXTsKICAgIHZhciBpdGVtOwogICAgZm9yICh2YXIgcm93ID0gMDsgcm93IDwgbGVuZ3RoOyByb3crKykgewogICAgICAgIGl0ZW0gPSB7fTsKICAgICAgICBmb3IgKHZhciBjb2wgPSAwOyBjb2wgPCBuYW1lcy5sZW5ndGg7IGNvbCsrKSB7CiAgICAgICAgICAgIGl0ZW1bbmFtZXNbY29sXV0gPSBkZltuYW1lc1tjb2xdXVtyb3ddOwogICAgICAgIH0KICAgICAgICByZXN1bHRzLnB1c2goaXRlbSk7CiAgICB9CiAgICByZXR1cm4gcmVzdWx0czsKICB9OwoKICB3aW5kb3cuSFRNTFdpZGdldHMudHJhbnNwb3NlQXJyYXkyRCA9IGZ1bmN0aW9uKGFycmF5KSB7CiAgICAgIGlmIChhcnJheS5sZW5ndGggPT09IDApIHJldHVybiBhcnJheTsKICAgICAgdmFyIG5ld0FycmF5ID0gYXJyYXlbMF0ubWFwKGZ1bmN0aW9uKGNvbCwgaSkgewogICAgICAgICAgcmV0dXJuIGFycmF5Lm1hcChmdW5jdGlvbihyb3cpIHsKICAgICAgICAgICAgICByZXR1cm4gcm93W2ldCiAgICAgICAgICB9KQogICAgICB9KTsKICAgICAgcmV0dXJuIG5ld0FycmF5OwogIH07CiAgLy8gU3BsaXQgdmFsdWUgYXQgc3BsaXRDaGFyLCBidXQgYWxsb3cgc3BsaXRDaGFyIHRvIGJlIGVzY2FwZWQKICAvLyB1c2luZyBlc2NhcGVDaGFyLiBBbnkgb3RoZXIgY2hhcmFjdGVycyBlc2NhcGVkIGJ5IGVzY2FwZUNoYXIKICAvLyB3aWxsIGJlIGluY2x1ZGVkIGFzIHVzdWFsIChpbmNsdWRpbmcgZXNjYXBlQ2hhciBpdHNlbGYpLgogIGZ1bmN0aW9uIHNwbGl0V2l0aEVzY2FwZSh2YWx1ZSwgc3BsaXRDaGFyLCBlc2NhcGVDaGFyKSB7CiAgICB2YXIgcmVzdWx0cyA9IFtdOwogICAgdmFyIGVzY2FwZU1vZGUgPSBmYWxzZTsKICAgIHZhciBjdXJyZW50UmVzdWx0ID0gIiI7CiAgICBmb3IgKHZhciBwb3MgPSAwOyBwb3MgPCB2YWx1ZS5sZW5ndGg7IHBvcysrKSB7CiAgICAgIGlmICghZXNjYXBlTW9kZSkgewogICAgICAgIGlmICh2YWx1ZVtwb3NdID09PSBzcGxpdENoYXIpIHsKICAgICAgICAgIHJlc3VsdHMucHVzaChjdXJyZW50UmVzdWx0KTsKICAgICAgICAgIGN1cnJlbnRSZXN1bHQgPSAiIjsKICAgICAgICB9IGVsc2UgaWYgKHZhbHVlW3Bvc10gPT09IGVzY2FwZUNoYXIpIHsKICAgICAgICAgIGVzY2FwZU1vZGUgPSB0cnVlOwogICAgICAgIH0gZWxzZSB7CiAgICAgICAgICBjdXJyZW50UmVzdWx0ICs9IHZhbHVlW3Bvc107CiAgICAgICAgfQogICAgICB9IGVsc2UgewogICAgICAgIGN1cnJlbnRSZXN1bHQgKz0gdmFsdWVbcG9zXTsKICAgICAgICBlc2NhcGVNb2RlID0gZmFsc2U7CiAgICAgIH0KICAgIH0KICAgIGlmIChjdXJyZW50UmVzdWx0ICE9PSAiIikgewogICAgICByZXN1bHRzLnB1c2goY3VycmVudFJlc3VsdCk7CiAgICB9CiAgICByZXR1cm4gcmVzdWx0czsKICB9CiAgLy8gRnVuY3Rpb24gYXV0aG9yZWQgYnkgWWlodWkvSkogQWxsYWlyZQogIHdpbmRvdy5IVE1MV2lkZ2V0cy5ldmFsdWF0ZVN0cmluZ01lbWJlciA9IGZ1bmN0aW9uKG8sIG1lbWJlcikgewogICAgdmFyIHBhcnRzID0gc3BsaXRXaXRoRXNjYXBlKG1lbWJlciwgJy4nLCAnXFwnKTsKICAgIGZvciAodmFyIGkgPSAwLCBsID0gcGFydHMubGVuZ3RoOyBpIDwgbDsgaSsrKSB7CiAgICAgIHZhciBwYXJ0ID0gcGFydHNbaV07CiAgICAgIC8vIHBhcnQgbWF5IGJlIGEgY2hhcmFjdGVyIG9yICdudW1lcmljJyBtZW1iZXIgbmFtZQogICAgICBpZiAobyAhPT0gbnVsbCAmJiB0eXBlb2YgbyA9PT0gIm9iamVjdCIgJiYgcGFydCBpbiBvKSB7CiAgICAgICAgaWYgKGkgPT0gKGwgLSAxKSkgeyAvLyBpZiB3ZSBhcmUgYXQgdGhlIGVuZCBvZiB0aGUgbGluZSB0aGVuIGV2YWx1bGF0ZQogICAgICAgICAgaWYgKHR5cGVvZiBvW3BhcnRdID09PSAic3RyaW5nIikKICAgICAgICAgICAgb1twYXJ0XSA9IHRyeUV2YWwob1twYXJ0XSk7CiAgICAgICAgfSBlbHNlIHsgLy8gb3RoZXJ3aXNlIGNvbnRpbnVlIHRvIG5leHQgZW1iZWRkZWQgb2JqZWN0CiAgICAgICAgICBvID0gb1twYXJ0XTsKICAgICAgICB9CiAgICAgIH0KICAgIH0KICB9OwoKICAvLyBSZXRyaWV2ZSB0aGUgSFRNTFdpZGdldCBpbnN0YW5jZSAoaS5lLiB0aGUgcmV0dXJuIHZhbHVlIG9mIGFuCiAgLy8gSFRNTFdpZGdldCBiaW5kaW5nJ3MgaW5pdGlhbGl6ZSgpIG9yIGZhY3RvcnkoKSBmdW5jdGlvbikKICAvLyBhc3NvY2lhdGVkIHdpdGggYW4gZWxlbWVudCwgb3IgbnVsbCBpZiBub25lLgogIHdpbmRvdy5IVE1MV2lkZ2V0cy5nZXRJbnN0YW5jZSA9IGZ1bmN0aW9uKGVsKSB7CiAgICByZXR1cm4gZWxlbWVudERhdGEoZWwsICJpbml0X3Jlc3VsdCIpOwogIH07CgogIC8vIEZpbmRzIHRoZSBmaXJzdCBlbGVtZW50IGluIHRoZSBzY29wZSB0aGF0IG1hdGNoZXMgdGhlIHNlbGVjdG9yLAogIC8vIGFuZCByZXR1cm5zIHRoZSBIVE1MV2lkZ2V0IGluc3RhbmNlIChpLmUuIHRoZSByZXR1cm4gdmFsdWUgb2YKICAvLyBhbiBIVE1MV2lkZ2V0IGJpbmRpbmcncyBpbml0aWFsaXplKCkgb3IgZmFjdG9yeSgpIGZ1bmN0aW9uKQogIC8vIGFzc29jaWF0ZWQgd2l0aCB0aGF0IGVsZW1lbnQsIGlmIGFueS4gSWYgbm8gZWxlbWVudCBtYXRjaGVzIHRoZQogIC8vIHNlbGVjdG9yLCBvciB0aGUgZmlyc3QgbWF0Y2hpbmcgZWxlbWVudCBoYXMgbm8gSFRNTFdpZGdldAogIC8vIGluc3RhbmNlIGFzc29jaWF0ZWQgd2l0aCBpdCwgdGhlbiBudWxsIGlzIHJldHVybmVkLgogIC8vCiAgLy8gVGhlIHNjb3BlIGFyZ3VtZW50IGlzIG9wdGlvbmFsLCBhbmQgZGVmYXVsdHMgdG8gd2luZG93LmRvY3VtZW50LgogIHdpbmRvdy5IVE1MV2lkZ2V0cy5maW5kID0gZnVuY3Rpb24oc2NvcGUsIHNlbGVjdG9yKSB7CiAgICBpZiAoYXJndW1lbnRzLmxlbmd0aCA9PSAxKSB7CiAgICAgIHNlbGVjdG9yID0gc2NvcGU7CiAgICAgIHNjb3BlID0gZG9jdW1lbnQ7CiAgICB9CgogICAgdmFyIGVsID0gc2NvcGUucXVlcnlTZWxlY3RvcihzZWxlY3Rvcik7CiAgICBpZiAoZWwgPT09IG51bGwpIHsKICAgICAgcmV0dXJuIG51bGw7CiAgICB9IGVsc2UgewogICAgICByZXR1cm4gd2luZG93LkhUTUxXaWRnZXRzLmdldEluc3RhbmNlKGVsKTsKICAgIH0KICB9OwoKICAvLyBGaW5kcyBhbGwgZWxlbWVudHMgaW4gdGhlIHNjb3BlIHRoYXQgbWF0Y2ggdGhlIHNlbGVjdG9yLCBhbmQKICAvLyByZXR1cm5zIHRoZSBIVE1MV2lkZ2V0IGluc3RhbmNlcyAoaS5lLiB0aGUgcmV0dXJuIHZhbHVlcyBvZgogIC8vIGFuIEhUTUxXaWRnZXQgYmluZGluZydzIGluaXRpYWxpemUoKSBvciBmYWN0b3J5KCkgZnVuY3Rpb24pCiAgLy8gYXNzb2NpYXRlZCB3aXRoIHRoZSBlbGVtZW50cywgaW4gYW4gYXJyYXkuIElmIGVsZW1lbnRzIHRoYXQKICAvLyBtYXRjaCB0aGUgc2VsZWN0b3IgZG9uJ3QgaGF2ZSBhbiBhc3NvY2lhdGVkIEhUTUxXaWRnZXQKICAvLyBpbnN0YW5jZSwgdGhlIHJldHVybmVkIGFycmF5IHdpbGwgY29udGFpbiBudWxscy4KICAvLwogIC8vIFRoZSBzY29wZSBhcmd1bWVudCBpcyBvcHRpb25hbCwgYW5kIGRlZmF1bHRzIHRvIHdpbmRvdy5kb2N1bWVudC4KICB3aW5kb3cuSFRNTFdpZGdldHMuZmluZEFsbCA9IGZ1bmN0aW9uKHNjb3BlLCBzZWxlY3RvcikgewogICAgaWYgKGFyZ3VtZW50cy5sZW5ndGggPT0gMSkgewogICAgICBzZWxlY3RvciA9IHNjb3BlOwogICAgICBzY29wZSA9IGRvY3VtZW50OwogICAgfQoKICAgIHZhciBub2RlcyA9IHNjb3BlLnF1ZXJ5U2VsZWN0b3JBbGwoc2VsZWN0b3IpOwogICAgdmFyIHJlc3VsdHMgPSBbXTsKICAgIGZvciAodmFyIGkgPSAwOyBpIDwgbm9kZXMubGVuZ3RoOyBpKyspIHsKICAgICAgcmVzdWx0cy5wdXNoKHdpbmRvdy5IVE1MV2lkZ2V0cy5nZXRJbnN0YW5jZShub2Rlc1tpXSkpOwogICAgfQogICAgcmV0dXJuIHJlc3VsdHM7CiAgfTsKCiAgdmFyIHBvc3RSZW5kZXJIYW5kbGVycyA9IFtdOwogIGZ1bmN0aW9uIGludm9rZVBvc3RSZW5kZXJIYW5kbGVycygpIHsKICAgIHdoaWxlIChwb3N0UmVuZGVySGFuZGxlcnMubGVuZ3RoKSB7CiAgICAgIHZhciBoYW5kbGVyID0gcG9zdFJlbmRlckhhbmRsZXJzLnNoaWZ0KCk7CiAgICAgIGlmIChoYW5kbGVyKSB7CiAgICAgICAgaGFuZGxlcigpOwogICAgICB9CiAgICB9CiAgfQoKICAvLyBSZWdpc3RlciB0aGUgZ2l2ZW4gY2FsbGJhY2sgZnVuY3Rpb24gdG8gYmUgaW52b2tlZCBhZnRlciB0aGUKICAvLyBuZXh0IHRpbWUgc3RhdGljIHdpZGdldHMgYXJlIHJlbmRlcmVkLgogIHdpbmRvdy5IVE1MV2lkZ2V0cy5hZGRQb3N0UmVuZGVySGFuZGxlciA9IGZ1bmN0aW9uKGNhbGxiYWNrKSB7CiAgICBwb3N0UmVuZGVySGFuZGxlcnMucHVzaChjYWxsYmFjayk7CiAgfTsKCiAgLy8gVGFrZXMgYSBuZXctc3R5bGUgaW5zdGFuY2UtYm91bmQgZGVmaW5pdGlvbiwgYW5kIHJldHVybnMgYW4KICAvLyBvbGQtc3R5bGUgY2xhc3MtYm91bmQgZGVmaW5pdGlvbi4gVGhpcyBzYXZlcyB1cyBmcm9tIGhhdmluZwogIC8vIHRvIHJld3JpdGUgYWxsIHRoZSBsb2dpYyBpbiB0aGlzIGZpbGUgdG8gYWNjb21vZGF0ZSBib3RoCiAgLy8gdHlwZXMgb2YgZGVmaW5pdGlvbnMuCiAgZnVuY3Rpb24gY3JlYXRlTGVnYWN5RGVmaW5pdGlvbkFkYXB0ZXIoZGVmbikgewogICAgdmFyIHJlc3VsdCA9IHsKICAgICAgbmFtZTogZGVmbi5uYW1lLAogICAgICB0eXBlOiBkZWZuLnR5cGUsCiAgICAgIGluaXRpYWxpemU6IGZ1bmN0aW9uKGVsLCB3aWR0aCwgaGVpZ2h0KSB7CiAgICAgICAgcmV0dXJuIGRlZm4uZmFjdG9yeShlbCwgd2lkdGgsIGhlaWdodCk7CiAgICAgIH0sCiAgICAgIHJlbmRlclZhbHVlOiBmdW5jdGlvbihlbCwgeCwgaW5zdGFuY2UpIHsKICAgICAgICByZXR1cm4gaW5zdGFuY2UucmVuZGVyVmFsdWUoeCk7CiAgICAgIH0sCiAgICAgIHJlc2l6ZTogZnVuY3Rpb24oZWwsIHdpZHRoLCBoZWlnaHQsIGluc3RhbmNlKSB7CiAgICAgICAgcmV0dXJuIGluc3RhbmNlLnJlc2l6ZSh3aWR0aCwgaGVpZ2h0KTsKICAgICAgfQogICAgfTsKCiAgICBpZiAoZGVmbi5maW5kKQogICAgICByZXN1bHQuZmluZCA9IGRlZm4uZmluZDsKICAgIGlmIChkZWZuLnJlbmRlckVycm9yKQogICAgICByZXN1bHQucmVuZGVyRXJyb3IgPSBkZWZuLnJlbmRlckVycm9yOwogICAgaWYgKGRlZm4uY2xlYXJFcnJvcikKICAgICAgcmVzdWx0LmNsZWFyRXJyb3IgPSBkZWZuLmNsZWFyRXJyb3I7CgogICAgcmV0dXJuIHJlc3VsdDsKICB9Cn0pKCk7Cg==\"></script>\n",
       "<link href=\"data:text/css;charset-utf-8;base64,LmR0LWNyb3NzdGFsay1mYWRlIHsKICBvcGFjaXR5OiAwLjI7Cn0KCmh0bWwgYm9keSBkaXYuRFRTIGRpdi5kYXRhVGFibGVzX3Njcm9sbEJvZHkgewogIGJhY2tncm91bmQ6IG5vbmU7Cn0KCgovKgpGaXggaHR0cHM6Ly9naXRodWIuY29tL3JzdHVkaW8vRFQvaXNzdWVzLzU2MwpJZiB0aGUgYHRhYmxlLmRpc3BsYXlgIGlzIHNldCB0byAiYmxvY2siIChlLmcuLCBwa2dkb3duKSwgdGhlIGJyb3dzZXIgd2lsbCBkaXNwbGF5CmRhdGF0YWJsZSBvYmplY3RzIHN0cmFuZ2VseS4gVGhlIHNlYXJjaCBwYW5lbCBhbmQgdGhlIHBhZ2UgYnV0dG9ucyB3aWxsIHN0aWxsIGJlCmluIGZ1bGwtd2lkdGggYnV0IHRoZSB0YWJsZSBib2R5IHdpbGwgYmUgImNvbXBhY3QiIGFuZCBzaG9ydGVyLgpJbiB0aGVyb3J5LCBoYXZpbmcgdGhpcyBhdHRyaWJ1dGVzIHdpbGwgYWZmZWN0IGBkb209InQiYAp3aXRoIGBkaXNwbGF5OiBibG9ja2AgdXNlcnMuIEJ1dCBpbiByZWFsaXR5LCB0aGVyZSBzaG91bGQgYmUgbm8gb25lLgpXZSBtYXkgcmVtb3ZlIHRoZSBiZWxvdyBsaW5lcyBpbiB0aGUgZnV0dXJlIGlmIHRoZSB1cHN0cmVhbSBhZ3JlZSB0byBoYXZlIHRoaXMgdGhlcmUuClNlZSBodHRwczovL2dpdGh1Yi5jb20vRGF0YVRhYmxlcy9EYXRhVGFibGVzU3JjL2lzc3Vlcy8xNjAKKi8KCnRhYmxlLmRhdGFUYWJsZSB7CiAgZGlzcGxheTogdGFibGU7Cn0KCgovKgpXaGVuIERUT3V0cHV0KGZpbGwgPSBUUlVFKSwgaXQgcmVjZWl2ZXMgYSAuaHRtbC1maWxsLWl0ZW0gY2xhc3MgKHZpYSBodG1sdG9vbHM6OmJpbmRGaWxsUm9sZSgpKSwgd2hpY2ggZWZmZWN0aXZlbHkgYW1vdW50cyB0byBgZmxleDogMSAxIGF1dG9gLiBUaGF0J3MgbW9zdGx5IGZpbmUsIGJ1dCB0aGUgY2FzZSB3aGVyZSBgZmlsbENvbnRhaW5lcj1UUlVFYCtgaGVpZ2h0OmF1dG9gK2BmbGV4LWJhc2lzOmF1dG9gIGFuZCB0aGUgY29udGFpbmVyIChlLmcuLCBhIGJzbGliOjpjYXJkKCkpIGRvZXNuJ3QgaGF2ZSBhIGRlZmluZWQgaGVpZ2h0IGlzIGEgYml0IHByb2JsZW1hdGljIHNpbmNlIHRoZSB0YWJsZSB3YW50cyB0byBmaXQgdGhlIHBhcmVudCBidXQgdGhlIHBhcmVudCB3YW50cyB0byBmaXQgdGhlIHRhYmxlLCB3aGljaCByZXN1bHRzIHByZXR0eSBzbWFsbCB0YWJsZSBoZWlnaHQgKG1heWJlIGJlY2F1c2UgdGhlcmUgaXMgYSBtaW5pbXVtIGhlaWdodCBzb21ld2hlcmU/KS4gSXQgc2VlbXMgYmV0dGVyIGluIHRoaXMgY2FzZSB0byBpbXBvc2UgYSA0MDBweCBoZWlnaHQgZGVmYXVsdCBmb3IgdGhlIHRhYmxlLCB3aGljaCB3ZSBjYW4gZG8gYnkgc2V0dGluZyBgZmxleC1iYXNpc2AgdG8gNDAwcHggKHRoZSB0YWJsZSBpcyBzdGlsbCBhbGxvd2VkIHRvIGdyb3cvc2hyaW5rIHdoZW4gdGhlIGNvbnRhaW5lciBoYXMgYW4gb3BpbmlvbmF0ZWQgaGVpZ2h0KS4KKi8KCi5odG1sLWZpbGwtY29udGFpbmVyID4gLmh0bWwtZmlsbC1pdGVtLmRhdGF0YWJsZXMgewogIGZsZXgtYmFzaXM6IDQwMHB4Owp9Cg==\" rel=\"stylesheet\" />\n",
       "<script title=\"datatables-binding\" src=\"data:application/javascript;base64,KGZ1bmN0aW9uKCkgewoKLy8gc29tZSBoZWxwZXIgZnVuY3Rpb25zOiB1c2luZyBhIGdsb2JhbCBvYmplY3QgRFRXaWRnZXQgc28gdGhhdCBpdCBjYW4gYmUgdXNlZAovLyBpbiBKUygpIGNvZGUsIGUuZy4gZGF0YXRhYmxlKG9wdGlvbnMgPSBsaXN0KGZvbyA9IEpTKCdjb2RlJykpKTsgdW5saWtlIFIncwovLyBkeW5hbWljIHNjb3BpbmcsIHdoZW4gJ2NvZGUnIGlzIGV2YWwnZWQsIEphdmFTY3JpcHQgZG9lcyBub3Qga25vdyBvYmplY3RzCi8vIGZyb20gdGhlICJwYXJlbnQgZnJhbWUiLCBlLmcuIEpTKCdEVFdpZGdldCcpIHdpbGwgbm90IHdvcmsgdW5sZXNzIGl0IHdhcyBtYWRlCi8vIGEgZ2xvYmFsIG9iamVjdAp2YXIgRFRXaWRnZXQgPSB7fTsKCi8vIDEyMzQ1NjY2Ni43ODkwIC0+IDEyMyw0NTYsNjY2Ljc4OTAKdmFyIG1hcmtJbnRlcnZhbCA9IGZ1bmN0aW9uKGQsIGRpZ2l0cywgaW50ZXJ2YWwsIG1hcmssIGRlY01hcmssIHByZWNpc2lvbikgewogIHggPSBwcmVjaXNpb24gPyBkLnRvUHJlY2lzaW9uKGRpZ2l0cykgOiBkLnRvRml4ZWQoZGlnaXRzKTsKICBpZiAoIS9eLT9bXGQuXSskLy50ZXN0KHgpKSByZXR1cm4geDsKICB2YXIgeHYgPSB4LnNwbGl0KCcuJyk7CiAgaWYgKHh2Lmxlbmd0aCA+IDIpIHJldHVybiB4OyAgLy8gc2hvdWxkIGhhdmUgYXQgbW9zdCBvbmUgZGVjaW1hbCBwb2ludAogIHh2WzBdID0geHZbMF0ucmVwbGFjZShuZXcgUmVnRXhwKCdcXEIoPz0oXFxkeycgKyBpbnRlcnZhbCArICd9KSsoPyFcXGQpKScsICdnJyksIG1hcmspOwogIHJldHVybiB4di5qb2luKGRlY01hcmspOwp9OwoKRFRXaWRnZXQuZm9ybWF0Q3VycmVuY3kgPSBmdW5jdGlvbihkYXRhLCBjdXJyZW5jeSwgZGlnaXRzLCBpbnRlcnZhbCwgbWFyaywgZGVjTWFyaywgYmVmb3JlLCB6ZXJvUHJpbnQpIHsKICB2YXIgZCA9IHBhcnNlRmxvYXQoZGF0YSk7CiAgaWYgKGlzTmFOKGQpKSByZXR1cm4gJyc7CiAgaWYgKHplcm9QcmludCAhPT0gbnVsbCAmJiBkID09PSAwLjApIHJldHVybiB6ZXJvUHJpbnQ7CiAgdmFyIHJlcyA9IG1hcmtJbnRlcnZhbChkLCBkaWdpdHMsIGludGVydmFsLCBtYXJrLCBkZWNNYXJrKTsKICByZXMgPSBiZWZvcmUgPyAoL14tLy50ZXN0KHJlcykgPyAnLScgKyBjdXJyZW5jeSArIHJlcy5yZXBsYWNlKC9eLS8sICcnKSA6IGN1cnJlbmN5ICsgcmVzKSA6CiAgICByZXMgKyBjdXJyZW5jeTsKICByZXR1cm4gcmVzOwp9OwoKRFRXaWRnZXQuZm9ybWF0U3RyaW5nID0gZnVuY3Rpb24oZGF0YSwgcHJlZml4LCBzdWZmaXgpIHsKICB2YXIgZCA9IGRhdGE7CiAgaWYgKGQgPT09IG51bGwpIHJldHVybiAnJzsKICByZXR1cm4gcHJlZml4ICsgZCArIHN1ZmZpeDsKfTsKCkRUV2lkZ2V0LmZvcm1hdFBlcmNlbnRhZ2UgPSBmdW5jdGlvbihkYXRhLCBkaWdpdHMsIGludGVydmFsLCBtYXJrLCBkZWNNYXJrLCB6ZXJvUHJpbnQpIHsKICB2YXIgZCA9IHBhcnNlRmxvYXQoZGF0YSk7CiAgaWYgKGlzTmFOKGQpKSByZXR1cm4gJyc7CiAgaWYgKHplcm9QcmludCAhPT0gbnVsbCAmJiBkID09PSAwLjApIHJldHVybiB6ZXJvUHJpbnQ7CiAgcmV0dXJuIG1hcmtJbnRlcnZhbChkICogMTAwLCBkaWdpdHMsIGludGVydmFsLCBtYXJrLCBkZWNNYXJrKSArICclJzsKfTsKCkRUV2lkZ2V0LmZvcm1hdFJvdW5kID0gZnVuY3Rpb24oZGF0YSwgZGlnaXRzLCBpbnRlcnZhbCwgbWFyaywgZGVjTWFyaywgemVyb1ByaW50KSB7CiAgdmFyIGQgPSBwYXJzZUZsb2F0KGRhdGEpOwogIGlmIChpc05hTihkKSkgcmV0dXJuICcnOwogIGlmICh6ZXJvUHJpbnQgIT09IG51bGwgJiYgZCA9PT0gMC4wKSByZXR1cm4gemVyb1ByaW50OwogIHJldHVybiBtYXJrSW50ZXJ2YWwoZCwgZGlnaXRzLCBpbnRlcnZhbCwgbWFyaywgZGVjTWFyayk7Cn07CgpEVFdpZGdldC5mb3JtYXRTaWduaWYgPSBmdW5jdGlvbihkYXRhLCBkaWdpdHMsIGludGVydmFsLCBtYXJrLCBkZWNNYXJrLCB6ZXJvUHJpbnQpIHsKICB2YXIgZCA9IHBhcnNlRmxvYXQoZGF0YSk7CiAgaWYgKGlzTmFOKGQpKSByZXR1cm4gJyc7CiAgaWYgKHplcm9QcmludCAhPT0gbnVsbCAmJiBkID09PSAwLjApIHJldHVybiB6ZXJvUHJpbnQ7CiAgcmV0dXJuIG1hcmtJbnRlcnZhbChkLCBkaWdpdHMsIGludGVydmFsLCBtYXJrLCBkZWNNYXJrLCB0cnVlKTsKfTsKCkRUV2lkZ2V0LmZvcm1hdERhdGUgPSBmdW5jdGlvbihkYXRhLCBtZXRob2QsIHBhcmFtcykgewogIHZhciBkID0gZGF0YTsKICBpZiAoZCA9PT0gbnVsbCkgcmV0dXJuICcnOwogIC8vIChuZXcgRGF0ZSgnMjAxNS0xMC0yOCcpKS50b0RhdGVTdHJpbmcoKSBtYXkgcmV0dXJuIDIwMTUtMTAtMjcgYmVjYXVzZSB0aGUKICAvLyBhY3R1YWwgdGltZSBjcmVhdGVkIGNvdWxkIGJlIGxpa2UgJ1R1ZSBPY3QgMjcgMjAxNSAxOTowMDowMCBHTVQtMDUwMCAoQ0RUKScsCiAgLy8gaS5lLiB0aGUgZGF0ZS1vbmx5IHN0cmluZyBpcyB0cmVhdGVkIGFzIFVUQyB0aW1lIGluc3RlYWQgb2YgbG9jYWwgdGltZQogIGlmICgobWV0aG9kID09PSAndG9EYXRlU3RyaW5nJyB8fCBtZXRob2QgPT09ICd0b0xvY2FsZURhdGVTdHJpbmcnKSAmJiAvXlxkezQsfVxEXGR7Mn1cRFxkezJ9JC8udGVzdChkKSkgewogICAgZCA9IGQuc3BsaXQoL1xELyk7CiAgICBkID0gbmV3IERhdGUoZFswXSwgZFsxXSAtIDEsIGRbMl0pOwogIH0gZWxzZSB7CiAgICBkID0gbmV3IERhdGUoZCk7CiAgfQogIHJldHVybiBkW21ldGhvZF0uYXBwbHkoZCwgcGFyYW1zKTsKfTsKCndpbmRvdy5EVFdpZGdldCA9IERUV2lkZ2V0OwoKLy8gQSBoZWxwZXIgZnVuY3Rpb24gdG8gdXBkYXRlIHRoZSBwcm9wZXJ0aWVzIG9mIGV4aXN0aW5nIGZpbHRlcnMKdmFyIHNldEZpbHRlclByb3BzID0gZnVuY3Rpb24odGQsIHByb3BzKSB7CiAgLy8gVXBkYXRlIGVuYWJsZWQvZGlzYWJsZWQgc3RhdGUKICB2YXIgJGlucHV0ID0gJCh0ZCkuZmluZCgnaW5wdXQnKS5maXJzdCgpOwogIHZhciBzZWFyY2hhYmxlID0gJGlucHV0LmRhdGEoJ3NlYXJjaGFibGUnKTsKICAkaW5wdXQucHJvcCgnZGlzYWJsZWQnLCAhc2VhcmNoYWJsZSB8fCBwcm9wcy5kaXNhYmxlZCk7CgogIC8vIEJhc2VkIG9uIHRoZSBmaWx0ZXIgdHlwZSwgc2V0IGl0cyBuZXcgdmFsdWVzCiAgdmFyIHR5cGUgPSB0ZC5nZXRBdHRyaWJ1dGUoJ2RhdGEtdHlwZScpOwogIGlmIChbJ2ZhY3RvcicsICdsb2dpY2FsJ10uaW5jbHVkZXModHlwZSkpIHsKICAgIC8vIFJlZm9ybWF0IHRoZSBuZXcgZHJvcGRvd24gb3B0aW9ucyBmb3IgdXNlIHdpdGggc2VsZWN0aXplCiAgICB2YXIgbmV3X3ZhbHMgPSBwcm9wcy5wYXJhbXMub3B0aW9ucy5tYXAoZnVuY3Rpb24oaXRlbSkgewogICAgICByZXR1cm4geyB0ZXh0OiBpdGVtLCB2YWx1ZTogaXRlbSB9OwogICAgfSk7CgogICAgLy8gRmluZCB0aGUgc2VsZWN0aXplIG9iamVjdAogICAgdmFyIGRyb3Bkb3duID0gJCh0ZCkuZmluZCgnLnNlbGVjdGl6ZWQnKS5lcSgwKVswXS5zZWxlY3RpemU7CgogICAgLy8gTm90ZSB0aGUgY3VycmVudCB2YWx1ZXMKICAgIHZhciBvbGRfdmFscyA9IGRyb3Bkb3duLmdldFZhbHVlKCk7CgogICAgLy8gUmVtb3ZlIHRoZSBleGlzdGluZyB2YWx1ZXMKICAgIGRyb3Bkb3duLmNsZWFyT3B0aW9ucygpOwoKICAgIC8vIEFkZCB0aGUgbmV3IG9wdGlvbnMKICAgIGRyb3Bkb3duLmFkZE9wdGlvbihuZXdfdmFscyk7CgogICAgLy8gUHJlc2VydmUgdGhlIGV4aXN0aW5nIHZhbHVlcwogICAgZHJvcGRvd24uc2V0VmFsdWUob2xkX3ZhbHMpOwoKICB9IGVsc2UgaWYgKFsnbnVtYmVyJywgJ2ludGVnZXInLCAnZGF0ZScsICd0aW1lJ10uaW5jbHVkZXModHlwZSkpIHsKICAgIC8vIEFwcGx5IGludGVybmFsIHNjYWxpbmcgdG8gbmV3IGxpbWl0cy4gVXBkYXRpbmcgc2NhbGUgbm90IHlldCBpbXBsZW1lbnRlZC4KICAgIHZhciBzbGlkZXIgPSAkKHRkKS5maW5kKCcubm9VaS10YXJnZXQnKS5lcSgwKTsKICAgIHZhciBzY2FsZSA9IE1hdGgucG93KDEwLCBNYXRoLm1heCgwLCArc2xpZGVyLmRhdGEoJ3NjYWxlJykgfHwgMCkpOwogICAgdmFyIG5ld192YWxzID0gW3Byb3BzLnBhcmFtcy5taW4gKiBzY2FsZSwgcHJvcHMucGFyYW1zLm1heCAqIHNjYWxlXTsKCiAgICAvLyBOb3RlIHdoYXQgdGhlIG5ldyBsaW1pdHMgd2lsbCBiZSBqdXN0IGZvciB0aGlzIGZpbHRlcgogICAgdmFyIG5ld19saW1zID0gbmV3X3ZhbHMuc2xpY2UoKTsKCiAgICAvLyBEZXRlcm1pbmUgdGhlIGN1cnJlbnQgdmFsdWVzIGFuZCBsaW1pdHMKICAgIHZhciBvbGRfdmFscyA9IHNsaWRlci52YWwoKS5tYXAoTnVtYmVyKTsKICAgIHZhciBvbGRfbGltcyA9IHNsaWRlci5ub1VpU2xpZGVyKCdvcHRpb25zJykucmFuZ2U7CiAgICBvbGRfbGltcyA9IFtvbGRfbGltcy5taW4sIG9sZF9saW1zLm1heF07CgogICAgLy8gUHJlc2VydmUgdGhlIGN1cnJlbnQgdmFsdWVzIGlmIGZpbHRlcnMgaGF2ZSBiZWVuIGFwcGxpZWQ7IG90aGVyd2lzZSwgYXBwbHkgbm8gZmlsdGVyaW5nCiAgICBpZiAob2xkX3ZhbHNbMF0gIT0gb2xkX2xpbXNbMF0pIHsKICAgICAgbmV3X3ZhbHNbMF0gPSBNYXRoLm1heChvbGRfdmFsc1swXSwgbmV3X3ZhbHNbMF0pOwogICAgfQoKICAgIGlmIChvbGRfdmFsc1sxXSAhPSBvbGRfbGltc1sxXSkgewogICAgICBuZXdfdmFsc1sxXSA9IE1hdGgubWluKG9sZF92YWxzWzFdLCBuZXdfdmFsc1sxXSk7CiAgICB9CgogICAgLy8gVXBkYXRlIHRoZSBlbmRwb2ludHMgb2YgdGhlIHNsaWRlcgogICAgc2xpZGVyLm5vVWlTbGlkZXIoewogICAgICBzdGFydDogbmV3X3ZhbHMsCiAgICAgIHJhbmdlOiB7J21pbic6IG5ld19saW1zWzBdLCAnbWF4JzogbmV3X2xpbXNbMV19CiAgICB9LCB0cnVlKTsKICB9Cn07Cgp2YXIgdHJhbnNwb3NlQXJyYXkyRCA9IGZ1bmN0aW9uKGEpIHsKICByZXR1cm4gYS5sZW5ndGggPT09IDAgPyBhIDogSFRNTFdpZGdldHMudHJhbnNwb3NlQXJyYXkyRChhKTsKfTsKCnZhciBjcm9zc3RhbGtQbHVnaW5zSW5zdGFsbGVkID0gZmFsc2U7CgpmdW5jdGlvbiBtYXliZUluc3RhbGxDcm9zc3RhbGtQbHVnaW5zKCkgewogIGlmIChjcm9zc3RhbGtQbHVnaW5zSW5zdGFsbGVkKQogICAgcmV0dXJuOwogIGNyb3NzdGFsa1BsdWdpbnNJbnN0YWxsZWQgPSB0cnVlOwoKICAkLmZuLmRhdGFUYWJsZS5leHQuYWZuRmlsdGVyaW5nLnB1c2goCiAgICBmdW5jdGlvbihvU2V0dGluZ3MsIGFEYXRhLCBpRGF0YUluZGV4KSB7CiAgICAgIHZhciBjdGZpbHRlciA9IG9TZXR0aW5ncy5uVGFibGUuY3RmaWx0ZXI7CiAgICAgIGlmIChjdGZpbHRlciAmJiAhY3RmaWx0ZXJbaURhdGFJbmRleF0pCiAgICAgICAgcmV0dXJuIGZhbHNlOwoKICAgICAgdmFyIGN0c2VsZWN0ID0gb1NldHRpbmdzLm5UYWJsZS5jdHNlbGVjdDsKICAgICAgaWYgKGN0c2VsZWN0ICYmICFjdHNlbGVjdFtpRGF0YUluZGV4XSkKICAgICAgICByZXR1cm4gZmFsc2U7CgogICAgICByZXR1cm4gdHJ1ZTsKICAgIH0KICApOwp9CgpIVE1MV2lkZ2V0cy53aWRnZXQoewogIG5hbWU6ICJkYXRhdGFibGVzIiwKICB0eXBlOiAib3V0cHV0IiwKICByZW5kZXJPbk51bGxWYWx1ZTogdHJ1ZSwKICBpbml0aWFsaXplOiBmdW5jdGlvbihlbCwgd2lkdGgsIGhlaWdodCkgewogICAgLy8gaW4gb3JkZXIgdGhhdCB0aGUgdHlwZT1udW1iZXIgaW5wdXRzIHJldHVybiBhIG51bWJlcgogICAgJC52YWxIb29rcy5udW1iZXIgPSB7CiAgICAgIGdldDogZnVuY3Rpb24oZWwpIHsKICAgICAgICB2YXIgdmFsdWUgPSBwYXJzZUZsb2F0KGVsLnZhbHVlKTsKICAgICAgICByZXR1cm4gaXNOYU4odmFsdWUpID8gIiIgOiB2YWx1ZTsKICAgICAgfQogICAgfTsKICAgICQoZWwpLmh0bWwoJyZuYnNwOycpOwogICAgcmV0dXJuIHsKICAgICAgZGF0YTogbnVsbCwKICAgICAgY3RmaWx0ZXJIYW5kbGU6IG5ldyBjcm9zc3RhbGsuRmlsdGVySGFuZGxlKCksCiAgICAgIGN0ZmlsdGVyU3Vic2NyaXB0aW9uOiBudWxsLAogICAgICBjdHNlbGVjdEhhbmRsZTogbmV3IGNyb3NzdGFsay5TZWxlY3Rpb25IYW5kbGUoKSwKICAgICAgY3RzZWxlY3RTdWJzY3JpcHRpb246IG51bGwKICAgIH07CiAgfSwKICByZW5kZXJWYWx1ZTogZnVuY3Rpb24oZWwsIGRhdGEsIGluc3RhbmNlKSB7CiAgICBpZiAoZWwub2Zmc2V0V2lkdGggPT09IDAgfHwgZWwub2Zmc2V0SGVpZ2h0ID09PSAwKSB7CiAgICAgIGluc3RhbmNlLmRhdGEgPSBkYXRhOwogICAgICByZXR1cm47CiAgICB9CiAgICBpbnN0YW5jZS5kYXRhID0gbnVsbDsKICAgIHZhciAkZWwgPSAkKGVsKTsKICAgICRlbC5lbXB0eSgpOwoKICAgIGlmIChkYXRhID09PSBudWxsKSB7CiAgICAgICRlbC5hcHBlbmQoJyZuYnNwOycpOwogICAgICAvLyBjbGVhciBwcmV2aW91cyBTaGlueSBpbnB1dHMgKGlmIGFueSkKICAgICAgZm9yICh2YXIgaSBpbiBpbnN0YW5jZS5jbGVhcklucHV0cykgaW5zdGFuY2UuY2xlYXJJbnB1dHNbaV0oKTsKICAgICAgaW5zdGFuY2UuY2xlYXJJbnB1dHMgPSB7fTsKICAgICAgcmV0dXJuOwogICAgfQoKICAgIHZhciBjcm9zc3RhbGtPcHRpb25zID0gZGF0YS5jcm9zc3RhbGtPcHRpb25zOwogICAgaWYgKCFjcm9zc3RhbGtPcHRpb25zKSBjcm9zc3RhbGtPcHRpb25zID0gewogICAgICAna2V5JzogbnVsbCwgJ2dyb3VwJzogbnVsbAogICAgfTsKICAgIGlmIChjcm9zc3RhbGtPcHRpb25zLmdyb3VwKSB7CiAgICAgIG1heWJlSW5zdGFsbENyb3NzdGFsa1BsdWdpbnMoKTsKICAgICAgaW5zdGFuY2UuY3RmaWx0ZXJIYW5kbGUuc2V0R3JvdXAoY3Jvc3N0YWxrT3B0aW9ucy5ncm91cCk7CiAgICAgIGluc3RhbmNlLmN0c2VsZWN0SGFuZGxlLnNldEdyb3VwKGNyb3NzdGFsa09wdGlvbnMuZ3JvdXApOwogICAgfQoKICAgIC8vIGlmIHdlIGFyZSBpbiB0aGUgdmlld2VyIHRoZW4gd2UgYWx3YXlzIHdhbnQgdG8gZmlsbENvbnRhaW5lciBhbmQKICAgIC8vIGFuZCBhdXRvSGlkZU5hdmlnYXRpb24gKHVubGVzcyB0aGUgdXNlciBoYXMgZXhwbGljaXRseSBzZXQgdGhlc2UpCiAgICBpZiAod2luZG93LkhUTUxXaWRnZXRzLnZpZXdlck1vZGUpIHsKICAgICAgaWYgKCFkYXRhLmhhc093blByb3BlcnR5KCJmaWxsQ29udGFpbmVyIikpCiAgICAgICAgZGF0YS5maWxsQ29udGFpbmVyID0gdHJ1ZTsKICAgICAgaWYgKCFkYXRhLmhhc093blByb3BlcnR5KCJhdXRvSGlkZU5hdmlnYXRpb24iKSkKICAgICAgICBkYXRhLmF1dG9IaWRlTmF2aWdhdGlvbiA9IHRydWU7CiAgICB9CgogICAgLy8gcHJvcGFnYXRlIGZpbGxDb250YWluZXIgdG8gaW5zdGFuY2UgKHNvIHdlIGhhdmUgaXQgaW4gcmVzaXplKQogICAgaW5zdGFuY2UuZmlsbENvbnRhaW5lciA9IGRhdGEuZmlsbENvbnRhaW5lcjsKCiAgICB2YXIgY2VsbHMgPSBkYXRhLmRhdGE7CgogICAgaWYgKGNlbGxzIGluc3RhbmNlb2YgQXJyYXkpIGNlbGxzID0gdHJhbnNwb3NlQXJyYXkyRChjZWxscyk7CgogICAgJGVsLmFwcGVuZChkYXRhLmNvbnRhaW5lcik7CiAgICB2YXIgJHRhYmxlID0gJGVsLmZpbmQoJ3RhYmxlJyk7CiAgICBpZiAoZGF0YS5jbGFzcykgJHRhYmxlLmFkZENsYXNzKGRhdGEuY2xhc3MpOwogICAgaWYgKGRhdGEuY2FwdGlvbikgJHRhYmxlLnByZXBlbmQoZGF0YS5jYXB0aW9uKTsKCiAgICBpZiAoIWRhdGEuc2VsZWN0aW9uKSBkYXRhLnNlbGVjdGlvbiA9IHsKICAgICAgbW9kZTogJ25vbmUnLCBzZWxlY3RlZDogbnVsbCwgdGFyZ2V0OiAncm93Jywgc2VsZWN0YWJsZTogbnVsbAogICAgfTsKICAgIGlmIChIVE1MV2lkZ2V0cy5zaGlueU1vZGUgJiYgZGF0YS5zZWxlY3Rpb24ubW9kZSAhPT0gJ25vbmUnICYmCiAgICAgICAgZGF0YS5zZWxlY3Rpb24udGFyZ2V0ID09PSAncm93K2NvbHVtbicpIHsKICAgICAgaWYgKCR0YWJsZS5jaGlsZHJlbigndGZvb3QnKS5sZW5ndGggPT09IDApIHsKICAgICAgICAkdGFibGUuYXBwZW5kKCQoJzx0Zm9vdD4nKSk7CiAgICAgICAgJHRhYmxlLmZpbmQoJ3RoZWFkIHRyJykuY2xvbmUoKS5hcHBlbmRUbygkdGFibGUuZmluZCgndGZvb3QnKSk7CiAgICAgIH0KICAgIH0KCiAgICAvLyBjb2x1bW4gZmlsdGVycwogICAgdmFyIGZpbHRlclJvdzsKICAgIHN3aXRjaCAoZGF0YS5maWx0ZXIpIHsKICAgICAgY2FzZSAndG9wJzoKICAgICAgICAkdGFibGUuY2hpbGRyZW4oJ3RoZWFkJykuYXBwZW5kKGRhdGEuZmlsdGVySFRNTCk7CiAgICAgICAgZmlsdGVyUm93ID0gJHRhYmxlLmZpbmQoJ3RoZWFkIHRyOmxhc3QgdGQnKTsKICAgICAgICBicmVhazsKICAgICAgY2FzZSAnYm90dG9tJzoKICAgICAgICBpZiAoJHRhYmxlLmNoaWxkcmVuKCd0Zm9vdCcpLmxlbmd0aCA9PT0gMCkgewogICAgICAgICAgJHRhYmxlLmFwcGVuZCgkKCc8dGZvb3Q+JykpOwogICAgICAgIH0KICAgICAgICAkdGFibGUuY2hpbGRyZW4oJ3Rmb290JykucHJlcGVuZChkYXRhLmZpbHRlckhUTUwpOwogICAgICAgIGZpbHRlclJvdyA9ICR0YWJsZS5maW5kKCd0Zm9vdCB0cjpmaXJzdCB0ZCcpOwogICAgICAgIGJyZWFrOwogICAgfQoKICAgIHZhciBvcHRpb25zID0geyBzZWFyY2hEZWxheTogMTAwMCB9OwogICAgaWYgKGNlbGxzICE9PSBudWxsKSAkLmV4dGVuZChvcHRpb25zLCB7CiAgICAgIGRhdGE6IGNlbGxzCiAgICB9KTsKCiAgICAvLyBvcHRpb25zIGZvciBmaWxsQ29udGFpbmVyCiAgICB2YXIgYm9vdHN0cmFwQWN0aXZlID0gdHlwZW9mKCQuZm4ucG9wb3ZlcikgIT0gJ3VuZGVmaW5lZCc7CiAgICBpZiAoaW5zdGFuY2UuZmlsbENvbnRhaW5lcikgewoKICAgICAgLy8gZm9yY2Ugc2Nyb2xsWC9zY3JvbGxZIGFuZCB0dXJuIG9mZiBhdXRvV2lkdGgKICAgICAgb3B0aW9ucy5zY3JvbGxYID0gdHJ1ZTsKICAgICAgb3B0aW9ucy5zY3JvbGxZID0gIjEwMHB4IjsgLy8gY2FuIGJlIGFueSB2YWx1ZSwgd2UnbGwgYWRqdXN0IGJlbG93CgogICAgICAvLyBpZiB3ZSBhcmVuJ3QgcGFnaW5hdGluZyB0aGVuIG1vdmUgYXJvdW5kIHRoZSBpbmZvL2ZpbHRlciBjb250cm9scwogICAgICAvLyB0byBzYXZlIHNwYWNlIGF0IHRoZSBib3R0b20gYW5kIHJlcGhyYXNlIHRoZSBpbmZvIGNhbGxiYWNrCiAgICAgIGlmIChkYXRhLm9wdGlvbnMucGFnaW5nID09PSBmYWxzZSkgewoKICAgICAgICAvLyB3ZSBrbm93IGhvdyB0byBkbyB0aGlzIGNsZWFubHkgZm9yIGJvb3RzdHJhcCwgbm90IHNvIG11Y2gKICAgICAgICAvLyBmb3Igb3RoZXIgdGhlbWVzL2xheW91dHMKICAgICAgICBpZiAoYm9vdHN0cmFwQWN0aXZlKSB7CiAgICAgICAgICBvcHRpb25zLmRvbSA9ICI8J3Jvdyc8J2NvbC1zbS00J2k+PCdjb2wtc20tOCdmPj4iICsKICAgICAgICAgICAgICAgICAgICAgICAgIjwncm93JzwnY29sLXNtLTEyJ3RyPj4iOwogICAgICAgIH0KCiAgICAgICAgb3B0aW9ucy5mbkluZm9DYWxsYmFjayA9IGZ1bmN0aW9uKG9TZXR0aW5ncywgaVN0YXJ0LCBpRW5kLAogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaU1heCwgaVRvdGFsLCBzUHJlKSB7CiAgICAgICAgICByZXR1cm4gTnVtYmVyKGlUb3RhbCkudG9Mb2NhbGVTdHJpbmcoKSArICIgcmVjb3JkcyI7CiAgICAgICAgfTsKICAgICAgfQogICAgfQoKICAgIC8vIGF1dG8gaGlkZSBuYXZpZ2F0aW9uIGlmIHJlcXVlc3RlZAogICAgLy8gTm90ZSwgdGhpcyBvbmx5IHdvcmtzIG9uIGNsaWVudC1zaWRlIHByb2Nlc3NpbmcgbW9kZSBhcyBvbiBzZXJ2ZXItc2lkZSwKICAgIC8vIGNlbGxzIChkYXRhLmRhdGEpIGlzIG51bGw7IEluIGFkZGl0aW9uLCB3ZSByZXF1aXJlIHRoZSBwYWdlTGVuZ3RoIG9wdGlvbgogICAgLy8gYmVpbmcgcHJvdmlkZWQgZXhwbGljaXRseSB0byBlbmFibGUgdGhpcy4gRGVzcGl0ZSB3ZSBtYXkgYmUgYWJsZSB0byBkZWR1Y2UKICAgIC8vIHRoZSBkZWZhdWx0IHZhbHVlIG9mIHBhZ2VMZW5ndGgsIGl0IG1heSBjb21wbGljYXRlIHRoaW5ncyBzbyB3ZSdkIHJhdGhlcgogICAgLy8gcHV0IHRoaXMgcmVzcG9uc2libGl0eSB0byB1c2VycyBhbmQgd2FybiB0aGVtIG9uIHRoZSBSIHNpZGUuCiAgICBpZiAoZGF0YS5hdXRvSGlkZU5hdmlnYXRpb24gPT09IHRydWUgJiYgZGF0YS5vcHRpb25zLnBhZ2luZyAhPT0gZmFsc2UpIHsKICAgICAgLy8gc3RyaXAgYWxsIG5hdiBpZiBsZW5ndGggPj0gY2VsbHMKICAgICAgaWYgKChjZWxscyBpbnN0YW5jZW9mIEFycmF5KSAmJiBkYXRhLm9wdGlvbnMucGFnZUxlbmd0aCA+PSBjZWxscy5sZW5ndGgpCiAgICAgICAgb3B0aW9ucy5kb20gPSBib290c3RyYXBBY3RpdmUgPyAiPCdyb3cnPCdjb2wtc20tMTIndHI+PiIgOiAidCI7CiAgICAgIC8vIGFsdGVybmF0aXZlbHkgbGVhbiB0aGluZ3Mgb3V0IGZvciBmbGV4ZGFzaGJvYXJkIG1vYmlsZSBwb3J0cmFpdAogICAgICBlbHNlIGlmIChib290c3RyYXBBY3RpdmUgJiYgd2luZG93LkZsZXhEYXNoYm9hcmQgJiYgd2luZG93LkZsZXhEYXNoYm9hcmQuaXNNb2JpbGVQaG9uZSgpKQogICAgICAgIG9wdGlvbnMuZG9tID0gIjwncm93JzwnY29sLXNtLTEyJ2Y+PiIgKwogICAgICAgICAgICAgICAgICAgICAgIjwncm93JzwnY29sLXNtLTEyJ3RyPj4iICArCiAgICAgICAgICAgICAgICAgICAgICAiPCdyb3cnPCdjb2wtc20tMTIncD4+IjsKICAgIH0KCiAgICAkLmV4dGVuZCh0cnVlLCBvcHRpb25zLCBkYXRhLm9wdGlvbnMgfHwge30pOwoKICAgIHZhciBzZWFyY2hDb2xzID0gb3B0aW9ucy5zZWFyY2hDb2xzOwogICAgaWYgKHNlYXJjaENvbHMpIHsKICAgICAgc2VhcmNoQ29scyA9IHNlYXJjaENvbHMubWFwKGZ1bmN0aW9uKHgpIHsKICAgICAgICByZXR1cm4geCA9PT0gbnVsbCA/ICcnIDogeC5zZWFyY2g7CiAgICAgIH0pOwogICAgICAvLyBGSVhNRTogdGhpcyBtZWFucyBJIGRvbid0IHJlc3BlY3QgdGhlIGVzY2FwZVJlZ2V4IHNldHRpbmcKICAgICAgZGVsZXRlIG9wdGlvbnMuc2VhcmNoQ29sczsKICAgIH0KCiAgICAvLyBzZXJ2ZXItc2lkZSBwcm9jZXNzaW5nPwogICAgdmFyIHNlcnZlciA9IG9wdGlvbnMuc2VydmVyU2lkZSA9PT0gdHJ1ZTsKCiAgICAvLyB1c2UgdGhlIGRhdGFTcmMgZnVuY3Rpb24gdG8gcHJlLXByb2Nlc3MgSlNPTiBkYXRhIHJldHVybmVkIGZyb20gUgogICAgdmFyIERUX3Jvd3NfYWxsID0gW10sIERUX3Jvd3NfY3VycmVudCA9IFtdOwogICAgaWYgKHNlcnZlciAmJiBIVE1MV2lkZ2V0cy5zaGlueU1vZGUgJiYgdHlwZW9mIG9wdGlvbnMuYWpheCA9PT0gJ29iamVjdCcgJiYKICAgICAgICAvXnNlc3Npb25cL1tcZGEtel0rXC9kYXRhb2JqLy50ZXN0KG9wdGlvbnMuYWpheC51cmwpICYmICFvcHRpb25zLmFqYXguZGF0YVNyYykgewogICAgICBvcHRpb25zLmFqYXguZGF0YVNyYyA9IGZ1bmN0aW9uKGpzb24pIHsKICAgICAgICBEVF9yb3dzX2FsbCA9ICQubWFrZUFycmF5KGpzb24uRFRfcm93c19hbGwpOwogICAgICAgIERUX3Jvd3NfY3VycmVudCA9ICQubWFrZUFycmF5KGpzb24uRFRfcm93c19jdXJyZW50KTsKICAgICAgICB2YXIgZGF0YSA9IGpzb24uZGF0YTsKICAgICAgICBpZiAoIWNvbFJlb3JkZXJFbmFibGVkKCkpIHJldHVybiBkYXRhOwogICAgICAgIHZhciB0YWJsZSA9ICR0YWJsZS5EYXRhVGFibGUoKSwgb3JkZXIgPSB0YWJsZS5jb2xSZW9yZGVyLm9yZGVyKCksIGZsYWcgPSB0cnVlLCBpLCBqLCByb3c7CiAgICAgICAgZm9yIChpID0gMDsgaSA8IG9yZGVyLmxlbmd0aDsgKytpKSBpZiAob3JkZXJbaV0gIT09IGkpIGZsYWcgPSBmYWxzZTsKICAgICAgICBpZiAoZmxhZykgcmV0dXJuIGRhdGE7CiAgICAgICAgZm9yIChpID0gMDsgaSA8IGRhdGEubGVuZ3RoOyArK2kpIHsKICAgICAgICAgIHJvdyA9IGRhdGFbaV0uc2xpY2UoKTsKICAgICAgICAgIGZvciAoaiA9IDA7IGogPCBvcmRlci5sZW5ndGg7ICsraikgZGF0YVtpXVtqXSA9IHJvd1tvcmRlcltqXV07CiAgICAgICAgfQogICAgICAgIHJldHVybiBkYXRhOwogICAgICB9OwogICAgfQoKICAgIHZhciB0aGl6ID0gdGhpczsKICAgIGlmIChpbnN0YW5jZS5maWxsQ29udGFpbmVyKSAkdGFibGUub24oJ2luaXQuZHQnLCBmdW5jdGlvbihlKSB7CiAgICAgIHRoaXouZmlsbEF2YWlsYWJsZUhlaWdodChlbCwgJChlbCkuaW5uZXJIZWlnaHQoKSk7CiAgICB9KTsKICAgIC8vIElmIHRoZSBwYWdlIGNvbnRhaW5zIHNlcnZlcmFsIGRhdGF0YWJsZXMgYW5kIG9uZSBvZiB3aGljaCBlbmFibGVzIGNvbFJlb3JkZXIsCiAgICAvLyB0aGUgdGFibGUuY29sUmVvcmRlci5vcmRlcigpIGZ1bmN0aW9uIHdpbGwgZXhpc3QgYnV0IHRocm93cyBlcnJvciB3aGVuIGNhbGxlZC4KICAgIC8vIFNvIGl0IHNlZW1zIGxpa2UgdGhlIG9ubHkgd2F5IHRvIGtub3cgaWYgY29sUmVvcmRlciBpcyBlbmFibGVkIG9yIG5vdCBpcyB0bwogICAgLy8gY2hlY2sgdGhlIG9wdGlvbnMuCiAgICB2YXIgY29sUmVvcmRlckVuYWJsZWQgPSBmdW5jdGlvbigpIHsgcmV0dXJuICJjb2xSZW9yZGVyIiBpbiBvcHRpb25zOyB9OwogICAgdmFyIHRhYmxlID0gJHRhYmxlLkRhdGFUYWJsZShvcHRpb25zKTsKICAgICRlbC5kYXRhKCdkYXRhdGFibGUnLCB0YWJsZSk7CgogICAgLy8gVW5yZWdpc3RlciBwcmV2aW91cyBDcm9zc3RhbGsgZXZlbnQgc3Vic2NyaXB0aW9ucywgaWYgdGhleSBleGlzdAogICAgaWYgKGluc3RhbmNlLmN0ZmlsdGVyU3Vic2NyaXB0aW9uKSB7CiAgICAgIGluc3RhbmNlLmN0ZmlsdGVySGFuZGxlLm9mZigiY2hhbmdlIiwgaW5zdGFuY2UuY3RmaWx0ZXJTdWJzY3JpcHRpb24pOwogICAgICBpbnN0YW5jZS5jdGZpbHRlclN1YnNjcmlwdGlvbiA9IG51bGw7CiAgICB9CiAgICBpZiAoaW5zdGFuY2UuY3RzZWxlY3RTdWJzY3JpcHRpb24pIHsKICAgICAgaW5zdGFuY2UuY3RzZWxlY3RIYW5kbGUub2ZmKCJjaGFuZ2UiLCBpbnN0YW5jZS5jdHNlbGVjdFN1YnNjcmlwdGlvbik7CiAgICAgIGluc3RhbmNlLmN0c2VsZWN0U3Vic2NyaXB0aW9uID0gbnVsbDsKICAgIH0KCiAgICBpZiAoIWNyb3NzdGFsa09wdGlvbnMuZ3JvdXApIHsKICAgICAgJHRhYmxlWzBdLmN0ZmlsdGVyID0gbnVsbDsKICAgICAgJHRhYmxlWzBdLmN0c2VsZWN0ID0gbnVsbDsKICAgIH0gZWxzZSB7CiAgICAgIHZhciBrZXkgPSBjcm9zc3RhbGtPcHRpb25zLmtleTsKICAgICAgZnVuY3Rpb24ga2V5c1RvTWF0Y2hlcyhrZXlzKSB7CiAgICAgICAgaWYgKCFrZXlzKSB7CiAgICAgICAgICByZXR1cm4gbnVsbDsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgdmFyIHNlbGVjdGVkS2V5cyA9IHt9OwogICAgICAgICAgZm9yICh2YXIgaSA9IDA7IGkgPCBrZXlzLmxlbmd0aDsgaSsrKSB7CiAgICAgICAgICAgIHNlbGVjdGVkS2V5c1trZXlzW2ldXSA9IHRydWU7CiAgICAgICAgICB9CiAgICAgICAgICB2YXIgbWF0Y2hlcyA9IHt9OwogICAgICAgICAgZm9yICh2YXIgaiA9IDA7IGogPCBrZXkubGVuZ3RoOyBqKyspIHsKICAgICAgICAgICAgaWYgKHNlbGVjdGVkS2V5c1trZXlbal1dKQogICAgICAgICAgICAgIG1hdGNoZXNbal0gPSB0cnVlOwogICAgICAgICAgfQogICAgICAgICAgcmV0dXJuIG1hdGNoZXM7CiAgICAgICAgfQogICAgICB9CgogICAgICBmdW5jdGlvbiBhcHBseUNyb3NzdGFsa0ZpbHRlcihlKSB7CiAgICAgICAgJHRhYmxlWzBdLmN0ZmlsdGVyID0ga2V5c1RvTWF0Y2hlcyhlLnZhbHVlKTsKICAgICAgICB0YWJsZS5kcmF3KCk7CiAgICAgIH0KICAgICAgaW5zdGFuY2UuY3RmaWx0ZXJTdWJzY3JpcHRpb24gPSBpbnN0YW5jZS5jdGZpbHRlckhhbmRsZS5vbigiY2hhbmdlIiwgYXBwbHlDcm9zc3RhbGtGaWx0ZXIpOwogICAgICBhcHBseUNyb3NzdGFsa0ZpbHRlcih7dmFsdWU6IGluc3RhbmNlLmN0ZmlsdGVySGFuZGxlLmZpbHRlcmVkS2V5c30pOwoKICAgICAgZnVuY3Rpb24gYXBwbHlDcm9zc3RhbGtTZWxlY3Rpb24oZSkgewogICAgICAgIGlmIChlLnNlbmRlciAhPT0gaW5zdGFuY2UuY3RzZWxlY3RIYW5kbGUpIHsKICAgICAgICAgIHRhYmxlCiAgICAgICAgICAgIC5yb3dzKCcuJyArIHNlbENsYXNzLCB7c2VhcmNoOiAnYXBwbGllZCd9KQogICAgICAgICAgICAubm9kZXMoKQogICAgICAgICAgICAudG8kKCkKICAgICAgICAgICAgLnJlbW92ZUNsYXNzKHNlbENsYXNzKTsKICAgICAgICAgIGlmIChzZWxlY3RlZFJvd3MpCiAgICAgICAgICAgIGNoYW5nZUlucHV0KCdyb3dzX3NlbGVjdGVkJywgc2VsZWN0ZWRSb3dzKCksIHZvaWQgMCwgdHJ1ZSk7CiAgICAgICAgfQoKICAgICAgICBpZiAoZS5zZW5kZXIgIT09IGluc3RhbmNlLmN0c2VsZWN0SGFuZGxlICYmIGUudmFsdWUgJiYgZS52YWx1ZS5sZW5ndGgpIHsKICAgICAgICAgIHZhciBtYXRjaGVzID0ga2V5c1RvTWF0Y2hlcyhlLnZhbHVlKTsKCiAgICAgICAgICAvLyBwZXJzaXN0ZW50IHNlbGVjdGlvbiB3aXRoIHBsb3RseSAoJiBsZWFmbGV0KQogICAgICAgICAgdmFyIGN0T3B0cyA9IGNyb3NzdGFsay52YXIoInBsb3RseUNyb3NzdGFsa09wdHMiKS5nZXQoKSB8fCB7fTsKICAgICAgICAgIGlmIChjdE9wdHMucGVyc2lzdGVudCA9PT0gdHJ1ZSkgewogICAgICAgICAgICB2YXIgbWF0Y2hlcyA9ICQuZXh0ZW5kKG1hdGNoZXMsICR0YWJsZVswXS5jdHNlbGVjdCk7CiAgICAgICAgICB9CgogICAgICAgICAgJHRhYmxlWzBdLmN0c2VsZWN0ID0gbWF0Y2hlczsKICAgICAgICAgIHRhYmxlLmRyYXcoKTsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgaWYgKCR0YWJsZVswXS5jdHNlbGVjdCkgewogICAgICAgICAgICAkdGFibGVbMF0uY3RzZWxlY3QgPSBudWxsOwogICAgICAgICAgICB0YWJsZS5kcmF3KCk7CiAgICAgICAgICB9CiAgICAgICAgfQogICAgICB9CiAgICAgIGluc3RhbmNlLmN0c2VsZWN0U3Vic2NyaXB0aW9uID0gaW5zdGFuY2UuY3RzZWxlY3RIYW5kbGUub24oImNoYW5nZSIsIGFwcGx5Q3Jvc3N0YWxrU2VsZWN0aW9uKTsKICAgICAgLy8gVE9ETzogVGhpcyBuZXh0IGxpbmUgZG9lc24ndCBzZWVtIHRvIHdvcmsgd2hlbiByZW5kZXJEYXRhVGFibGUgaXMgdXNlZAogICAgICBhcHBseUNyb3NzdGFsa1NlbGVjdGlvbih7dmFsdWU6IGluc3RhbmNlLmN0c2VsZWN0SGFuZGxlLnZhbHVlfSk7CiAgICB9CgogICAgdmFyIGluQXJyYXkgPSBmdW5jdGlvbih2YWwsIGFycmF5KSB7CiAgICAgIHJldHVybiAkLmluQXJyYXkodmFsLCAkLm1ha2VBcnJheShhcnJheSkpID4gLTE7CiAgICB9OwoKICAgIC8vIHNlYXJjaCB0aGUgaS10aCBjb2x1bW4KICAgIHZhciBzZWFyY2hDb2x1bW4gPSBmdW5jdGlvbihpLCB2YWx1ZSkgewogICAgICB2YXIgcmVnZXggPSBmYWxzZSwgY2kgPSB0cnVlOwogICAgICBpZiAob3B0aW9ucy5zZWFyY2gpIHsKICAgICAgICByZWdleCA9IG9wdGlvbnMuc2VhcmNoLnJlZ2V4LAogICAgICAgIGNpID0gb3B0aW9ucy5zZWFyY2guY2FzZUluc2Vuc2l0aXZlICE9PSBmYWxzZTsKICAgICAgfQogICAgICByZXR1cm4gdGFibGUuY29sdW1uKGkpLnNlYXJjaCh2YWx1ZSwgcmVnZXgsICFyZWdleCwgY2kpOwogICAgfTsKCiAgICBpZiAoZGF0YS5maWx0ZXIgIT09ICdub25lJykgewoKICAgICAgZmlsdGVyUm93LmVhY2goZnVuY3Rpb24oaSwgdGQpIHsKCiAgICAgICAgdmFyICR0ZCA9ICQodGQpLCB0eXBlID0gJHRkLmRhdGEoJ3R5cGUnKSwgZmlsdGVyOwogICAgICAgIHZhciAkaW5wdXQgPSAkdGQuY2hpbGRyZW4oJ2RpdicpLmZpcnN0KCkuY2hpbGRyZW4oJ2lucHV0Jyk7CiAgICAgICAgdmFyIGRpc2FibGVkID0gJGlucHV0LnByb3AoJ2Rpc2FibGVkJyk7CiAgICAgICAgdmFyIHNlYXJjaGFibGUgPSB0YWJsZS5zZXR0aW5ncygpWzBdLmFvQ29sdW1uc1tpXS5iU2VhcmNoYWJsZTsKICAgICAgICAkaW5wdXQucHJvcCgnZGlzYWJsZWQnLCAhc2VhcmNoYWJsZSB8fCBkaXNhYmxlZCk7CiAgICAgICAgJGlucHV0LmRhdGEoJ3NlYXJjaGFibGUnLCBzZWFyY2hhYmxlKTsgLy8gZm9yIHVwZGF0aW5nIGxhdGVyCiAgICAgICAgJGlucHV0Lm9uKCdpbnB1dCBibHVyJywgZnVuY3Rpb24oKSB7CiAgICAgICAgICAkaW5wdXQubmV4dCgnc3BhbicpLnRvZ2dsZShCb29sZWFuKCRpbnB1dC52YWwoKSkpOwogICAgICAgIH0pOwogICAgICAgIC8vIEJvb3RzdHJhcCBzZXRzIHBvaW50ZXItZXZlbnRzIHRvIG5vbmUgYW5kIHdlIHdvbid0IGJlIGFibGUgdG8gY2xpY2sKICAgICAgICAvLyB0aGUgY2xlYXIgYnV0dG9uCiAgICAgICAgJGlucHV0Lm5leHQoJ3NwYW4nKS5jc3MoJ3BvaW50ZXItZXZlbnRzJywgJ2F1dG8nKS5oaWRlKCkuY2xpY2soZnVuY3Rpb24oKSB7CiAgICAgICAgICAkKHRoaXMpLmhpZGUoKS5wcmV2KCdpbnB1dCcpLnZhbCgnJykudHJpZ2dlcignaW5wdXQnKS5mb2N1cygpOwogICAgICAgIH0pOwogICAgICAgIHZhciBzZWFyY2hDb2w7ICAvLyBzZWFyY2ggc3RyaW5nIGZvciB0aGlzIGNvbHVtbgogICAgICAgIGlmIChzZWFyY2hDb2xzICYmIHNlYXJjaENvbHNbaV0pIHsKICAgICAgICAgIHNlYXJjaENvbCA9IHNlYXJjaENvbHNbaV07CiAgICAgICAgICAkaW5wdXQudmFsKHNlYXJjaENvbCkudHJpZ2dlcignaW5wdXQnKTsKICAgICAgICB9CiAgICAgICAgdmFyICR4ID0gJHRkLmNoaWxkcmVuKCdkaXYnKS5sYXN0KCk7CgogICAgICAgIC8vIHJlbW92ZSB0aGUgb3ZlcmZsb3c6IGhpZGRlbiBhdHRyaWJ1dGUgb2YgdGhlIHNjcm9sbEhlYWQKICAgICAgICAvLyAob3RoZXJ3aXNlIHRoZSBzY3JvbGxpbmcgdGFibGUgYm9keSBvYnNjdXJlcyB0aGUgZmlsdGVycykKICAgICAgICAvLyBUaGUgd29ya2Fyb3VuZCBhbmQgdGhlIGRpc2N1c3Npb24gZnJvbQogICAgICAgIC8vIGh0dHBzOi8vZ2l0aHViLmNvbS9yc3R1ZGlvL0RUL2lzc3Vlcy81NTQjaXNzdWVjb21tZW50LTUxODAwNzM0NwogICAgICAgIC8vIE90aGVyd2lzZSB0aGUgZmlsdGVyIHNlbGVjdGlvbiB3aWxsIG5vdCBiZSBhbmNob3JlZCB0byB0aGUgdmFsdWVzCiAgICAgICAgLy8gd2hlbiB0aGUgY29sdW1ucyBudW1iZXIgaXMgbWFueSBhbmQgc2Nyb2xsWCBpcyBlbmFibGVkLgogICAgICAgIHZhciBzY3JvbGxIZWFkID0gJChlbCkuZmluZCgnLmRhdGFUYWJsZXNfc2Nyb2xsSGVhZCwuZGF0YVRhYmxlc19zY3JvbGxGb290Jyk7CiAgICAgICAgdmFyIGNzc092ZXJmbG93SGVhZCA9IHNjcm9sbEhlYWQuY3NzKCdvdmVyZmxvdycpOwogICAgICAgIHZhciBzY3JvbGxCb2R5ID0gJChlbCkuZmluZCgnLmRhdGFUYWJsZXNfc2Nyb2xsQm9keScpOwogICAgICAgIHZhciBjc3NPdmVyZmxvd0JvZHkgPSBzY3JvbGxCb2R5LmNzcygnb3ZlcmZsb3cnKTsKICAgICAgICB2YXIgc2Nyb2xsVGFibGUgPSAkKGVsKS5maW5kKCcuZGF0YVRhYmxlc19zY3JvbGwnKTsKICAgICAgICB2YXIgY3NzT3ZlcmZsb3dUYWJsZSA9IHNjcm9sbFRhYmxlLmNzcygnb3ZlcmZsb3cnKTsKICAgICAgICBpZiAoY3NzT3ZlcmZsb3dIZWFkID09PSAnaGlkZGVuJykgewogICAgICAgICAgJHgub24oJ3Nob3cgaGlkZScsIGZ1bmN0aW9uKGUpIHsKICAgICAgICAgICAgaWYgKGUudHlwZSA9PT0gJ3Nob3cnKSB7CiAgICAgICAgICAgICAgc2Nyb2xsSGVhZC5jc3MoJ292ZXJmbG93JywgJ3Zpc2libGUnKTsKICAgICAgICAgICAgICBzY3JvbGxCb2R5LmNzcygnb3ZlcmZsb3cnLCAndmlzaWJsZScpOwogICAgICAgICAgICAgIHNjcm9sbFRhYmxlLmNzcygnb3ZlcmZsb3cteCcsICdzY3JvbGwnKTsKICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICBzY3JvbGxIZWFkLmNzcygnb3ZlcmZsb3cnLCBjc3NPdmVyZmxvd0hlYWQpOwogICAgICAgICAgICAgIHNjcm9sbEJvZHkuY3NzKCdvdmVyZmxvdycsIGNzc092ZXJmbG93Qm9keSk7CiAgICAgICAgICAgICAgc2Nyb2xsVGFibGUuY3NzKCdvdmVyZmxvdy14JywgY3NzT3ZlcmZsb3dUYWJsZSk7CiAgICAgICAgICAgIH0KICAgICAgICAgIH0pOwogICAgICAgICAgJHguY3NzKCd6LWluZGV4JywgMjUpOwogICAgICAgIH0KCiAgICAgICAgaWYgKGluQXJyYXkodHlwZSwgWydmYWN0b3InLCAnbG9naWNhbCddKSkgewogICAgICAgICAgJGlucHV0Lm9uKHsKICAgICAgICAgICAgY2xpY2s6IGZ1bmN0aW9uKCkgewogICAgICAgICAgICAgICRpbnB1dC5wYXJlbnQoKS5oaWRlKCk7ICR4LnNob3coKS50cmlnZ2VyKCdzaG93Jyk7IGZpbHRlclswXS5zZWxlY3RpemUuZm9jdXMoKTsKICAgICAgICAgICAgfSwKICAgICAgICAgICAgaW5wdXQ6IGZ1bmN0aW9uKCkgewogICAgICAgICAgICAgIHZhciB2MSA9IEpTT04uc3RyaW5naWZ5KGZpbHRlclswXS5zZWxlY3RpemUuZ2V0VmFsdWUoKSksIHYyID0gJGlucHV0LnZhbCgpOwogICAgICAgICAgICAgIGlmICh2MSA9PT0gJ1tdJykgdjEgPSAnJzsKICAgICAgICAgICAgICBpZiAodjEgIT09IHYyKSBmaWx0ZXJbMF0uc2VsZWN0aXplLnNldFZhbHVlKHYyID09PSAnJyA/IFtdIDogSlNPTi5wYXJzZSh2MikpOwogICAgICAgICAgICB9CiAgICAgICAgICB9KTsKICAgICAgICAgIHZhciAkaW5wdXQyID0gJHguY2hpbGRyZW4oJ3NlbGVjdCcpOwogICAgICAgICAgZmlsdGVyID0gJGlucHV0Mi5zZWxlY3RpemUoewogICAgICAgICAgICBvcHRpb25zOiAkaW5wdXQyLmRhdGEoJ29wdGlvbnMnKS5tYXAoZnVuY3Rpb24odiwgaSkgewogICAgICAgICAgICAgIHJldHVybiAoe3RleHQ6IHYsIHZhbHVlOiB2fSk7CiAgICAgICAgICAgIH0pLAogICAgICAgICAgICBwbHVnaW5zOiBbJ3JlbW92ZV9idXR0b24nXSwKICAgICAgICAgICAgaGlkZVNlbGVjdGVkOiB0cnVlLAogICAgICAgICAgICBvbkNoYW5nZTogZnVuY3Rpb24odmFsdWUpIHsKICAgICAgICAgICAgICBpZiAodmFsdWUgPT09IG51bGwpIHZhbHVlID0gW107IC8vIGNvbXBhdGliaWxpdHkgd2l0aCBqUXVlcnkgMy4wCiAgICAgICAgICAgICAgJGlucHV0LnZhbCh2YWx1ZS5sZW5ndGggPyBKU09OLnN0cmluZ2lmeSh2YWx1ZSkgOiAnJyk7CiAgICAgICAgICAgICAgaWYgKHZhbHVlLmxlbmd0aCkgJGlucHV0LnRyaWdnZXIoJ2lucHV0Jyk7CiAgICAgICAgICAgICAgJGlucHV0LmF0dHIoJ3RpdGxlJywgJGlucHV0LnZhbCgpKTsKICAgICAgICAgICAgICBpZiAoc2VydmVyKSB7CiAgICAgICAgICAgICAgICB0YWJsZS5jb2x1bW4oaSkuc2VhcmNoKHZhbHVlLmxlbmd0aCA/IEpTT04uc3RyaW5naWZ5KHZhbHVlKSA6ICcnKS5kcmF3KCk7CiAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIC8vIHR1cm4gb2ZmIGZpbHRlciBpZiBub3RoaW5nIHNlbGVjdGVkCiAgICAgICAgICAgICAgJHRkLmRhdGEoJ2ZpbHRlcicsIHZhbHVlLmxlbmd0aCA+IDApOwogICAgICAgICAgICAgIHRhYmxlLmRyYXcoKTsgIC8vIHJlZHJhdyB0YWJsZSwgYW5kIGZpbHRlcnMgd2lsbCBiZSBhcHBsaWVkCiAgICAgICAgICAgIH0KICAgICAgICAgIH0pOwogICAgICAgICAgaWYgKHNlYXJjaENvbCkgZmlsdGVyWzBdLnNlbGVjdGl6ZS5zZXRWYWx1ZShKU09OLnBhcnNlKHNlYXJjaENvbCkpOwogICAgICAgICAgZmlsdGVyWzBdLnNlbGVjdGl6ZS5vbignYmx1cicsIGZ1bmN0aW9uKCkgewogICAgICAgICAgICAkeC5oaWRlKCkudHJpZ2dlcignaGlkZScpOyAkaW5wdXQucGFyZW50KCkuc2hvdygpOyAkaW5wdXQudHJpZ2dlcignYmx1cicpOwogICAgICAgICAgfSk7CiAgICAgICAgICBmaWx0ZXIubmV4dCgnZGl2JykuY3NzKCdtYXJnaW4tYm90dG9tJywgJ2F1dG8nKTsKICAgICAgICB9IGVsc2UgaWYgKHR5cGUgPT09ICdjaGFyYWN0ZXInKSB7CiAgICAgICAgICB2YXIgZnVuID0gZnVuY3Rpb24oKSB7CiAgICAgICAgICAgIHNlYXJjaENvbHVtbihpLCAkaW5wdXQudmFsKCkpLmRyYXcoKTsKICAgICAgICAgIH07CiAgICAgICAgICBpZiAoc2VydmVyKSB7CiAgICAgICAgICAgIGZ1biA9ICQuZm4uZGF0YVRhYmxlLnV0aWwudGhyb3R0bGUoZnVuLCBvcHRpb25zLnNlYXJjaERlbGF5KTsKICAgICAgICAgIH0KICAgICAgICAgICRpbnB1dC5vbignaW5wdXQnLCBmdW4pOwogICAgICAgIH0gZWxzZSBpZiAoaW5BcnJheSh0eXBlLCBbJ251bWJlcicsICdpbnRlZ2VyJywgJ2RhdGUnLCAndGltZSddKSkgewogICAgICAgICAgdmFyICR4MCA9ICR4OwogICAgICAgICAgJHggPSAkeDAuY2hpbGRyZW4oJ2RpdicpLmZpcnN0KCk7CiAgICAgICAgICAkeDAuY3NzKHsKICAgICAgICAgICAgJ2JhY2tncm91bmQtY29sb3InOiAnI2ZmZicsCiAgICAgICAgICAgICdib3JkZXInOiAnMXB4ICNkZGQgc29saWQnLAogICAgICAgICAgICAnYm9yZGVyLXJhZGl1cyc6ICc0cHgnLAogICAgICAgICAgICAncGFkZGluZyc6IGRhdGEudmVydGljYWwgPyAnMzVweCAyMHB4JzogJzIwcHggMjBweCAxMHB4IDIwcHgnCiAgICAgICAgICB9KTsKICAgICAgICAgIHZhciAkc3BhbnMgPSAkeDAuY2hpbGRyZW4oJ3NwYW4nKS5jc3MoewogICAgICAgICAgICAnbWFyZ2luLXRvcCc6IGRhdGEudmVydGljYWwgPyAnMCcgOiAnMTBweCcsCiAgICAgICAgICAgICd3aGl0ZS1zcGFjZSc6ICdub3dyYXAnCiAgICAgICAgICB9KTsKICAgICAgICAgIHZhciAkc3BhbjEgPSAkc3BhbnMuZmlyc3QoKSwgJHNwYW4yID0gJHNwYW5zLmxhc3QoKTsKICAgICAgICAgIHZhciByMSA9ICskeC5kYXRhKCdtaW4nKSwgcjIgPSArJHguZGF0YSgnbWF4Jyk7CiAgICAgICAgICAvLyB3aGVuIHRoZSBudW1iZXJzIGFyZSB0b28gc21hbGwgb3IgaGF2ZSBtYW55IGRlY2ltYWwgcGxhY2VzLCB0aGUKICAgICAgICAgIC8vIHNsaWRlciBtYXkgaGF2ZSBudW1lcmljIHByZWNpc2lvbiBwcm9ibGVtcyAoIzE1MCkKICAgICAgICAgIHZhciBzY2FsZSA9IE1hdGgucG93KDEwLCBNYXRoLm1heCgwLCArJHguZGF0YSgnc2NhbGUnKSB8fCAwKSk7CiAgICAgICAgICByMSA9IE1hdGgucm91bmQocjEgKiBzY2FsZSk7IHIyID0gTWF0aC5yb3VuZChyMiAqIHNjYWxlKTsKICAgICAgICAgIHZhciBzY2FsZUJhY2sgPSBmdW5jdGlvbih4LCBzY2FsZSkgewogICAgICAgICAgICBpZiAoc2NhbGUgPT09IDEpIHJldHVybiB4OwogICAgICAgICAgICB2YXIgZCA9IE1hdGgucm91bmQoTWF0aC5sb2coc2NhbGUpIC8gTWF0aC5sb2coMTApKTsKICAgICAgICAgICAgLy8gdG8gYXZvaWQgcHJvYmxlbXMgbGlrZSAzLjQyMy8xMDAgLT4gMC4wMzQyMzAwMDAwMDAwMDAwMDMKICAgICAgICAgICAgcmV0dXJuICh4IC8gc2NhbGUpLnRvRml4ZWQoZCk7CiAgICAgICAgICB9OwogICAgICAgICAgdmFyIHNsaWRlcl9taW4gPSBmdW5jdGlvbigpIHsKICAgICAgICAgICAgcmV0dXJuIGZpbHRlci5ub1VpU2xpZGVyKCdvcHRpb25zJykucmFuZ2UubWluOwogICAgICAgICAgfTsKICAgICAgICAgIHZhciBzbGlkZXJfbWF4ID0gZnVuY3Rpb24oKSB7CiAgICAgICAgICAgIHJldHVybiBmaWx0ZXIubm9VaVNsaWRlcignb3B0aW9ucycpLnJhbmdlLm1heDsKICAgICAgICAgIH07CiAgICAgICAgICAkaW5wdXQub24oewogICAgICAgICAgICBmb2N1czogZnVuY3Rpb24oKSB7CiAgICAgICAgICAgICAgJHgwLnNob3coKS50cmlnZ2VyKCdzaG93Jyk7CiAgICAgICAgICAgICAgLy8gZmlyc3QsIG1ha2Ugc3VyZSB0aGUgc2xpZGVyIGRpdiBsZWF2ZXMgYXQgbGVhc3QgMjBweCBiZXR3ZWVuCiAgICAgICAgICAgICAgLy8gdGhlIHR3byAoc2xpZGVyIHZhbHVlKSBzcGFuJ3MKICAgICAgICAgICAgICAkeDAud2lkdGgoTWF0aC5tYXgoMTYwLCAkc3BhbjEub3V0ZXJXaWR0aCgpICsgJHNwYW4yLm91dGVyV2lkdGgoKSArIDIwKSk7CiAgICAgICAgICAgICAgLy8gdGhlbiwgaWYgdGhlIGlucHV0IGlzIHJlYWxseSB3aWRlIG9yIHNsaWRlciBpcyB2ZXJ0aWNhbCwKICAgICAgICAgICAgICAvLyBtYWtlIHRoZSBzbGlkZXIgdGhlIHNhbWUgd2lkdGggYXMgdGhlIGlucHV0CiAgICAgICAgICAgICAgaWYgKCR4MC5vdXRlcldpZHRoKCkgPCAkaW5wdXQub3V0ZXJXaWR0aCgpIHx8IGRhdGEudmVydGljYWwpIHsKICAgICAgICAgICAgICAgICR4MC5vdXRlcldpZHRoKCRpbnB1dC5vdXRlcldpZHRoKCkpOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgICAvLyBtYWtlIHN1cmUgdGhlIHNsaWRlciBkaXYgZG9lcyBub3QgcmVhY2ggYmV5b25kIHRoZSByaWdodCBtYXJnaW4KICAgICAgICAgICAgICBpZiAoJCh3aW5kb3cpLndpZHRoKCkgPCAkeDAub2Zmc2V0KCkubGVmdCArICR4MC53aWR0aCgpKSB7CiAgICAgICAgICAgICAgICAkeDAub2Zmc2V0KHsKICAgICAgICAgICAgICAgICAgJ2xlZnQnOiAkaW5wdXQub2Zmc2V0KCkubGVmdCArICRpbnB1dC5vdXRlcldpZHRoKCkgLSAkeDAub3V0ZXJXaWR0aCgpCiAgICAgICAgICAgICAgICB9KTsKICAgICAgICAgICAgICB9CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgIGJsdXI6IGZ1bmN0aW9uKCkgewogICAgICAgICAgICAgICR4MC5oaWRlKCkudHJpZ2dlcignaGlkZScpOwogICAgICAgICAgICB9LAogICAgICAgICAgICBpbnB1dDogZnVuY3Rpb24oKSB7CiAgICAgICAgICAgICAgaWYgKCRpbnB1dC52YWwoKSA9PT0gJycpIGZpbHRlci52YWwoW3NsaWRlcl9taW4oKSwgc2xpZGVyX21heCgpXSk7CiAgICAgICAgICAgIH0sCiAgICAgICAgICAgIGNoYW5nZTogZnVuY3Rpb24oKSB7CiAgICAgICAgICAgICAgdmFyIHYgPSAkaW5wdXQudmFsKCkucmVwbGFjZSgvXHMvZywgJycpOwogICAgICAgICAgICAgIGlmICh2ID09PSAnJykgcmV0dXJuOwogICAgICAgICAgICAgIHYgPSB2LnNwbGl0KCcuLi4nKTsKICAgICAgICAgICAgICBpZiAodi5sZW5ndGggIT09IDIpIHsKICAgICAgICAgICAgICAgICRpbnB1dC5wYXJlbnQoKS5hZGRDbGFzcygnaGFzLWVycm9yJyk7CiAgICAgICAgICAgICAgICByZXR1cm47CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIGlmICh2WzBdID09PSAnJykgdlswXSA9IHNsaWRlcl9taW4oKTsKICAgICAgICAgICAgICBpZiAodlsxXSA9PT0gJycpIHZbMV0gPSBzbGlkZXJfbWF4KCk7CiAgICAgICAgICAgICAgJGlucHV0LnBhcmVudCgpLnJlbW92ZUNsYXNzKCdoYXMtZXJyb3InKTsKICAgICAgICAgICAgICAvLyB0cmVhdCBkYXRlIGFzIFVUQyB0aW1lIGF0IG1pZG5pZ2h0CiAgICAgICAgICAgICAgdmFyIHN0clRpbWUgPSBmdW5jdGlvbih4KSB7CiAgICAgICAgICAgICAgICB2YXIgcyA9IHR5cGUgPT09ICdkYXRlJyA/ICdUMDA6MDA6MDBaJyA6ICcnOwogICAgICAgICAgICAgICAgdmFyIHQgPSBuZXcgRGF0ZSh4ICsgcykuZ2V0VGltZSgpOwogICAgICAgICAgICAgICAgLy8gYWRkIDEwIG1pbnV0ZXMgdG8gZGF0ZSBzaW5jZSBpdCBkb2VzIG5vdCBodXJ0IHRoZSBkYXRlLCBhbmQKICAgICAgICAgICAgICAgIC8vIGl0IGhlbHBzIGF2b2lkIHRoZSB0cmlja3kgZmxvYXRpbmcgcG9pbnQgYXJpdGhtZXRpYyBwcm9ibGVtcywKICAgICAgICAgICAgICAgIC8vIGUuZy4gc29tZXRpbWVzIHRoZSBkYXRlIG1heSBiZSBhIGZldyBtaWxsaXNlY29uZHMgZWFybGllcgogICAgICAgICAgICAgICAgLy8gdGhhbiB0aGUgbWlkbmlnaHQgZHVlIHRvIHByZWNpc2lvbiBwcm9ibGVtcyBpbiBub1VpU2xpZGVyCiAgICAgICAgICAgICAgICByZXR1cm4gdHlwZSA9PT0gJ2RhdGUnID8gdCArIDM2MDAwMDAgOiB0OwogICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgaWYgKGluQXJyYXkodHlwZSwgWydkYXRlJywgJ3RpbWUnXSkpIHsKICAgICAgICAgICAgICAgIHZbMF0gPSBzdHJUaW1lKHZbMF0pOwogICAgICAgICAgICAgICAgdlsxXSA9IHN0clRpbWUodlsxXSk7CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIGlmICh2WzBdICE9IHNsaWRlcl9taW4oKSkgdlswXSAqPSBzY2FsZTsKICAgICAgICAgICAgICBpZiAodlsxXSAhPSBzbGlkZXJfbWF4KCkpIHZbMV0gKj0gc2NhbGU7CiAgICAgICAgICAgICAgZmlsdGVyLnZhbCh2KTsKICAgICAgICAgICAgfQogICAgICAgICAgfSk7CiAgICAgICAgICB2YXIgZm9ybWF0RGF0ZSA9IGZ1bmN0aW9uKGQsIGlzb0ZtdCkgewogICAgICAgICAgICBkID0gc2NhbGVCYWNrKGQsIHNjYWxlKTsKICAgICAgICAgICAgaWYgKHR5cGUgPT09ICdudW1iZXInKSByZXR1cm4gZDsKICAgICAgICAgICAgaWYgKHR5cGUgPT09ICdpbnRlZ2VyJykgcmV0dXJuIHBhcnNlSW50KGQpOwogICAgICAgICAgICB2YXIgeCA9IG5ldyBEYXRlKCtkKTsKICAgICAgICAgICAgdmFyIGZtdCA9ICgnZmlsdGVyRGF0ZUZtdCcgaW4gZGF0YSkgPyBkYXRhLmZpbHRlckRhdGVGbXRbaV0gOiB1bmRlZmluZWQ7CiAgICAgICAgICAgIGlmIChmbXQgIT09IHVuZGVmaW5lZCAmJiBpc29GbXQgPT09IGZhbHNlKSByZXR1cm4geFtmbXQubWV0aG9kXS5hcHBseSh4LCBmbXQucGFyYW1zKTsKICAgICAgICAgICAgaWYgKHR5cGUgPT09ICdkYXRlJykgewogICAgICAgICAgICAgIHZhciBwYWQwID0gZnVuY3Rpb24oeCkgewogICAgICAgICAgICAgICAgcmV0dXJuICgnMCcgKyB4KS5zdWJzdHIoLTIsIDIpOwogICAgICAgICAgICAgIH07CiAgICAgICAgICAgICAgcmV0dXJuIHguZ2V0VVRDRnVsbFllYXIoKSArICctJyArIHBhZDAoMSArIHguZ2V0VVRDTW9udGgoKSkKICAgICAgICAgICAgICAgICAgICAgICsgJy0nICsgcGFkMCh4LmdldFVUQ0RhdGUoKSk7CiAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgcmV0dXJuIHgudG9JU09TdHJpbmcoKTsKICAgICAgICAgICAgfQogICAgICAgICAgfTsKICAgICAgICAgIHZhciBvcHRzID0gdHlwZSA9PT0gJ2RhdGUnID8geyBzdGVwOiA2MCAqIDYwICogMTAwMCB9IDoKICAgICAgICAgICAgICAgICAgICAgdHlwZSA9PT0gJ2ludGVnZXInID8geyBzdGVwOiAxIH0gOiB7fTsKCiAgICAgICAgICBvcHRzLm9yaWVudGF0aW9uID0gZGF0YS52ZXJ0aWNhbCA/ICd2ZXJ0aWNhbCc6ICdob3Jpem9udGFsJzsKICAgICAgICAgIG9wdHMuZGlyZWN0aW9uID0gZGF0YS52ZXJ0aWNhbCA/ICdydGwnOiAnbHRyJzsKCiAgICAgICAgICBmaWx0ZXIgPSAkeC5ub1VpU2xpZGVyKCQuZXh0ZW5kKHsKICAgICAgICAgICAgc3RhcnQ6IFtyMSwgcjJdLAogICAgICAgICAgICByYW5nZToge21pbjogcjEsIG1heDogcjJ9LAogICAgICAgICAgICBjb25uZWN0OiB0cnVlCiAgICAgICAgICB9LCBvcHRzKSk7CiAgICAgICAgICBpZiAoc2NhbGUgPiAxKSAoZnVuY3Rpb24oKSB7CiAgICAgICAgICAgIHZhciB0MSA9IHIxLCB0MiA9IHIyOwogICAgICAgICAgICB2YXIgdmFsID0gZmlsdGVyLnZhbCgpOwogICAgICAgICAgICB3aGlsZSAodmFsWzBdID4gcjEgfHwgdmFsWzFdIDwgcjIpIHsKICAgICAgICAgICAgICBpZiAodmFsWzBdID4gcjEpIHsKICAgICAgICAgICAgICAgIHQxIC09IHZhbFswXSAtIHIxOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgICBpZiAodmFsWzFdIDwgcjIpIHsKICAgICAgICAgICAgICAgIHQyICs9IHIyIC0gdmFsWzFdOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgICBmaWx0ZXIgPSAkeC5ub1VpU2xpZGVyKCQuZXh0ZW5kKHsKICAgICAgICAgICAgICAgIHN0YXJ0OiBbdDEsIHQyXSwKICAgICAgICAgICAgICAgIHJhbmdlOiB7bWluOiB0MSwgbWF4OiB0Mn0sCiAgICAgICAgICAgICAgICBjb25uZWN0OiB0cnVlCiAgICAgICAgICAgICAgfSwgb3B0cyksIHRydWUpOwogICAgICAgICAgICAgIHZhbCA9IGZpbHRlci52YWwoKTsKICAgICAgICAgICAgfQogICAgICAgICAgICByMSAgPSB0MTsgcjIgPSB0MjsKICAgICAgICAgIH0pKCk7CiAgICAgICAgICB2YXIgdXBkYXRlU2xpZGVyVGV4dCA9IGZ1bmN0aW9uKHYxLCB2MikgewogICAgICAgICAgICAkc3BhbjEudGV4dChmb3JtYXREYXRlKHYxLCBmYWxzZSkpOyAkc3BhbjIudGV4dChmb3JtYXREYXRlKHYyLCBmYWxzZSkpOwogICAgICAgICAgfTsKICAgICAgICAgIHVwZGF0ZVNsaWRlclRleHQocjEsIHIyKTsKICAgICAgICAgIHZhciB1cGRhdGVTbGlkZXIgPSBmdW5jdGlvbihlKSB7CiAgICAgICAgICAgIHZhciB2YWwgPSBmaWx0ZXIudmFsKCk7CiAgICAgICAgICAgIC8vIHR1cm4gb2ZmIGZpbHRlciBpZiBpbiBmdWxsIHJhbmdlCiAgICAgICAgICAgICR0ZC5kYXRhKCdmaWx0ZXInLCB2YWxbMF0gPiBzbGlkZXJfbWluKCkgfHwgdmFsWzFdIDwgc2xpZGVyX21heCgpKTsKICAgICAgICAgICAgdmFyIHYxID0gZm9ybWF0RGF0ZSh2YWxbMF0pLCB2MiA9IGZvcm1hdERhdGUodmFsWzFdKSwgaXZhbDsKICAgICAgICAgICAgaWYgKCR0ZC5kYXRhKCdmaWx0ZXInKSkgewogICAgICAgICAgICAgIGl2YWwgPSB2MSArICcgLi4uICcgKyB2MjsKICAgICAgICAgICAgICAkaW5wdXQuYXR0cigndGl0bGUnLCBpdmFsKS52YWwoaXZhbCkudHJpZ2dlcignaW5wdXQnKTsKICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAkaW5wdXQuYXR0cigndGl0bGUnLCAnJykudmFsKCcnKTsKICAgICAgICAgICAgfQogICAgICAgICAgICB1cGRhdGVTbGlkZXJUZXh0KHZhbFswXSwgdmFsWzFdKTsKICAgICAgICAgICAgaWYgKGUudHlwZSA9PT0gJ3NsaWRlJykgcmV0dXJuOyAgLy8gbm8gc2VhcmNoaW5nIHdoZW4gc2xpZGluZyBvbmx5CiAgICAgICAgICAgIGlmIChzZXJ2ZXIpIHsKICAgICAgICAgICAgICB0YWJsZS5jb2x1bW4oaSkuc2VhcmNoKCR0ZC5kYXRhKCdmaWx0ZXInKSA/IGl2YWwgOiAnJykuZHJhdygpOwogICAgICAgICAgICAgIHJldHVybjsKICAgICAgICAgICAgfQogICAgICAgICAgICB0YWJsZS5kcmF3KCk7CiAgICAgICAgICB9OwogICAgICAgICAgZmlsdGVyLm9uKHsKICAgICAgICAgICAgc2V0OiB1cGRhdGVTbGlkZXIsCiAgICAgICAgICAgIHNsaWRlOiB1cGRhdGVTbGlkZXIKICAgICAgICAgIH0pOwogICAgICAgIH0KCiAgICAgICAgLy8gc2VydmVyLXNpZGUgcHJvY2Vzc2luZyB3aWxsIGJlIGhhbmRsZWQgYnkgUiAob3Igd2hhdGV2ZXIgc2VydmVyCiAgICAgICAgLy8gbGFuZ3VhZ2UgeW91IHVzZSk7IHRoZSBmb2xsb3dpbmcgY29kZSBpcyBvbmx5IG5lZWRlZCBmb3IgY2xpZW50LXNpZGUKICAgICAgICAvLyBwcm9jZXNzaW5nCiAgICAgICAgaWYgKHNlcnZlcikgewogICAgICAgICAgLy8gaWYgYSBzZWFyY2ggc3RyaW5nIGhhcyBiZWVuIHByZS1zZXQsIHNlYXJjaCBub3cKICAgICAgICAgIGlmIChzZWFyY2hDb2wpIHNlYXJjaENvbHVtbihpLCBzZWFyY2hDb2wpLmRyYXcoKTsKICAgICAgICAgIHJldHVybjsKICAgICAgICB9CgogICAgICAgIHZhciBjdXN0b21GaWx0ZXIgPSBmdW5jdGlvbihzZXR0aW5ncywgZGF0YSwgZGF0YUluZGV4KSB7CiAgICAgICAgICAvLyB0aGVyZSBpcyBubyB3YXkgdG8gYXR0YWNoIGEgc2VhcmNoIGZ1bmN0aW9uIHRvIGEgc3BlY2lmaWMgdGFibGUsCiAgICAgICAgICAvLyBhbmQgd2UgbmVlZCB0byBtYWtlIHN1cmUgYSBnbG9iYWwgc2VhcmNoIGZ1bmN0aW9uIGlzIG5vdCBhcHBsaWVkIHRvCiAgICAgICAgICAvLyBhbGwgdGFibGVzIChpLmUuIGEgcmFuZ2UgZmlsdGVyIGluIGEgcHJldmlvdXMgdGFibGUgc2hvdWxkIG5vdCBiZQogICAgICAgICAgLy8gYXBwbGllZCB0byB0aGUgY3VycmVudCB0YWJsZSk7IHdlIHVzZSB0aGUgc2V0dGluZ3Mgb2JqZWN0IHRvCiAgICAgICAgICAvLyBkZXRlcm1pbmUgaWYgd2Ugd2FudCB0byBwZXJmb3JtIHNlYXJjaGluZyBvbiB0aGUgY3VycmVudCB0YWJsZSwKICAgICAgICAgIC8vIHNpbmNlIHNldHRpbmdzLnNUYWJsZUlkIHdpbGwgYmUgZGlmZmVyZW50IHRvIGRpZmZlcmVudCB0YWJsZXMKICAgICAgICAgIGlmICh0YWJsZS5zZXR0aW5ncygpWzBdICE9PSBzZXR0aW5ncykgcmV0dXJuIHRydWU7CiAgICAgICAgICAvLyBubyBmaWx0ZXIgb24gdGhpcyBjb2x1bW4gb3Igbm8gbmVlZCB0byBmaWx0ZXIgdGhpcyBjb2x1bW4KICAgICAgICAgIGlmICh0eXBlb2YgZmlsdGVyID09PSAndW5kZWZpbmVkJyB8fCAhJHRkLmRhdGEoJ2ZpbHRlcicpKSByZXR1cm4gdHJ1ZTsKCiAgICAgICAgICB2YXIgciA9IGZpbHRlci52YWwoKSwgdiwgcjAsIHIxOwogICAgICAgICAgdmFyIGlfZGF0YSA9IGZ1bmN0aW9uKGkpIHsKICAgICAgICAgICAgaWYgKCFjb2xSZW9yZGVyRW5hYmxlZCgpKSByZXR1cm4gaTsKICAgICAgICAgICAgdmFyIG9yZGVyID0gdGFibGUuY29sUmVvcmRlci5vcmRlcigpLCBrOwogICAgICAgICAgICBmb3IgKGsgPSAwOyBrIDwgb3JkZXIubGVuZ3RoOyArK2spIGlmIChvcmRlcltrXSA9PT0gaSkgcmV0dXJuIGs7CiAgICAgICAgICAgIHJldHVybiBpOyAvLyBpbiB0aGVvcnkgaXQgd2lsbCBuZXZlciBiZSBoZXJlLi4uCiAgICAgICAgICB9CiAgICAgICAgICB2ID0gZGF0YVtpX2RhdGEoaSldOwogICAgICAgICAgaWYgKHR5cGUgPT09ICdudW1iZXInIHx8IHR5cGUgPT09ICdpbnRlZ2VyJykgewogICAgICAgICAgICB2ID0gcGFyc2VGbG9hdCh2KTsKICAgICAgICAgICAgLy8gaG93IHRvIGhhbmRsZSBOYU4/IGN1cnJlbnRseSBleGNsdWRlIHRoZXNlIHJvd3MKICAgICAgICAgICAgaWYgKGlzTmFOKHYpKSByZXR1cm4oZmFsc2UpOwogICAgICAgICAgICByMCA9IHBhcnNlRmxvYXQoc2NhbGVCYWNrKHJbMF0sIHNjYWxlKSkKICAgICAgICAgICAgcjEgPSBwYXJzZUZsb2F0KHNjYWxlQmFjayhyWzFdLCBzY2FsZSkpOwogICAgICAgICAgICBpZiAodiA+PSByMCAmJiB2IDw9IHIxKSByZXR1cm4gdHJ1ZTsKICAgICAgICAgIH0gZWxzZSBpZiAodHlwZSA9PT0gJ2RhdGUnIHx8IHR5cGUgPT09ICd0aW1lJykgewogICAgICAgICAgICB2ID0gbmV3IERhdGUodik7CiAgICAgICAgICAgIHIwID0gbmV3IERhdGUoclswXSAvIHNjYWxlKTsgcjEgPSBuZXcgRGF0ZShyWzFdIC8gc2NhbGUpOwogICAgICAgICAgICBpZiAodiA+PSByMCAmJiB2IDw9IHIxKSByZXR1cm4gdHJ1ZTsKICAgICAgICAgIH0gZWxzZSBpZiAodHlwZSA9PT0gJ2ZhY3RvcicpIHsKICAgICAgICAgICAgaWYgKHIubGVuZ3RoID09PSAwIHx8IGluQXJyYXkodiwgcikpIHJldHVybiB0cnVlOwogICAgICAgICAgfSBlbHNlIGlmICh0eXBlID09PSAnbG9naWNhbCcpIHsKICAgICAgICAgICAgaWYgKHIubGVuZ3RoID09PSAwKSByZXR1cm4gdHJ1ZTsKICAgICAgICAgICAgaWYgKGluQXJyYXkodiA9PT0gJycgPyAnbmEnIDogdiwgcikpIHJldHVybiB0cnVlOwogICAgICAgICAgfQogICAgICAgICAgcmV0dXJuIGZhbHNlOwogICAgICAgIH07CgogICAgICAgICQuZm4uZGF0YVRhYmxlLmV4dC5zZWFyY2gucHVzaChjdXN0b21GaWx0ZXIpOwoKICAgICAgICAvLyBzZWFyY2ggZm9yIHRoZSBwcmVzZXQgc2VhcmNoIHN0cmluZ3MgaWYgaXQgaXMgbm9uLWVtcHR5CiAgICAgICAgaWYgKHNlYXJjaENvbCkgewogICAgICAgICAgaWYgKGluQXJyYXkodHlwZSwgWydmYWN0b3InLCAnbG9naWNhbCddKSkgewogICAgICAgICAgICBmaWx0ZXJbMF0uc2VsZWN0aXplLnNldFZhbHVlKEpTT04ucGFyc2Uoc2VhcmNoQ29sKSk7CiAgICAgICAgICB9IGVsc2UgaWYgKHR5cGUgPT09ICdjaGFyYWN0ZXInKSB7CiAgICAgICAgICAgICRpbnB1dC50cmlnZ2VyKCdpbnB1dCcpOwogICAgICAgICAgfSBlbHNlIGlmIChpbkFycmF5KHR5cGUsIFsnbnVtYmVyJywgJ2ludGVnZXInLCAnZGF0ZScsICd0aW1lJ10pKSB7CiAgICAgICAgICAgICRpbnB1dC50cmlnZ2VyKCdjaGFuZ2UnKTsKICAgICAgICAgIH0KICAgICAgICB9CgogICAgICB9KTsKCiAgICB9CgogICAgLy8gaGlnaGxpZ2h0IHNlYXJjaCBrZXl3b3JkcwogICAgdmFyIGhpZ2hsaWdodCA9IGZ1bmN0aW9uKCkgewogICAgICB2YXIgYm9keSA9ICQodGFibGUudGFibGUoKS5ib2R5KCkpOwogICAgICAvLyByZW1vdmluZyB0aGUgb2xkIGhpZ2hsaWdodGluZyBmaXJzdAogICAgICBib2R5LnVuaGlnaGxpZ2h0KCk7CgogICAgICAvLyBkb24ndCBoaWdobGlnaHQgdGhlICJub3QgZm91bmQiIHJvdywgc28gd2UgZ2V0IHRoZSByb3dzIHVzaW5nIHRoZSBhcGkKICAgICAgaWYgKHRhYmxlLnJvd3MoeyBmaWx0ZXI6ICdhcHBsaWVkJyB9KS5kYXRhKCkubGVuZ3RoID09PSAwKSByZXR1cm47CiAgICAgIC8vIGhpZ2hsaWdodCBnbG9iYWwgc2VhcmNoIGtleXdvcmRzCiAgICAgIGJvZHkuaGlnaGxpZ2h0KCQudHJpbSh0YWJsZS5zZWFyY2goKSkuc3BsaXQoL1xzKy8pKTsKICAgICAgLy8gdGhlbiBoaWdobGlnaHQga2V5d29yZHMgZnJvbSBpbmRpdmlkdWFsIGNvbHVtbiBmaWx0ZXJzCiAgICAgIGlmIChmaWx0ZXJSb3cpIGZpbHRlclJvdy5lYWNoKGZ1bmN0aW9uKGksIHRkKSB7CiAgICAgICAgdmFyICR0ZCA9ICQodGQpLCB0eXBlID0gJHRkLmRhdGEoJ3R5cGUnKTsKICAgICAgICBpZiAodHlwZSAhPT0gJ2NoYXJhY3RlcicpIHJldHVybjsKICAgICAgICB2YXIgJGlucHV0ID0gJHRkLmNoaWxkcmVuKCdkaXYnKS5maXJzdCgpLmNoaWxkcmVuKCdpbnB1dCcpOwogICAgICAgIHZhciBjb2x1bW4gPSB0YWJsZS5jb2x1bW4oaSkubm9kZXMoKS50byQoKSwKICAgICAgICAgICAgdmFsID0gJC50cmltKCRpbnB1dC52YWwoKSk7CiAgICAgICAgaWYgKHR5cGUgIT09ICdjaGFyYWN0ZXInIHx8IHZhbCA9PT0gJycpIHJldHVybjsKICAgICAgICBjb2x1bW4uaGlnaGxpZ2h0KHZhbC5zcGxpdCgvXHMrLykpOwogICAgICB9KTsKICAgIH07CgogICAgaWYgKG9wdGlvbnMuc2VhcmNoSGlnaGxpZ2h0KSB7CiAgICAgIHRhYmxlCiAgICAgIC5vbignZHJhdy5kdC5kdGggY29sdW1uLXZpc2liaWxpdHkuZHQuZHRoIGNvbHVtbi1yZW9yZGVyLmR0LmR0aCcsIGhpZ2hsaWdodCkKICAgICAgLm9uKCdkZXN0cm95JywgZnVuY3Rpb24oKSB7CiAgICAgICAgLy8gcmVtb3ZlIGV2ZW50IGhhbmRsZXIKICAgICAgICB0YWJsZS5vZmYoJ2RyYXcuZHQuZHRoIGNvbHVtbi12aXNpYmlsaXR5LmR0LmR0aCBjb2x1bW4tcmVvcmRlci5kdC5kdGgnKTsKICAgICAgfSk7CgogICAgICAvLyBTZXQgdGhlIG9wdGlvbiBmb3IgZXNjYXBpbmcgcmVnZXggY2hhcmFjdGVycyBpbiBvdXIgc2VhcmNoIHN0cmluZy4gIFRoaXMgd2lsbCBiZSB1c2VkCiAgICAgIC8vIGZvciBhbGwgZnV0dXJlIG1hdGNoaW5nLgogICAgICBqUXVlcnkuZm4uaGlnaGxpZ2h0Lm9wdGlvbnMuZXNjYXBlUmVnZXggPSAoIW9wdGlvbnMuc2VhcmNoIHx8ICFvcHRpb25zLnNlYXJjaC5yZWdleCk7CgogICAgICAvLyBpbml0aWFsIGhpZ2hsaWdodCBmb3Igc3RhdGUgc2F2ZWQgY29uZGl0aW9ucyBhbmQgaW5pdGlhbCBzdGF0ZXMKICAgICAgaGlnaGxpZ2h0KCk7CiAgICB9CgogICAgLy8gcnVuIHRoZSBjYWxsYmFjayBmdW5jdGlvbiBvbiB0aGUgdGFibGUgaW5zdGFuY2UKICAgIGlmICh0eXBlb2YgZGF0YS5jYWxsYmFjayA9PT0gJ2Z1bmN0aW9uJykgZGF0YS5jYWxsYmFjayh0YWJsZSk7CgogICAgLy8gZG91YmxlIGNsaWNrIHRvIGVkaXQgdGhlIGNlbGwsIHJvdywgY29sdW1uLCBvciBhbGwgY2VsbHMKICAgIGlmIChkYXRhLmVkaXRhYmxlKSB0YWJsZS5vbignZGJsY2xpY2suZHQnLCAndGJvZHkgdGQnLCBmdW5jdGlvbihlKSB7CiAgICAgIC8vIG9ubHkgYnJpbmcgdXAgdGhlIGVkaXRvciB3aGVuIHRoZSBjZWxsIGl0c2VsZiBpcyBkYmNsaWNrZWQsIGFuZCBpZ25vcmUKICAgICAgLy8gb3RoZXIgZGJjbGljayBldmVudHMgYnViYmxlZCB1cCAoZS5nLiBmcm9tIHRoZSA8aW5wdXQ+KQogICAgICBpZiAoZS50YXJnZXQgIT09IHRoaXMpIHJldHVybjsKICAgICAgdmFyIHRhcmdldCA9IFtdLCBpbW1lZGlhdGUgPSBmYWxzZTsKICAgICAgc3dpdGNoIChkYXRhLmVkaXRhYmxlLnRhcmdldCkgewogICAgICAgIGNhc2UgJ2NlbGwnOgogICAgICAgICAgdGFyZ2V0ID0gW3RoaXNdOwogICAgICAgICAgaW1tZWRpYXRlID0gdHJ1ZTsgIC8vIGVkaXQgd2lsbCB0YWtlIGVmZmVjdCBpbW1lZGlhdGVseQogICAgICAgICAgYnJlYWs7CiAgICAgICAgY2FzZSAncm93JzoKICAgICAgICAgIHRhcmdldCA9IHRhYmxlLmNlbGxzKHRhYmxlLmNlbGwodGhpcykuaW5kZXgoKS5yb3csICcqJykubm9kZXMoKTsKICAgICAgICAgIGJyZWFrOwogICAgICAgIGNhc2UgJ2NvbHVtbic6CiAgICAgICAgICB0YXJnZXQgPSB0YWJsZS5jZWxscygnKicsIHRhYmxlLmNlbGwodGhpcykuaW5kZXgoKS5jb2x1bW4pLm5vZGVzKCk7CiAgICAgICAgICBicmVhazsKICAgICAgICBjYXNlICdhbGwnOgogICAgICAgICAgdGFyZ2V0ID0gdGFibGUuY2VsbHMoKS5ub2RlcygpOwogICAgICAgICAgYnJlYWs7CiAgICAgICAgZGVmYXVsdDoKICAgICAgICAgIHRocm93ICdUaGUgZWRpdGFibGUgcGFyYW1ldGVyIG11c3QgYmUgImNlbGwiLCAicm93IiwgImNvbHVtbiIsIG9yICJhbGwiJzsKICAgICAgfQogICAgICB2YXIgZGlzYWJsZUNvbHMgPSBkYXRhLmVkaXRhYmxlLmRpc2FibGUgPyBkYXRhLmVkaXRhYmxlLmRpc2FibGUuY29sdW1ucyA6IG51bGw7CiAgICAgIHZhciBudW1lcmljQ29scyA9IGRhdGEuZWRpdGFibGUubnVtZXJpYzsKICAgICAgdmFyIGFyZWFDb2xzID0gZGF0YS5lZGl0YWJsZS5hcmVhOwogICAgICB2YXIgZGF0ZUNvbHMgPSBkYXRhLmVkaXRhYmxlLmRhdGU7CiAgICAgIGZvciAodmFyIGkgPSAwOyBpIDwgdGFyZ2V0Lmxlbmd0aDsgaSsrKSB7CiAgICAgICAgKGZ1bmN0aW9uKGNlbGwsIGN1cnJlbnQpIHsKICAgICAgICAgIHZhciAkY2VsbCA9ICQoY2VsbCksIGh0bWwgPSAkY2VsbC5odG1sKCk7CiAgICAgICAgICB2YXIgX2NlbGwgPSB0YWJsZS5jZWxsKGNlbGwpLCB2YWx1ZSA9IF9jZWxsLmRhdGEoKSwgaW5kZXggPSBfY2VsbC5pbmRleCgpLmNvbHVtbjsKICAgICAgICAgIHZhciAkaW5wdXQ7CiAgICAgICAgICBpZiAoaW5BcnJheShpbmRleCwgbnVtZXJpY0NvbHMpKSB7CiAgICAgICAgICAgICRpbnB1dCA9ICQoJzxpbnB1dCB0eXBlPSJudW1iZXIiPicpOwogICAgICAgICAgfSBlbHNlIGlmIChpbkFycmF5KGluZGV4LCBhcmVhQ29scykpIHsKICAgICAgICAgICAgJGlucHV0ID0gJCgnPHRleHRhcmVhPjwvdGV4dGFyZWE+Jyk7CiAgICAgICAgICB9IGVsc2UgaWYgKGluQXJyYXkoaW5kZXgsIGRhdGVDb2xzKSkgewogICAgICAgICAgICAkaW5wdXQgPSAkKCc8aW5wdXQgdHlwZT0iZGF0ZSI+Jyk7CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAkaW5wdXQgPSAkKCc8aW5wdXQgdHlwZT0idGV4dCI+Jyk7CiAgICAgICAgICB9CiAgICAgICAgICBpZiAoIWltbWVkaWF0ZSkgewogICAgICAgICAgICAkY2VsbC5kYXRhKCdpbnB1dCcsICRpbnB1dCkuZGF0YSgnaHRtbCcsIGh0bWwpOwogICAgICAgICAgICAkaW5wdXQuYXR0cigndGl0bGUnLCAnSGl0IEN0cmwrRW50ZXIgdG8gZmluaXNoIGVkaXRpbmcsIG9yIEVzYyB0byBjYW5jZWwnKTsKICAgICAgICAgIH0KICAgICAgICAgICRpbnB1dC52YWwodmFsdWUpOwogICAgICAgICAgaWYgKGluQXJyYXkoaW5kZXgsIGRpc2FibGVDb2xzKSkgewogICAgICAgICAgICAkaW5wdXQuYXR0cigncmVhZG9ubHknLCAnJykuY3NzKCdmaWx0ZXInLCAnaW52ZXJ0KDI1JSknKTsKICAgICAgICAgIH0KICAgICAgICAgICRjZWxsLmVtcHR5KCkuYXBwZW5kKCRpbnB1dCk7CiAgICAgICAgICBpZiAoY2VsbCA9PT0gY3VycmVudCkgJGlucHV0LmZvY3VzKCk7CiAgICAgICAgICAkaW5wdXQuY3NzKCd3aWR0aCcsICcxMDAlJyk7CgogICAgICAgICAgaWYgKGltbWVkaWF0ZSkgJGlucHV0Lm9uKCdibHVyJywgZnVuY3Rpb24oZSkgewogICAgICAgICAgICB2YXIgdmFsdWVOZXcgPSAkaW5wdXQudmFsKCk7CiAgICAgICAgICAgIGlmICh2YWx1ZU5ldyAhPT0gdmFsdWUpIHsKICAgICAgICAgICAgICBfY2VsbC5kYXRhKHZhbHVlTmV3KTsKICAgICAgICAgICAgICBpZiAoSFRNTFdpZGdldHMuc2hpbnlNb2RlKSB7CiAgICAgICAgICAgICAgICBjaGFuZ2VJbnB1dCgnY2VsbF9lZGl0JywgW2NlbGxJbmZvKGNlbGwpXSwgJ0RULmNlbGxJbmZvJywgbnVsbCwge3ByaW9yaXR5OiAnZXZlbnQnfSk7CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIC8vIGZvciBzZXJ2ZXItc2lkZSBwcm9jZXNzaW5nLCB1c2VycyBoYXZlIHRvIGNhbGwgcmVwbGFjZURhdGEoKSB0byB1cGRhdGUgdGhlIHRhYmxlCiAgICAgICAgICAgICAgaWYgKCFzZXJ2ZXIpIHRhYmxlLmRyYXcoZmFsc2UpOwogICAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgICRjZWxsLmh0bWwoaHRtbCk7CiAgICAgICAgICAgIH0KICAgICAgICAgIH0pLm9uKCdrZXl1cCcsIGZ1bmN0aW9uKGUpIHsKICAgICAgICAgICAgLy8gaGl0IEVzY2FwZSB0byBjYW5jZWwgZWRpdGluZwogICAgICAgICAgICBpZiAoZS5rZXlDb2RlID09PSAyNykgJGlucHV0LnRyaWdnZXIoJ2JsdXInKTsKICAgICAgICAgIH0pOwoKICAgICAgICAgIC8vIGJ1bGsgZWRpdCAocm93LCBjb2x1bW4sIG9yIGFsbCkKICAgICAgICAgIGlmICghaW1tZWRpYXRlKSAkaW5wdXQub24oJ2tleXVwJywgZnVuY3Rpb24oZSkgewogICAgICAgICAgICB2YXIgcmVtb3ZlSW5wdXQgPSBmdW5jdGlvbigkY2VsbCwgcmVzdG9yZSkgewogICAgICAgICAgICAgICRjZWxsLmRhdGEoJ2lucHV0JykucmVtb3ZlKCk7CiAgICAgICAgICAgICAgaWYgKHJlc3RvcmUpICRjZWxsLmh0bWwoJGNlbGwuZGF0YSgnaHRtbCcpKTsKICAgICAgICAgICAgfQogICAgICAgICAgICBpZiAoZS5rZXlDb2RlID09PSAyNykgewogICAgICAgICAgICAgIGZvciAodmFyIGkgPSAwOyBpIDwgdGFyZ2V0Lmxlbmd0aDsgaSsrKSB7CiAgICAgICAgICAgICAgICByZW1vdmVJbnB1dCgkKHRhcmdldFtpXSksIHRydWUpOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgfSBlbHNlIGlmIChlLmtleUNvZGUgPT09IDEzICYmIGUuY3RybEtleSkgewogICAgICAgICAgICAgIC8vIEN0cmwgKyBFbnRlcgogICAgICAgICAgICAgIHZhciBjZWxsLCAkY2VsbCwgX2NlbGwsIGNlbGxEYXRhID0gW107CiAgICAgICAgICAgICAgZm9yICh2YXIgaSA9IDA7IGkgPCB0YXJnZXQubGVuZ3RoOyBpKyspIHsKICAgICAgICAgICAgICAgIGNlbGwgPSB0YXJnZXRbaV07ICRjZWxsID0gJChjZWxsKTsgX2NlbGwgPSB0YWJsZS5jZWxsKGNlbGwpOwogICAgICAgICAgICAgICAgX2NlbGwuZGF0YSgkY2VsbC5kYXRhKCdpbnB1dCcpLnZhbCgpKTsKICAgICAgICAgICAgICAgIEhUTUxXaWRnZXRzLnNoaW55TW9kZSAmJiBjZWxsRGF0YS5wdXNoKGNlbGxJbmZvKGNlbGwpKTsKICAgICAgICAgICAgICAgIHJlbW92ZUlucHV0KCRjZWxsLCBmYWxzZSk7CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIGlmIChIVE1MV2lkZ2V0cy5zaGlueU1vZGUpIHsKICAgICAgICAgICAgICAgIGNoYW5nZUlucHV0KCdjZWxsX2VkaXQnLCBjZWxsRGF0YSwgJ0RULmNlbGxJbmZvJywgbnVsbCwge3ByaW9yaXR5OiAiZXZlbnQifSk7CiAgICAgICAgICAgICAgfQogICAgICAgICAgICAgIGlmICghc2VydmVyKSB0YWJsZS5kcmF3KGZhbHNlKTsKICAgICAgICAgICAgfQogICAgICAgICAgfSk7CiAgICAgICAgfSkodGFyZ2V0W2ldLCB0aGlzKTsKICAgICAgfQogICAgfSk7CgogICAgLy8gaW50ZXJhY3Rpb24gd2l0aCBzaGlueQogICAgaWYgKCFIVE1MV2lkZ2V0cy5zaGlueU1vZGUgJiYgIWNyb3NzdGFsa09wdGlvbnMuZ3JvdXApIHJldHVybjsKCiAgICB2YXIgbWV0aG9kcyA9IHt9OwogICAgdmFyIHNoaW55RGF0YSA9IHt9OwoKICAgIG1ldGhvZHMudXBkYXRlQ2FwdGlvbiA9IGZ1bmN0aW9uKGNhcHRpb24pIHsKICAgICAgaWYgKCFjYXB0aW9uKSByZXR1cm47CiAgICAgICR0YWJsZS5jaGlsZHJlbignY2FwdGlvbicpLnJlcGxhY2VXaXRoKGNhcHRpb24pOwogICAgfQoKICAgIC8vIHJlZ2lzdGVyIGNsZWFyIGZ1bmN0aW9ucyB0byByZW1vdmUgaW5wdXQgdmFsdWVzIHdoZW4gdGhlIHRhYmxlIGlzIHJlbW92ZWQKICAgIGluc3RhbmNlLmNsZWFySW5wdXRzID0ge307CgogICAgdmFyIGNoYW5nZUlucHV0ID0gZnVuY3Rpb24oaWQsIHZhbHVlLCB0eXBlLCBub0Nyb3NzdGFsaywgb3B0cykgewogICAgICB2YXIgZXZlbnQgPSBpZDsKICAgICAgaWQgPSBlbC5pZCArICdfJyArIGlkOwogICAgICBpZiAodHlwZSkgaWQgPSBpZCArICc6JyArIHR5cGU7CiAgICAgIC8vIGRvIG5vdCB1cGRhdGUgaWYgdGhlIG5ldyB2YWx1ZSBpcyB0aGUgc2FtZSBhcyBvbGQgdmFsdWUKICAgICAgaWYgKGV2ZW50ICE9PSAnY2VsbF9lZGl0JyAmJiAhL19jbGlja2VkJC8udGVzdChldmVudCkgJiYgc2hpbnlEYXRhLmhhc093blByb3BlcnR5KGlkKSAmJiBzaGlueURhdGFbaWRdID09PSBKU09OLnN0cmluZ2lmeSh2YWx1ZSkpCiAgICAgICAgcmV0dXJuOwogICAgICBzaGlueURhdGFbaWRdID0gSlNPTi5zdHJpbmdpZnkodmFsdWUpOwogICAgICBpZiAoSFRNTFdpZGdldHMuc2hpbnlNb2RlICYmIFNoaW55LnNldElucHV0VmFsdWUpIHsKICAgICAgICBTaGlueS5zZXRJbnB1dFZhbHVlKGlkLCB2YWx1ZSwgb3B0cyk7CiAgICAgICAgaWYgKCFpbnN0YW5jZS5jbGVhcklucHV0c1tpZF0pIGluc3RhbmNlLmNsZWFySW5wdXRzW2lkXSA9IGZ1bmN0aW9uKCkgewogICAgICAgICAgU2hpbnkuc2V0SW5wdXRWYWx1ZShpZCwgbnVsbCk7CiAgICAgICAgfQogICAgICB9CgogICAgICAvLyBIQUNLCiAgICAgIGlmIChldmVudCA9PT0gInJvd3Nfc2VsZWN0ZWQiICYmICFub0Nyb3NzdGFsaykgewogICAgICAgIGlmIChjcm9zc3RhbGtPcHRpb25zLmdyb3VwKSB7CiAgICAgICAgICB2YXIga2V5cyA9IGNyb3NzdGFsa09wdGlvbnMua2V5OwogICAgICAgICAgdmFyIHNlbGVjdGVkS2V5cyA9IG51bGw7CiAgICAgICAgICBpZiAodmFsdWUpIHsKICAgICAgICAgICAgc2VsZWN0ZWRLZXlzID0gW107CiAgICAgICAgICAgIGZvciAodmFyIGkgPSAwOyBpIDwgdmFsdWUubGVuZ3RoOyBpKyspIHsKICAgICAgICAgICAgICAvLyBUaGUgdmFsdWUgYXJyYXkncyBjb250ZW50cyB1c2UgMS1iYXNlZCByb3cgbnVtYmVycywgc28gd2UgbXVzdAogICAgICAgICAgICAgIC8vIGNvbnZlcnQgdG8gMC1iYXNlZCBiZWZvcmUgaW5kZXhpbmcgaW50byB0aGUga2V5cyBhcnJheS4KICAgICAgICAgICAgICBzZWxlY3RlZEtleXMucHVzaChrZXlzW3ZhbHVlW2ldIC0gMV0pOwogICAgICAgICAgICB9CiAgICAgICAgICB9CiAgICAgICAgICBpbnN0YW5jZS5jdHNlbGVjdEhhbmRsZS5zZXQoc2VsZWN0ZWRLZXlzKTsKICAgICAgICB9CiAgICAgIH0KICAgIH07CgogICAgdmFyIGFkZE9uZSA9IGZ1bmN0aW9uKHgpIHsKICAgICAgcmV0dXJuIHgubWFwKGZ1bmN0aW9uKGkpIHsgcmV0dXJuIDEgKyBpOyB9KTsKICAgIH07CgogICAgdmFyIHVuaXF1ZSA9IGZ1bmN0aW9uKHgpIHsKICAgICAgdmFyIHV4ID0gW107CiAgICAgICQuZWFjaCh4LCBmdW5jdGlvbihpLCBlbCl7CiAgICAgICAgaWYgKCQuaW5BcnJheShlbCwgdXgpID09PSAtMSkgdXgucHVzaChlbCk7CiAgICAgIH0pOwogICAgICByZXR1cm4gdXg7CiAgICB9CgogICAgLy8gY2hhbmdlIHRoZSByb3cgaW5kZXggb2YgYSBjZWxsCiAgICB2YXIgdHdlYWtDZWxsSW5kZXggPSBmdW5jdGlvbihjZWxsKSB7CiAgICAgIHZhciBpbmZvID0gY2VsbC5pbmRleCgpOwogICAgICAvLyBzb21lIGNlbGwgbWF5IG5vdCBiZSB2YWxpZC4gZS5nLCAjNzU5CiAgICAgIC8vIHdoZW4gdXNpbmcgdGhlIFJvd0dyb3VwIGV4dGVuc2lvbiwgZGF0YXRhYmxlcyB3aWxsCiAgICAgIC8vIGdlbmVyYXRlIHRoZSByb3cgbGFiZWwgYW5kIHRoZSBjZWxscyBhcmUgbm90IHBhcnQgb2YKICAgICAgLy8gdGhlIGRhdGEgdGh1cyBjb250YWluIG5vIHJvdy9jb2wgaW5mbwogICAgICBpZiAoaW5mbyA9PT0gdW5kZWZpbmVkKQogICAgICAgIHJldHVybiB7cm93OiBudWxsLCBjb2w6IG51bGx9OwogICAgICBpZiAoc2VydmVyKSB7CiAgICAgICAgaW5mby5yb3cgPSBEVF9yb3dzX2N1cnJlbnRbaW5mby5yb3ddOwogICAgICB9IGVsc2UgewogICAgICAgIGluZm8ucm93ICs9IDE7CiAgICAgIH0KICAgICAgcmV0dXJuIHtyb3c6IGluZm8ucm93LCBjb2w6IGluZm8uY29sdW1ufTsKICAgIH0KCiAgICB2YXIgY2xlYW5TZWxlY3RlZFZhbHVlcyA9IGZ1bmN0aW9uKCkgewogICAgICBjaGFuZ2VJbnB1dCgncm93c19zZWxlY3RlZCcsIFtdKTsKICAgICAgY2hhbmdlSW5wdXQoJ2NvbHVtbnNfc2VsZWN0ZWQnLCBbXSk7CiAgICAgIGNoYW5nZUlucHV0KCdjZWxsc19zZWxlY3RlZCcsIHRyYW5zcG9zZUFycmF5MkQoW10pLCAnc2hpbnkubWF0cml4Jyk7CiAgICB9CiAgICAvLyAjODI4IHdlIHNob3VsZCBjbGVhbiB0aGUgc2VsZWN0aW9uIG9uIHRoZSBzZXJ2ZXItc2lkZSB3aGVuIHRoZSB0YWJsZSByZWxvYWRzCiAgICBjbGVhblNlbGVjdGVkVmFsdWVzKCk7CgogICAgLy8gYSBmbGFnIHRvIGluZGljYXRlcyBpZiBzZWxlY3QgZXh0ZW5zaW9uIGlzIGluaXRpYWxpemVkIG9yIG5vdAogICAgdmFyIGZsYWdTZWxlY3RFeHQgPSB0YWJsZS5zZXR0aW5ncygpWzBdLl9zZWxlY3QgIT09IHVuZGVmaW5lZDsKICAgIC8vIHRoZSBTZWxlY3QgZXh0ZW5zaW9uIHNob3VsZCBvbmx5IGJlIHVzZWQgaW4gdGhlIGNsaWVudCBtb2RlIGFuZAogICAgLy8gd2hlbiB0aGUgc2VsZWN0aW9uLm1vZGUgaXMgc2V0IHRvIG5vbmUKICAgIGlmIChkYXRhLnNlbGVjdGlvbi5tb2RlID09PSAnbm9uZScgJiYgIXNlcnZlciAmJiBmbGFnU2VsZWN0RXh0KSB7CiAgICAgIHZhciB1cGRhdGVSb3dzU2VsZWN0ZWQgPSBmdW5jdGlvbigpIHsKICAgICAgICB2YXIgcm93cyA9IHRhYmxlLnJvd3Moe3NlbGVjdGVkOiB0cnVlfSk7CiAgICAgICAgdmFyIHNlbGVjdGVkID0gW107CiAgICAgICAgJC5lYWNoKHJvd3MuaW5kZXhlcygpLnRvQXJyYXkoKSwgZnVuY3Rpb24oaSwgdikgewogICAgICAgICAgc2VsZWN0ZWQucHVzaCh2ICsgMSk7CiAgICAgICAgfSk7CiAgICAgICAgY2hhbmdlSW5wdXQoJ3Jvd3Nfc2VsZWN0ZWQnLCBzZWxlY3RlZCk7CiAgICAgIH0KICAgICAgdmFyIHVwZGF0ZUNvbHNTZWxlY3RlZCA9IGZ1bmN0aW9uKCkgewogICAgICAgIHZhciBjb2x1bW5zID0gdGFibGUuY29sdW1ucyh7c2VsZWN0ZWQ6IHRydWV9KTsKICAgICAgICBjaGFuZ2VJbnB1dCgnY29sdW1uc19zZWxlY3RlZCcsIGNvbHVtbnMuaW5kZXhlcygpLnRvQXJyYXkoKSk7CiAgICAgIH0KICAgICAgdmFyIHVwZGF0ZUNlbGxzU2VsZWN0ZWQgPSBmdW5jdGlvbigpIHsKICAgICAgICB2YXIgY2VsbHMgPSB0YWJsZS5jZWxscyh7c2VsZWN0ZWQ6IHRydWV9KTsKICAgICAgICB2YXIgc2VsZWN0ZWQgPSBbXTsKICAgICAgICBjZWxscy5ldmVyeShmdW5jdGlvbigpIHsKICAgICAgICAgIHZhciByb3cgPSB0aGlzLmluZGV4KCkucm93OwogICAgICAgICAgdmFyIGNvbCA9IHRoaXMuaW5kZXgoKS5jb2x1bW47CiAgICAgICAgICBzZWxlY3RlZCA9IHNlbGVjdGVkLmNvbmNhdChbW3JvdyArIDEsIGNvbF1dKTsKICAgICAgICB9KTsKICAgICAgICBjaGFuZ2VJbnB1dCgnY2VsbHNfc2VsZWN0ZWQnLCB0cmFuc3Bvc2VBcnJheTJEKHNlbGVjdGVkKSwgJ3NoaW55Lm1hdHJpeCcpOwogICAgICB9CiAgICAgIHRhYmxlLm9uKCdzZWxlY3QgZGVzZWxlY3QnLCBmdW5jdGlvbihlLCBkdCwgdHlwZSwgaW5kZXhlcykgewogICAgICAgIHVwZGF0ZVJvd3NTZWxlY3RlZCgpOwogICAgICAgIHVwZGF0ZUNvbHNTZWxlY3RlZCgpOwogICAgICAgIHVwZGF0ZUNlbGxzU2VsZWN0ZWQoKTsKICAgICAgfSkKICAgIH0KCiAgICB2YXIgc2VsTW9kZSA9IGRhdGEuc2VsZWN0aW9uLm1vZGUsIHNlbFRhcmdldCA9IGRhdGEuc2VsZWN0aW9uLnRhcmdldDsKICAgIHZhciBzZWxEaXNhYmxlID0gZGF0YS5zZWxlY3Rpb24uc2VsZWN0YWJsZSA9PT0gZmFsc2U7CiAgICBpZiAoaW5BcnJheShzZWxNb2RlLCBbJ3NpbmdsZScsICdtdWx0aXBsZSddKSkgewogICAgICB2YXIgc2VsQ2xhc3MgPSBpbkFycmF5KGRhdGEuc3R5bGUsIFsnYm9vdHN0cmFwJywgJ2Jvb3RzdHJhcDQnXSkgPyAnYWN0aXZlJyA6ICdzZWxlY3RlZCc7CiAgICAgIC8vIHNlbGVjdGVkMTogcm93IGluZGljZXM7IHNlbGVjdGVkMjogY29sdW1uIGluZGljZXMKICAgICAgdmFyIGluaXRTZWwgPSBmdW5jdGlvbih4KSB7CiAgICAgICAgaWYgKHggPT09IG51bGwgfHwgdHlwZW9mIHggPT09ICdib29sZWFuJyB8fCBzZWxUYXJnZXQgPT09ICdjZWxsJykgewogICAgICAgICAgcmV0dXJuIHtyb3dzOiBbXSwgY29sczogW119OwogICAgICAgIH0gZWxzZSBpZiAoc2VsVGFyZ2V0ID09PSAncm93JykgewogICAgICAgICAgcmV0dXJuIHtyb3dzOiAkLm1ha2VBcnJheSh4KSwgY29sczogW119OwogICAgICAgIH0gZWxzZSBpZiAoc2VsVGFyZ2V0ID09PSAnY29sdW1uJykgewogICAgICAgICAgcmV0dXJuIHtyb3dzOiBbXSwgY29sczogJC5tYWtlQXJyYXkoeCl9OwogICAgICAgIH0gZWxzZSBpZiAoc2VsVGFyZ2V0ID09PSAncm93K2NvbHVtbicpIHsKICAgICAgICAgIHJldHVybiB7cm93czogJC5tYWtlQXJyYXkoeC5yb3dzKSwgY29sczogJC5tYWtlQXJyYXkoeC5jb2xzKX07CiAgICAgICAgfQogICAgICB9CiAgICAgIHZhciBzZWxlY3RlZCA9IGRhdGEuc2VsZWN0aW9uLnNlbGVjdGVkOwogICAgICB2YXIgc2VsZWN0ZWQxID0gaW5pdFNlbChzZWxlY3RlZCkucm93cywgc2VsZWN0ZWQyID0gaW5pdFNlbChzZWxlY3RlZCkuY29sczsKICAgICAgLy8gc2VsZWN0YWJsZSBzaG91bGQgY29udGFpbiBlaXRoZXIgYWxsIHBvc2l0aXZlIG9yIGFsbCBub24tcG9zaXRpdmUgdmFsdWVzLCBub3QgYm90aAogICAgICAvLyBwb3NpdGl2ZSB2YWx1ZXMgaW5kaWNhdGUgInNlbGVjdGFibGUiIHdoaWxlIG5vbi1wb3NpdGl2ZSB2YWx1ZXMgbWVhbnMgIm5vbnNlbGVjdGFibGUiCiAgICAgIC8vIHRoZSBhc3NlcnRpb24gaXMgcGVyZm9ybWVkIG9uIFIgc2lkZS4gKG9ubHkgY29sdW1uIGluZGljaWRlcyBjb3VsZCBiZSB6ZXJvIHdoaWNoIGluZGljYXRlcwogICAgICAvLyB0aGUgcm93IG5hbWUpCiAgICAgIHZhciBzZWxlY3RhYmxlID0gZGF0YS5zZWxlY3Rpb24uc2VsZWN0YWJsZTsKICAgICAgdmFyIHNlbGVjdGFibGUxID0gaW5pdFNlbChzZWxlY3RhYmxlKS5yb3dzLCBzZWxlY3RhYmxlMiA9IGluaXRTZWwoc2VsZWN0YWJsZSkuY29sczsKCiAgICAgIC8vIEFmdGVyIHVzZXJzIHJlb3JkZXIgdGhlIHJvd3Mgb3IgZmlsdGVyIHRoZSB0YWJsZSwgd2UgY2Fubm90IHVzZSB0aGUgdGFibGUgaW5kZXgKICAgICAgLy8gZGlyZWN0bHkuIEluc3RlYWQsIHdlIG5lZWQgdGhpcyBmdW5jdGlvbiB0byBmaW5kIG91dCB0aGUgcm93cyBiZXR3ZWVuIHRoZSB0d28gY2xpY2tzLgogICAgICAvLyBJZiB1c2VyIGZpbHRlciB0aGUgdGFibGUgYWdhaW4gYmV0d2VlbiB0aGUgc3RhcnQgY2xpY2sgYW5kIHRoZSBlbmQgY2xpY2ssIHRoZSBiZWhhdmlvcgogICAgICAvLyB3b3VsZCBiZSB1bmRlZmluZWQsIGJ1dCBpdCBzaG91bGQgbm90IGJlIGEgcHJvYmxlbS4KICAgICAgdmFyIHNoaWZ0U2VsUm93c0luZGV4ID0gZnVuY3Rpb24oc3RhcnQsIGVuZCkgewogICAgICAgIHZhciBpbmRleGVzID0gc2VydmVyID8gRFRfcm93c19hbGwgOiB0YWJsZS5yb3dzKHsgc2VhcmNoOiAnYXBwbGllZCcgfSkuaW5kZXhlcygpLnRvQXJyYXkoKTsKICAgICAgICBzdGFydCA9IGluZGV4ZXMuaW5kZXhPZihzdGFydCk7IGVuZCA9IGluZGV4ZXMuaW5kZXhPZihlbmQpOwogICAgICAgIC8vIGlmIHN0YXJ0IGlzIGxhcmdlciB0aGFuIGVuZCwgd2UgbmVlZCB0byBzd2FwCiAgICAgICAgaWYgKHN0YXJ0ID4gZW5kKSB7CiAgICAgICAgICB2YXIgdG1wID0gZW5kOyBlbmQgPSBzdGFydDsgc3RhcnQgPSB0bXA7CiAgICAgICAgfQogICAgICAgIHJldHVybiBpbmRleGVzLnNsaWNlKHN0YXJ0LCBlbmQgKyAxKTsKICAgICAgfQoKICAgICAgdmFyIHNlcnZlclJvd0luZGV4ID0gZnVuY3Rpb24oY2xpZW50Um93SW5kZXgpIHsKICAgICAgICByZXR1cm4gc2VydmVyID8gRFRfcm93c19jdXJyZW50W2NsaWVudFJvd0luZGV4XSA6IGNsaWVudFJvd0luZGV4ICsgMTsKICAgICAgfQoKICAgICAgLy8gcm93LCBjb2x1bW4sIG9yIGNlbGwgc2VsZWN0aW9uCiAgICAgIHZhciBsYXN0Q2xpY2tlZFJvdzsKICAgICAgaWYgKGluQXJyYXkoc2VsVGFyZ2V0LCBbJ3JvdycsICdyb3crY29sdW1uJ10pKSB7CiAgICAgICAgLy8gR2V0IHRoZSBjdXJyZW50IHNlbGVjdGVkIHJvd3MuIEl0IHdpbGwgYWxzbwogICAgICAgIC8vIHVwZGF0ZSB0aGUgc2VsZWN0ZWQxJ3MgdmFsdWUgYmFzZWQgb24gdGhlIGN1cnJlbnQgcm93IHNlbGVjdGlvbiBzdGF0ZQogICAgICAgIC8vIE5vdGUgd2UgY2FuJ3QgcHV0IHRoaXMgZnVuY3Rpb24gaW5zaWRlIHNlbGVjdFJvd3MoKSBkaXJlY3RseSwKICAgICAgICAvLyB0aGUgcmVhc29uIGlzIG1ldGhvZC5zZWxlY3RSb3dzKCkgd2lsbCBvdmVycmlkZSBzZWxlY3RlZDEncyB2YWx1ZSBidXQgdGhpcwogICAgICAgIC8vIGZ1bmN0aW9uIHdpbGwgYWRkIHJvd3MgdG8gc2VsZWN0ZWQxIChrZWVwIHRoZSBleGlzdGluZyBzZWxlY3Rpb24pLCB3aGljaCBpcwogICAgICAgIC8vIGluY29uc2lzdGVudCB3aXRoIGNvbHVtbiBhbmQgY2VsbCBzZWxlY3Rpb24uCiAgICAgICAgdmFyIHNlbGVjdGVkUm93cyA9IGZ1bmN0aW9uKCkgewogICAgICAgICAgdmFyIHJvd3MgPSB0YWJsZS5yb3dzKCcuJyArIHNlbENsYXNzKTsKICAgICAgICAgIHZhciBpZHggPSByb3dzLmluZGV4ZXMoKS50b0FycmF5KCk7CiAgICAgICAgICBpZiAoIXNlcnZlcikgewogICAgICAgICAgICBzZWxlY3RlZDEgPSBhZGRPbmUoaWR4KTsKICAgICAgICAgICAgcmV0dXJuIHNlbGVjdGVkMTsKICAgICAgICAgIH0KICAgICAgICAgIGlkeCA9IGlkeC5tYXAoZnVuY3Rpb24oaSkgewogICAgICAgICAgICByZXR1cm4gRFRfcm93c19jdXJyZW50W2ldOwogICAgICAgICAgfSk7CiAgICAgICAgICBzZWxlY3RlZDEgPSBzZWxNb2RlID09PSAnbXVsdGlwbGUnID8gdW5pcXVlKHNlbGVjdGVkMS5jb25jYXQoaWR4KSkgOiBpZHg7CiAgICAgICAgICByZXR1cm4gc2VsZWN0ZWQxOwogICAgICAgIH0KICAgICAgICAvLyBDaGFuZ2Ugc2VsZWN0ZWQxJ3MgdmFsdWUgYmFzZWQgb24gc2VsZWN0YWJsZTEsIHRoZW4gcmVmcmVzaCB0aGUgcm93IHN0YXRlCiAgICAgICAgdmFyIG9ubHlLZWVwU2VsZWN0YWJsZVJvd3MgPSBmdW5jdGlvbigpIHsKICAgICAgICAgIGlmIChzZWxEaXNhYmxlKSB7IC8vIHVzZXJzIGNhbid0IHNlbGVjdDsgdXNlZnVsIHdoZW4gb25seSB3YW50IGJhY2tlbmQgc2VsZWN0CiAgICAgICAgICAgIHNlbGVjdGVkMSA9IFtdOwogICAgICAgICAgICByZXR1cm47CiAgICAgICAgICB9CiAgICAgICAgICBpZiAoc2VsZWN0YWJsZTEubGVuZ3RoID09PSAwKSByZXR1cm47CiAgICAgICAgICB2YXIgbm9uc2VsZWN0YWJsZSA9IHNlbGVjdGFibGUxWzBdIDw9IDA7CiAgICAgICAgICBpZiAobm9uc2VsZWN0YWJsZSkgewogICAgICAgICAgICAvLyBzaG91bGQgbWFrZSBzZWxlY3RhYmxlMSBwb3NpdGl2ZQogICAgICAgICAgICBzZWxlY3RlZDEgPSAkKHNlbGVjdGVkMSkubm90KHNlbGVjdGFibGUxLm1hcChmdW5jdGlvbihpKSB7IHJldHVybiAtaTsgfSkpLmdldCgpOwogICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgc2VsZWN0ZWQxID0gJChzZWxlY3RlZDEpLmZpbHRlcihzZWxlY3RhYmxlMSkuZ2V0KCk7CiAgICAgICAgICB9CiAgICAgICAgfQogICAgICAgIC8vIENoYW5nZSBzZWxlY3RlZDEncyB2YWx1ZSBiYXNlZCBvbiBzZWxlY3RhYmxlMSwgdGhlbgogICAgICAgIC8vIHJlZnJlc2ggdGhlIHJvdyBzZWxlY3Rpb24gc3RhdGUgYWNjb3JkaW5nIHRvIHZhbHVlcyBpbiBzZWxlY3RlZDEKICAgICAgICB2YXIgc2VsZWN0Um93cyA9IGZ1bmN0aW9uKGlnbm9yZVNlbGVjdGFibGUpIHsKICAgICAgICAgIGlmICghaWdub3JlU2VsZWN0YWJsZSkgb25seUtlZXBTZWxlY3RhYmxlUm93cygpOwogICAgICAgICAgdGFibGUuJCgndHIuJyArIHNlbENsYXNzKS5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICBpZiAoc2VsZWN0ZWQxLmxlbmd0aCA9PT0gMCkgcmV0dXJuOwogICAgICAgICAgaWYgKHNlcnZlcikgewogICAgICAgICAgICB0YWJsZS5yb3dzKHtwYWdlOiAnY3VycmVudCd9KS5ldmVyeShmdW5jdGlvbigpIHsKICAgICAgICAgICAgICBpZiAoaW5BcnJheShEVF9yb3dzX2N1cnJlbnRbdGhpcy5pbmRleCgpXSwgc2VsZWN0ZWQxKSkgewogICAgICAgICAgICAgICAgJCh0aGlzLm5vZGUoKSkuYWRkQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgfSk7CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICB2YXIgc2VsZWN0ZWQwID0gc2VsZWN0ZWQxLm1hcChmdW5jdGlvbihpKSB7IHJldHVybiBpIC0gMTsgfSk7CiAgICAgICAgICAgICQodGFibGUucm93cyhzZWxlY3RlZDApLm5vZGVzKCkpLmFkZENsYXNzKHNlbENsYXNzKTsKICAgICAgICAgIH0KICAgICAgICB9CiAgICAgICAgdGFibGUub24oJ21vdXNlZG93bi5kdCcsICd0Ym9keSB0cicsIGZ1bmN0aW9uKGUpIHsKICAgICAgICAgIHZhciAkdGhpcyA9ICQodGhpcyksIHRoaXNSb3cgPSB0YWJsZS5yb3codGhpcyk7CiAgICAgICAgICBpZiAoc2VsTW9kZSA9PT0gJ211bHRpcGxlJykgewogICAgICAgICAgICBpZiAoZS5zaGlmdEtleSAmJiBsYXN0Q2xpY2tlZFJvdyAhPT0gdW5kZWZpbmVkKSB7CiAgICAgICAgICAgICAgLy8gc2VsZWN0IG9yIGRlLXNlbGVjdCBkZXBlbmRzIG9uIHRoZSBsYXN0IGNsaWNrZWQgcm93J3Mgc3RhdHVzCiAgICAgICAgICAgICAgdmFyIGZsYWdTZWwgPSAhJHRoaXMuaGFzQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgIHZhciBjcnRDbGlja2VkUm93ID0gc2VydmVyUm93SW5kZXgodGhpc1Jvdy5pbmRleCgpKTsKICAgICAgICAgICAgICBpZiAoc2VydmVyKSB7CiAgICAgICAgICAgICAgICB2YXIgcm93c0luZGV4ID0gc2hpZnRTZWxSb3dzSW5kZXgobGFzdENsaWNrZWRSb3csIGNydENsaWNrZWRSb3cpOwogICAgICAgICAgICAgICAgLy8gdXBkYXRlIGN1cnJlbnQgcGFnZSdzIHNlbENsYXNzCiAgICAgICAgICAgICAgICByb3dzSW5kZXgubWFwKGZ1bmN0aW9uKGkpIHsKICAgICAgICAgICAgICAgICAgdmFyIHJvd0luZGV4ID0gRFRfcm93c19jdXJyZW50LmluZGV4T2YoaSk7CiAgICAgICAgICAgICAgICAgIGlmIChyb3dJbmRleCA+PSAwKSB7CiAgICAgICAgICAgICAgICAgICAgdmFyIHJvdyA9IHRhYmxlLnJvdyhyb3dJbmRleCkubm9kZXMoKS50byQoKTsKICAgICAgICAgICAgICAgICAgICB2YXIgZmxhZ1Jvd1NlbCA9ICFyb3cuaGFzQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgICAgICAgIGlmIChmbGFnU2VsID09PSBmbGFnUm93U2VsKSByb3cudG9nZ2xlQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgICB9KTsKICAgICAgICAgICAgICAgIC8vIHVwZGF0ZSBzZWxlY3RlZDEKICAgICAgICAgICAgICAgIGlmIChmbGFnU2VsKSB7CiAgICAgICAgICAgICAgICAgIHNlbGVjdGVkMSA9IHVuaXF1ZShzZWxlY3RlZDEuY29uY2F0KHJvd3NJbmRleCkpOwogICAgICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgICAgc2VsZWN0ZWQxID0gc2VsZWN0ZWQxLmZpbHRlcihmdW5jdGlvbihpbmRleCkgewogICAgICAgICAgICAgICAgICAgIHJldHVybiAhaW5BcnJheShpbmRleCwgcm93c0luZGV4KTsKICAgICAgICAgICAgICAgICAgfSk7CiAgICAgICAgICAgICAgICB9CiAgICAgICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgICAgIC8vIGpzIHN0YXJ0cyBmcm9tIDAKICAgICAgICAgICAgICAgIHNoaWZ0U2VsUm93c0luZGV4KGxhc3RDbGlja2VkUm93IC0gMSwgY3J0Q2xpY2tlZFJvdyAtIDEpLm1hcChmdW5jdGlvbih2YWx1ZSkgewogICAgICAgICAgICAgICAgICB2YXIgcm93ID0gdGFibGUucm93KHZhbHVlKS5ub2RlcygpLnRvJCgpOwogICAgICAgICAgICAgICAgICB2YXIgZmxhZ1Jvd1NlbCA9ICFyb3cuaGFzQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgICAgICBpZiAoZmxhZ1NlbCA9PT0gZmxhZ1Jvd1NlbCkgcm93LnRvZ2dsZUNsYXNzKHNlbENsYXNzKTsKICAgICAgICAgICAgICAgIH0pOwogICAgICAgICAgICAgIH0KICAgICAgICAgICAgICBlLnByZXZlbnREZWZhdWx0KCk7CiAgICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgICAgJHRoaXMudG9nZ2xlQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICB9CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBpZiAoJHRoaXMuaGFzQ2xhc3Moc2VsQ2xhc3MpKSB7CiAgICAgICAgICAgICAgJHRoaXMucmVtb3ZlQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICAgIHRhYmxlLiQoJ3RyLicgKyBzZWxDbGFzcykucmVtb3ZlQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICAgICR0aGlzLmFkZENsYXNzKHNlbENsYXNzKTsKICAgICAgICAgICAgfQogICAgICAgICAgfQogICAgICAgICAgaWYgKHNlcnZlciAmJiAhJHRoaXMuaGFzQ2xhc3Moc2VsQ2xhc3MpKSB7CiAgICAgICAgICAgIHZhciBpZCA9IERUX3Jvd3NfY3VycmVudFt0aGlzUm93LmluZGV4KCldOwogICAgICAgICAgICAvLyByZW1vdmUgaWQgZnJvbSBzZWxlY3RlZDEgc2luY2UgaXRzIGNsYXNzIC5zZWxlY3RlZCBoYXMgYmVlbiByZW1vdmVkCiAgICAgICAgICAgIGlmIChpbkFycmF5KGlkLCBzZWxlY3RlZDEpKSBzZWxlY3RlZDEuc3BsaWNlKCQuaW5BcnJheShpZCwgc2VsZWN0ZWQxKSwgMSk7CiAgICAgICAgICB9CiAgICAgICAgICBzZWxlY3RlZFJvd3MoKTsgLy8gdXBkYXRlIHNlbGVjdGVkMSdzIHZhbHVlIGJhc2VkIG9uIHNlbENsYXNzCiAgICAgICAgICBzZWxlY3RSb3dzKGZhbHNlKTsgLy8gb25seSBrZWVwIHRoZSBzZWxlY3RhYmxlIHJvd3MKICAgICAgICAgIGNoYW5nZUlucHV0KCdyb3dzX3NlbGVjdGVkJywgc2VsZWN0ZWQxKTsKICAgICAgICAgIGNoYW5nZUlucHV0KCdyb3dfbGFzdF9jbGlja2VkJywgc2VydmVyUm93SW5kZXgodGhpc1Jvdy5pbmRleCgpKSwgbnVsbCwgbnVsbCwge3ByaW9yaXR5OiAnZXZlbnQnfSk7CiAgICAgICAgICBsYXN0Q2xpY2tlZFJvdyA9IHNlcnZlclJvd0luZGV4KHRoaXNSb3cuaW5kZXgoKSk7CiAgICAgICAgfSk7CiAgICAgICAgc2VsZWN0Um93cyhmYWxzZSk7ICAvLyBpbiBjYXNlIHVzZXJzIGhhdmUgc3BlY2lmaWVkIHByZS1zZWxlY3RlZCByb3dzCiAgICAgICAgLy8gcmVzdG9yZSBzZWxlY3RlZCByb3dzIGFmdGVyIHRoZSB0YWJsZSBpcyByZWRyYXduIChlLmcuIHNvcnQvc2VhcmNoL3BhZ2UpOwogICAgICAgIC8vIGNsaWVudC1zaWRlIHRhYmxlcyB3aWxsIHByZXNlcnZlIHRoZSBzZWxlY3Rpb25zIGF1dG9tYXRpY2FsbHk7IGZvcgogICAgICAgIC8vIHNlcnZlci1zaWRlIHRhYmxlcywgd2UgaGF2ZSB0byAqcmVhbCogcm93IGluZGljZXMgYXJlIGluIGBzZWxlY3RlZDFgCiAgICAgICAgY2hhbmdlSW5wdXQoJ3Jvd3Nfc2VsZWN0ZWQnLCBzZWxlY3RlZDEpOwogICAgICAgIGlmIChzZXJ2ZXIpIHRhYmxlLm9uKCdkcmF3LmR0JywgZnVuY3Rpb24oZSkgeyBzZWxlY3RSb3dzKGZhbHNlKTsgfSk7CiAgICAgICAgbWV0aG9kcy5zZWxlY3RSb3dzID0gZnVuY3Rpb24oc2VsZWN0ZWQsIGlnbm9yZVNlbGVjdGFibGUpIHsKICAgICAgICAgIHNlbGVjdGVkMSA9ICQubWFrZUFycmF5KHNlbGVjdGVkKTsKICAgICAgICAgIHNlbGVjdFJvd3MoaWdub3JlU2VsZWN0YWJsZSk7CiAgICAgICAgICBjaGFuZ2VJbnB1dCgncm93c19zZWxlY3RlZCcsIHNlbGVjdGVkMSk7CiAgICAgICAgfQogICAgICB9CgogICAgICBpZiAoaW5BcnJheShzZWxUYXJnZXQsIFsnY29sdW1uJywgJ3Jvdytjb2x1bW4nXSkpIHsKICAgICAgICBpZiAoc2VsVGFyZ2V0ID09PSAncm93K2NvbHVtbicpIHsKICAgICAgICAgICQodGFibGUuY29sdW1ucygpLmZvb3RlcigpKS5jc3MoJ2N1cnNvcicsICdwb2ludGVyJyk7CiAgICAgICAgfQogICAgICAgIC8vIHVwZGF0ZSBzZWxlY3RlZDIncyB2YWx1ZSBiYXNlZCBvbiBzZWxlY3RhYmxlMgogICAgICAgIHZhciBvbmx5S2VlcFNlbGVjdGFibGVDb2xzID0gZnVuY3Rpb24oKSB7CiAgICAgICAgICBpZiAoc2VsRGlzYWJsZSkgeyAvLyB1c2VycyBjYW4ndCBzZWxlY3Q7IHVzZWZ1bCB3aGVuIG9ubHkgd2FudCBiYWNrZW5kIHNlbGVjdAogICAgICAgICAgICBzZWxlY3RlZDIgPSBbXTsKICAgICAgICAgICAgcmV0dXJuOwogICAgICAgICAgfQogICAgICAgICAgaWYgKHNlbGVjdGFibGUyLmxlbmd0aCA9PT0gMCkgcmV0dXJuOwogICAgICAgICAgdmFyIG5vbnNlbGVjdGFibGUgPSBzZWxlY3RhYmxlMlswXSA8PSAwOwogICAgICAgICAgaWYgKG5vbnNlbGVjdGFibGUpIHsKICAgICAgICAgICAgLy8gbmVlZCB0byBtYWtlIHNlbGVjdGFibGUyIHBvc2l0aXZlCiAgICAgICAgICAgIHNlbGVjdGVkMiA9ICQoc2VsZWN0ZWQyKS5ub3Qoc2VsZWN0YWJsZTIubWFwKGZ1bmN0aW9uKGkpIHsgcmV0dXJuIC1pOyB9KSkuZ2V0KCk7CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBzZWxlY3RlZDIgPSAkKHNlbGVjdGVkMikuZmlsdGVyKHNlbGVjdGFibGUyKS5nZXQoKTsKICAgICAgICAgIH0KICAgICAgICB9CiAgICAgICAgLy8gdXBkYXRlIHNlbGVjdGVkMiBhbmQgdGhlbgogICAgICAgIC8vIHJlZnJlc2ggdGhlIGNvbCBzZWxlY3Rpb24gc3RhdGUgYWNjb3JkaW5nIHRvIHZhbHVlcyBpbiBzZWxlY3RlZDIKICAgICAgICB2YXIgc2VsZWN0Q29scyA9IGZ1bmN0aW9uKGlnbm9yZVNlbGVjdGFibGUpIHsKICAgICAgICAgIGlmICghaWdub3JlU2VsZWN0YWJsZSkgb25seUtlZXBTZWxlY3RhYmxlQ29scygpOwogICAgICAgICAgLy8gaWYgc2VsZWN0ZWQyIGlzIG5vdCBhIHZhbGlkZSBpbmRleCAoZS5nLiwgbGFyZ2VyIHRoYW4gdGhlIGNvbHVtbiBudW1iZXIpCiAgICAgICAgICAvLyB0YWJsZS5jb2x1bW5zKHNlbGVjdGVkMikgd2lsbCBmYWlsIGFuZCByZXN1bHQgaW4gYSBibGFuayB0YWJsZQogICAgICAgICAgLy8gdGhpcyBpcyBkaWZmZXJlbnQgZnJvbSB0aGUgdGFibGUucm93cygpLCB3aGVyZSB0aGUgb3V0LW9mLXJhbmdlIGluZGV4ZXMKICAgICAgICAgIC8vIGRvZXNuJ3QgYWZmZWN0IGF0IGFsbAogICAgICAgICAgc2VsZWN0ZWQyID0gJChzZWxlY3RlZDIpLmZpbHRlcih0YWJsZS5jb2x1bW5zKCkuaW5kZXhlcygpKS5nZXQoKTsKICAgICAgICAgIHRhYmxlLmNvbHVtbnMoKS5ub2RlcygpLmZsYXR0ZW4oKS50byQoKS5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICBpZiAoc2VsZWN0ZWQyLmxlbmd0aCA+IDApCiAgICAgICAgICAgIHRhYmxlLmNvbHVtbnMoc2VsZWN0ZWQyKS5ub2RlcygpLmZsYXR0ZW4oKS50byQoKS5hZGRDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgfQogICAgICAgIHZhciBjYWxsYmFjayA9IGZ1bmN0aW9uKCkgewogICAgICAgICAgdmFyIGNvbElkeCA9IHNlbFRhcmdldCA9PT0gJ2NvbHVtbicgPyB0YWJsZS5jZWxsKHRoaXMpLmluZGV4KCkuY29sdW1uIDoKICAgICAgICAgICAgICAkLmluQXJyYXkodGhpcywgdGFibGUuY29sdW1ucygpLmZvb3RlcigpKSwKICAgICAgICAgICAgICB0aGlzQ29sID0gJCh0YWJsZS5jb2x1bW4oY29sSWR4KS5ub2RlcygpKTsKICAgICAgICAgIGlmIChjb2xJZHggPT09IC0xKSByZXR1cm47CiAgICAgICAgICBpZiAodGhpc0NvbC5oYXNDbGFzcyhzZWxDbGFzcykpIHsKICAgICAgICAgICAgdGhpc0NvbC5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICAgIHNlbGVjdGVkMi5zcGxpY2UoJC5pbkFycmF5KGNvbElkeCwgc2VsZWN0ZWQyKSwgMSk7CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBpZiAoc2VsTW9kZSA9PT0gJ3NpbmdsZScpICQodGFibGUuY2VsbHMoKS5ub2RlcygpKS5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICAgIHRoaXNDb2wuYWRkQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICBzZWxlY3RlZDIgPSBzZWxNb2RlID09PSAnc2luZ2xlJyA/IFtjb2xJZHhdIDogdW5pcXVlKHNlbGVjdGVkMi5jb25jYXQoW2NvbElkeF0pKTsKICAgICAgICAgIH0KICAgICAgICAgIHNlbGVjdENvbHMoZmFsc2UpOyAvLyB1cGRhdGUgc2VsZWN0ZWQyIGJhc2VkIG9uIHNlbGVjdGFibGUKICAgICAgICAgIGNoYW5nZUlucHV0KCdjb2x1bW5zX3NlbGVjdGVkJywgc2VsZWN0ZWQyKTsKICAgICAgICB9CiAgICAgICAgaWYgKHNlbFRhcmdldCA9PT0gJ2NvbHVtbicpIHsKICAgICAgICAgICQodGFibGUudGFibGUoKS5ib2R5KCkpLm9uKCdjbGljay5kdCcsICd0ZCcsIGNhbGxiYWNrKTsKICAgICAgICB9IGVsc2UgewogICAgICAgICAgJCh0YWJsZS50YWJsZSgpLmZvb3RlcigpKS5vbignY2xpY2suZHQnLCAndHIgdGgnLCBjYWxsYmFjayk7CiAgICAgICAgfQogICAgICAgIHNlbGVjdENvbHMoZmFsc2UpOyAgLy8gaW4gY2FzZSB1c2VycyBoYXZlIHNwZWNpZmllZCBwcmUtc2VsZWN0ZWQgY29sdW1ucwogICAgICAgIGNoYW5nZUlucHV0KCdjb2x1bW5zX3NlbGVjdGVkJywgc2VsZWN0ZWQyKTsKICAgICAgICBpZiAoc2VydmVyKSB0YWJsZS5vbignZHJhdy5kdCcsIGZ1bmN0aW9uKGUpIHsgc2VsZWN0Q29scyhmYWxzZSk7IH0pOwogICAgICAgIG1ldGhvZHMuc2VsZWN0Q29sdW1ucyA9IGZ1bmN0aW9uKHNlbGVjdGVkLCBpZ25vcmVTZWxlY3RhYmxlKSB7CiAgICAgICAgICBzZWxlY3RlZDIgPSAkLm1ha2VBcnJheShzZWxlY3RlZCk7CiAgICAgICAgICBzZWxlY3RDb2xzKGlnbm9yZVNlbGVjdGFibGUpOwogICAgICAgICAgY2hhbmdlSW5wdXQoJ2NvbHVtbnNfc2VsZWN0ZWQnLCBzZWxlY3RlZDIpOwogICAgICAgIH0KICAgICAgfQoKICAgICAgaWYgKHNlbFRhcmdldCA9PT0gJ2NlbGwnKSB7CiAgICAgICAgdmFyIHNlbGVjdGVkMyA9IFtdLCBzZWxlY3RhYmxlMyA9IFtdOwogICAgICAgIGlmIChzZWxlY3RlZCAhPT0gbnVsbCkgc2VsZWN0ZWQzID0gc2VsZWN0ZWQ7CiAgICAgICAgaWYgKHNlbGVjdGFibGUgIT09IG51bGwgJiYgdHlwZW9mIHNlbGVjdGFibGUgIT09ICdib29sZWFuJykgc2VsZWN0YWJsZTMgPSBzZWxlY3RhYmxlOwogICAgICAgIHZhciBmaW5kSW5kZXggPSBmdW5jdGlvbihpaiwgc2VsKSB7CiAgICAgICAgICBmb3IgKHZhciBpID0gMDsgaSA8IHNlbC5sZW5ndGg7IGkrKykgewogICAgICAgICAgICBpZiAoaWpbMF0gPT09IHNlbFtpXVswXSAmJiBpalsxXSA9PT0gc2VsW2ldWzFdKSByZXR1cm4gaTsKICAgICAgICAgIH0KICAgICAgICAgIHJldHVybiAtMTsKICAgICAgICB9CiAgICAgICAgIC8vIENoYW5nZSBzZWxlY3RlZDMncyB2YWx1ZSBiYXNlZCBvbiBzZWxlY3RhYmxlMywgdGhlbiByZWZyZXNoIHRoZSBjZWxsIHN0YXRlCiAgICAgICAgdmFyIG9ubHlLZWVwU2VsZWN0YWJsZUNlbGxzID0gZnVuY3Rpb24oKSB7CiAgICAgICAgICBpZiAoc2VsRGlzYWJsZSkgeyAvLyB1c2VycyBjYW4ndCBzZWxlY3Q7IHVzZWZ1bCB3aGVuIG9ubHkgd2FudCBiYWNrZW5kIHNlbGVjdAogICAgICAgICAgICBzZWxlY3RlZDMgPSBbXTsKICAgICAgICAgICAgcmV0dXJuOwogICAgICAgICAgfQogICAgICAgICAgaWYgKHNlbGVjdGFibGUzLmxlbmd0aCA9PT0gMCkgcmV0dXJuOwogICAgICAgICAgdmFyIG5vbnNlbGVjdGFibGUgPSBzZWxlY3RhYmxlM1swXVswXSA8PSAwOwogICAgICAgICAgdmFyIG91dCA9IFtdOwogICAgICAgICAgaWYgKG5vbnNlbGVjdGFibGUpIHsKICAgICAgICAgICAgc2VsZWN0ZWQzLm1hcChmdW5jdGlvbihpaikgewogICAgICAgICAgICAgIC8vIHNob3VsZCBtYWtlIHNlbGVjdGFibGUzIHBvc2l0aXZlCiAgICAgICAgICAgICAgaWYgKGZpbmRJbmRleChbLWlqWzBdLCAtaWpbMV1dLCBzZWxlY3RhYmxlMykgPT09IC0xKSB7IG91dC5wdXNoKGlqKTsgfQogICAgICAgICAgICB9KTsKICAgICAgICAgIH0gZWxzZSB7CiAgICAgICAgICAgIHNlbGVjdGVkMy5tYXAoZnVuY3Rpb24oaWopIHsKICAgICAgICAgICAgICBpZiAoZmluZEluZGV4KGlqLCBzZWxlY3RhYmxlMykgPiAtMSkgeyBvdXQucHVzaChpaik7IH0KICAgICAgICAgICAgfSk7CiAgICAgICAgICB9CiAgICAgICAgICBzZWxlY3RlZDMgPSBvdXQ7CiAgICAgICAgfQogICAgICAgIC8vIENoYW5nZSBzZWxlY3RlZDMncyB2YWx1ZSBiYXNlZCBvbiBzZWxlY3RhYmxlMywgdGhlbgogICAgICAgIC8vIHJlZnJlc2ggdGhlIGNlbGwgc2VsZWN0aW9uIHN0YXRlIGFjY29yZGluZyB0byB2YWx1ZXMgaW4gc2VsZWN0ZWQzCiAgICAgICAgdmFyIHNlbGVjdENlbGxzID0gZnVuY3Rpb24oaWdub3JlU2VsZWN0YWJsZSkgewogICAgICAgICAgaWYgKCFpZ25vcmVTZWxlY3RhYmxlKSBvbmx5S2VlcFNlbGVjdGFibGVDZWxscygpOwogICAgICAgICAgdGFibGUuJCgndGQuJyArIHNlbENsYXNzKS5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICBpZiAoc2VsZWN0ZWQzLmxlbmd0aCA9PT0gMCkgcmV0dXJuOwogICAgICAgICAgaWYgKHNlcnZlcikgewogICAgICAgICAgICB0YWJsZS5jZWxscyh7cGFnZTogJ2N1cnJlbnQnfSkuZXZlcnkoZnVuY3Rpb24oKSB7CiAgICAgICAgICAgICAgdmFyIGluZm8gPSB0d2Vha0NlbGxJbmRleCh0aGlzKTsKICAgICAgICAgICAgICBpZiAoZmluZEluZGV4KFtpbmZvLnJvdywgaW5mby5jb2xdLCBzZWxlY3RlZDMpID4gLTEpCiAgICAgICAgICAgICAgICAkKHRoaXMubm9kZSgpKS5hZGRDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICAgIH0pOwogICAgICAgICAgfSBlbHNlIHsKICAgICAgICAgICAgc2VsZWN0ZWQzLm1hcChmdW5jdGlvbihpaikgewogICAgICAgICAgICAgICQodGFibGUuY2VsbChpalswXSAtIDEsIGlqWzFdKS5ub2RlKCkpLmFkZENsYXNzKHNlbENsYXNzKTsKICAgICAgICAgICAgfSk7CiAgICAgICAgICB9CiAgICAgICAgfTsKICAgICAgICB0YWJsZS5vbignY2xpY2suZHQnLCAndGJvZHkgdGQnLCBmdW5jdGlvbigpIHsKICAgICAgICAgIHZhciAkdGhpcyA9ICQodGhpcyksIGluZm8gPSB0d2Vha0NlbGxJbmRleCh0YWJsZS5jZWxsKHRoaXMpKTsKICAgICAgICAgIGlmICgkdGhpcy5oYXNDbGFzcyhzZWxDbGFzcykpIHsKICAgICAgICAgICAgJHRoaXMucmVtb3ZlQ2xhc3Moc2VsQ2xhc3MpOwogICAgICAgICAgICBzZWxlY3RlZDMuc3BsaWNlKGZpbmRJbmRleChbaW5mby5yb3csIGluZm8uY29sXSwgc2VsZWN0ZWQzKSwgMSk7CiAgICAgICAgICB9IGVsc2UgewogICAgICAgICAgICBpZiAoc2VsTW9kZSA9PT0gJ3NpbmdsZScpICQodGFibGUuY2VsbHMoKS5ub2RlcygpKS5yZW1vdmVDbGFzcyhzZWxDbGFzcyk7CiAgICAgICAgICAgICR0aGlzLmFkZENsYXNzKHNlbENsYXNzKTsKICAgICAgICAgICAgc2VsZWN0ZWQzID0gc2VsTW9kZSA9PT0gJ3NpbmdsZScgPyBbW2luZm8ucm93LCBpbmZvLmNvbF1dIDoKICAgICAgICAgICAgICB1bmlxdWUoc2VsZWN0ZWQzLmNvbmNhdChbW2luZm8ucm93LCBpbmZvLmNvbF1dKSk7CiAgICAgICAgICB9CiAgICAgICAgICBzZWxlY3RDZWxscyhmYWxzZSk7IC8vIG11c3QgY2FsbCB0aGlzIHRvIHVwZGF0ZSBzZWxlY3RlZDMgYmFzZWQgb24gc2VsZWN0YWJsZTMKICAgICAgICAgIGNoYW5nZUlucHV0KCdjZWxsc19zZWxlY3RlZCcsIHRyYW5zcG9zZUFycmF5MkQoc2VsZWN0ZWQzKSwgJ3NoaW55Lm1hdHJpeCcpOwogICAgICAgIH0pOwogICAgICAgIHNlbGVjdENlbGxzKGZhbHNlKTsgIC8vIGluIGNhc2UgdXNlcnMgaGF2ZSBzcGVjaWZpZWQgcHJlLXNlbGVjdGVkIGNvbHVtbnMKICAgICAgICBjaGFuZ2VJbnB1dCgnY2VsbHNfc2VsZWN0ZWQnLCB0cmFuc3Bvc2VBcnJheTJEKHNlbGVjdGVkMyksICdzaGlueS5tYXRyaXgnKTsKCiAgICAgICAgaWYgKHNlcnZlcikgdGFibGUub24oJ2RyYXcuZHQnLCBmdW5jdGlvbihlKSB7IHNlbGVjdENlbGxzKGZhbHNlKTsgfSk7CiAgICAgICAgbWV0aG9kcy5zZWxlY3RDZWxscyA9IGZ1bmN0aW9uKHNlbGVjdGVkLCBpZ25vcmVTZWxlY3RhYmxlKSB7CiAgICAgICAgICBzZWxlY3RlZDMgPSBzZWxlY3RlZCA/IHNlbGVjdGVkIDogW107CiAgICAgICAgICBzZWxlY3RDZWxscyhpZ25vcmVTZWxlY3RhYmxlKTsKICAgICAgICAgIGNoYW5nZUlucHV0KCdjZWxsc19zZWxlY3RlZCcsIHRyYW5zcG9zZUFycmF5MkQoc2VsZWN0ZWQzKSwgJ3NoaW55Lm1hdHJpeCcpOwogICAgICAgIH0KICAgICAgfQogICAgfQoKICAgIC8vIGV4cG9zZSBzb21lIHRhYmxlIGluZm8gdG8gU2hpbnkKICAgIHZhciB1cGRhdGVUYWJsZUluZm8gPSBmdW5jdGlvbihlLCBzZXR0aW5ncykgewogICAgICAvLyBUT0RPOiBpcyBhbnlvbmUgaW50ZXJlc3RlZCBpbiB0aGUgcGFnZSBpbmZvPwogICAgICAvLyBjaGFuZ2VJbnB1dCgncGFnZV9pbmZvJywgdGFibGUucGFnZS5pbmZvKCkpOwogICAgICB2YXIgdXBkYXRlUm93SW5mbyA9IGZ1bmN0aW9uKGlkLCBtb2RpZmllcikgewogICAgICAgIHZhciBpZHg7CiAgICAgICAgaWYgKHNlcnZlcikgewogICAgICAgICAgaWR4ID0gbW9kaWZpZXIucGFnZSA9PT0gJ2N1cnJlbnQnID8gRFRfcm93c19jdXJyZW50IDogRFRfcm93c19hbGw7CiAgICAgICAgfSBlbHNlIHsKICAgICAgICAgIHZhciByb3dzID0gdGFibGUucm93cygkLmV4dGVuZCh7CiAgICAgICAgICAgIHNlYXJjaDogJ2FwcGxpZWQnLAogICAgICAgICAgICBwYWdlOiAnYWxsJwogICAgICAgICAgfSwgbW9kaWZpZXIpKTsKICAgICAgICAgIGlkeCA9IGFkZE9uZShyb3dzLmluZGV4ZXMoKS50b0FycmF5KCkpOwogICAgICAgIH0KICAgICAgICBjaGFuZ2VJbnB1dCgncm93cycgKyAnXycgKyBpZCwgaWR4KTsKICAgICAgfTsKICAgICAgdXBkYXRlUm93SW5mbygnY3VycmVudCcsIHtwYWdlOiAnY3VycmVudCd9KTsKICAgICAgdXBkYXRlUm93SW5mbygnYWxsJywge30pOwogICAgfQogICAgdGFibGUub24oJ2RyYXcuZHQnLCB1cGRhdGVUYWJsZUluZm8pOwogICAgdXBkYXRlVGFibGVJbmZvKCk7CgogICAgLy8gc3RhdGUgaW5mbwogICAgdGFibGUub24oJ2RyYXcuZHQgY29sdW1uLXZpc2liaWxpdHkuZHQnLCBmdW5jdGlvbigpIHsKICAgICAgY2hhbmdlSW5wdXQoJ3N0YXRlJywgdGFibGUuc3RhdGUoKSk7CiAgICB9KTsKICAgIGNoYW5nZUlucHV0KCdzdGF0ZScsIHRhYmxlLnN0YXRlKCkpOwoKICAgIC8vIHNlYXJjaCBpbmZvCiAgICB2YXIgdXBkYXRlU2VhcmNoSW5mbyA9IGZ1bmN0aW9uKCkgewogICAgICBjaGFuZ2VJbnB1dCgnc2VhcmNoJywgdGFibGUuc2VhcmNoKCkpOwogICAgICBpZiAoZmlsdGVyUm93KSBjaGFuZ2VJbnB1dCgnc2VhcmNoX2NvbHVtbnMnLCBmaWx0ZXJSb3cudG9BcnJheSgpLm1hcChmdW5jdGlvbih0ZCkgewogICAgICAgIHJldHVybiAkKHRkKS5maW5kKCdpbnB1dCcpLmZpcnN0KCkudmFsKCk7CiAgICAgIH0pKTsKICAgIH0KICAgIHRhYmxlLm9uKCdkcmF3LmR0JywgdXBkYXRlU2VhcmNoSW5mbyk7CiAgICB1cGRhdGVTZWFyY2hJbmZvKCk7CgogICAgdmFyIGNlbGxJbmZvID0gZnVuY3Rpb24odGhpeikgewogICAgICB2YXIgaW5mbyA9IHR3ZWFrQ2VsbEluZGV4KHRhYmxlLmNlbGwodGhpeikpOwogICAgICBpbmZvLnZhbHVlID0gdGFibGUuY2VsbCh0aGl6KS5kYXRhKCk7CiAgICAgIHJldHVybiBpbmZvOwogICAgfQogICAgLy8gdGhlIGN1cnJlbnQgY2VsbCBjbGlja2VkIG9uCiAgICB0YWJsZS5vbignY2xpY2suZHQnLCAndGJvZHkgdGQnLCBmdW5jdGlvbigpIHsKICAgICAgY2hhbmdlSW5wdXQoJ2NlbGxfY2xpY2tlZCcsIGNlbGxJbmZvKHRoaXMpLCBudWxsLCBudWxsLCB7cHJpb3JpdHk6ICdldmVudCd9KTsKICAgIH0pCiAgICBjaGFuZ2VJbnB1dCgnY2VsbF9jbGlja2VkJywge30pOwoKICAgIC8vIGRvIG5vdCB0cmlnZ2VyIHRhYmxlIHNlbGVjdGlvbiB3aGVuIGNsaWNraW5nIG9uIGxpbmtzIHVubGVzcyB0aGV5IGhhdmUgY2xhc3NlcwogICAgdGFibGUub24oJ2NsaWNrLmR0JywgJ3Rib2R5IHRkIGEnLCBmdW5jdGlvbihlKSB7CiAgICAgIGlmICh0aGlzLmNsYXNzTmFtZSA9PT0gJycpIGUuc3RvcFByb3BhZ2F0aW9uKCk7CiAgICB9KTsKCiAgICBtZXRob2RzLmFkZFJvdyA9IGZ1bmN0aW9uKGRhdGEsIHJvd25hbWUsIHJlc2V0UGFnaW5nKSB7CiAgICAgIHZhciBuID0gdGFibGUuY29sdW1ucygpLmluZGV4ZXMoKS5sZW5ndGgsIGQgPSBuIC0gZGF0YS5sZW5ndGg7CiAgICAgIGlmIChkID09PSAxKSB7CiAgICAgICAgZGF0YSA9IHJvd25hbWUuY29uY2F0KGRhdGEpCiAgICAgIH0gZWxzZSBpZiAoZCAhPT0gMCkgewogICAgICAgIGNvbnNvbGUubG9nKGRhdGEpOwogICAgICAgIGNvbnNvbGUubG9nKHRhYmxlLmNvbHVtbnMoKS5pbmRleGVzKCkpOwogICAgICAgIHRocm93ICdOZXcgZGF0YSBtdXN0IGJlIG9mIHRoZSBzYW1lIGxlbmd0aCBhcyBjdXJyZW50IGRhdGEgKCcgKyBuICsgJyknOwogICAgICB9OwogICAgICB0YWJsZS5yb3cuYWRkKGRhdGEpLmRyYXcocmVzZXRQYWdpbmcpOwogICAgfQoKICAgIG1ldGhvZHMudXBkYXRlU2VhcmNoID0gZnVuY3Rpb24oa2V5d29yZHMpIHsKICAgICAgaWYgKGtleXdvcmRzLmdsb2JhbCAhPT0gbnVsbCkKICAgICAgICAkKHRhYmxlLnRhYmxlKCkuY29udGFpbmVyKCkpLmZpbmQoJ2lucHV0W3R5cGU9c2VhcmNoXScpLmZpcnN0KCkKICAgICAgICAgICAgIC52YWwoa2V5d29yZHMuZ2xvYmFsKS50cmlnZ2VyKCdpbnB1dCcpOwogICAgICB2YXIgY29sdW1ucyA9IGtleXdvcmRzLmNvbHVtbnM7CiAgICAgIGlmICghZmlsdGVyUm93IHx8IGNvbHVtbnMgPT09IG51bGwpIHJldHVybjsKICAgICAgZmlsdGVyUm93LnRvQXJyYXkoKS5tYXAoZnVuY3Rpb24odGQsIGkpIHsKICAgICAgICB2YXIgdiA9IHR5cGVvZiBjb2x1bW5zID09PSAnc3RyaW5nJyA/IGNvbHVtbnMgOiBjb2x1bW5zW2ldOwogICAgICAgIGlmICh0eXBlb2YgdiA9PT0gJ3VuZGVmaW5lZCcpIHsKICAgICAgICAgIGNvbnNvbGUubG9nKCdUaGUgc2VhcmNoIGtleXdvcmQgZm9yIGNvbHVtbiAnICsgaSArICcgaXMgdW5kZWZpbmVkJykKICAgICAgICAgIHJldHVybjsKICAgICAgICB9CiAgICAgICAgJCh0ZCkuZmluZCgnaW5wdXQnKS5maXJzdCgpLnZhbCh2KS50cmlnZ2VyKCdpbnB1dCcpOwogICAgICAgIHNlYXJjaENvbHVtbihpLCB2KTsKICAgICAgfSk7CiAgICAgIHRhYmxlLmRyYXcoKTsKICAgIH0KCiAgICBtZXRob2RzLmhpZGVDb2xzID0gZnVuY3Rpb24oaGlkZSwgcmVzZXQpIHsKICAgICAgaWYgKHJlc2V0KSB0YWJsZS5jb2x1bW5zKCkudmlzaWJsZSh0cnVlLCBmYWxzZSk7CiAgICAgIHRhYmxlLmNvbHVtbnMoaGlkZSkudmlzaWJsZShmYWxzZSk7CiAgICB9CgogICAgbWV0aG9kcy5zaG93Q29scyA9IGZ1bmN0aW9uKHNob3csIHJlc2V0KSB7CiAgICAgIGlmIChyZXNldCkgdGFibGUuY29sdW1ucygpLnZpc2libGUoZmFsc2UsIGZhbHNlKTsKICAgICAgdGFibGUuY29sdW1ucyhzaG93KS52aXNpYmxlKHRydWUpOwogICAgfQoKICAgIG1ldGhvZHMuY29sUmVvcmRlciA9IGZ1bmN0aW9uKG9yZGVyLCBvcmlnT3JkZXIpIHsKICAgICAgdGFibGUuY29sUmVvcmRlci5vcmRlcihvcmRlciwgb3JpZ09yZGVyKTsKICAgIH0KCiAgICBtZXRob2RzLnNlbGVjdFBhZ2UgPSBmdW5jdGlvbihwYWdlKSB7CiAgICAgIGlmICh0YWJsZS5wYWdlLmluZm8oKS5wYWdlcyA8IHBhZ2UgfHwgcGFnZSA8IDEpIHsKICAgICAgICB0aHJvdyAnU2VsZWN0ZWQgcGFnZSBpcyBvdXQgb2YgcmFuZ2UnOwogICAgICB9OwogICAgICB0YWJsZS5wYWdlKHBhZ2UgLSAxKS5kcmF3KGZhbHNlKTsKICAgIH0KCiAgICBtZXRob2RzLnJlbG9hZERhdGEgPSBmdW5jdGlvbihyZXNldFBhZ2luZywgY2xlYXJTZWxlY3Rpb24pIHsKICAgICAgLy8gZW1wdHkgc2VsZWN0aW9ucyBmaXJzdCBpZiBuZWNlc3NhcnkKICAgICAgaWYgKG1ldGhvZHMuc2VsZWN0Um93cyAmJiBpbkFycmF5KCdyb3cnLCBjbGVhclNlbGVjdGlvbikpIG1ldGhvZHMuc2VsZWN0Um93cyhbXSk7CiAgICAgIGlmIChtZXRob2RzLnNlbGVjdENvbHVtbnMgJiYgaW5BcnJheSgnY29sdW1uJywgY2xlYXJTZWxlY3Rpb24pKSBtZXRob2RzLnNlbGVjdENvbHVtbnMoW10pOwogICAgICBpZiAobWV0aG9kcy5zZWxlY3RDZWxscyAmJiBpbkFycmF5KCdjZWxsJywgY2xlYXJTZWxlY3Rpb24pKSBtZXRob2RzLnNlbGVjdENlbGxzKFtdKTsKICAgICAgdGFibGUuYWpheC5yZWxvYWQobnVsbCwgcmVzZXRQYWdpbmcpOwogICAgfQoKICAgIC8vIHVwZGF0ZSB0YWJsZSBmaWx0ZXJzIChzZXQgbmV3IGxpbWl0cyBvZiBzbGlkZXJzKQogICAgbWV0aG9kcy51cGRhdGVGaWx0ZXJzID0gZnVuY3Rpb24obmV3UHJvcHMpIHsKICAgICAgLy8gbG9vcCB0aHJvdWdoIGVhY2ggZmlsdGVyIGluIHRoZSBmaWx0ZXIgcm93CiAgICAgIGZpbHRlclJvdy5lYWNoKGZ1bmN0aW9uKGksIHRkKSB7CiAgICAgICAgdmFyIGsgPSBpOwogICAgICAgIGlmIChmaWx0ZXJSb3cubGVuZ3RoID4gbmV3UHJvcHMubGVuZ3RoKSB7CiAgICAgICAgICBpZiAoaSA9PT0gMCkgcmV0dXJuOyAgLy8gZmlyc3QgY29sdW1uIGlzIHJvdyBuYW1lcwogICAgICAgICAgayA9IGkgLSAxOwogICAgICAgIH0KICAgICAgICAvLyBVcGRhdGUgdGhlIGZpbHRlcnMgdG8gcmVmbGVjdCB0aGUgdXBkYXRlZCBkYXRhLgogICAgICAgIC8vIEFsbG93ICJmYWxzeSIgKGUuZy4gTlVMTCkgdG8gc2lnbmlmeSBhIG5vLW9wLgogICAgICAgIGlmIChuZXdQcm9wc1trXSkgewogICAgICAgICAgc2V0RmlsdGVyUHJvcHModGQsIG5ld1Byb3BzW2tdKTsKICAgICAgICB9CiAgICAgIH0pOwogICAgfTsKCiAgICB0YWJsZS5zaGlueU1ldGhvZHMgPSBtZXRob2RzOwogIH0sCiAgcmVzaXplOiBmdW5jdGlvbihlbCwgd2lkdGgsIGhlaWdodCwgaW5zdGFuY2UpIHsKICAgIGlmIChpbnN0YW5jZS5kYXRhKSB0aGlzLnJlbmRlclZhbHVlKGVsLCBpbnN0YW5jZS5kYXRhLCBpbnN0YW5jZSk7CgogICAgLy8gZHluYW1pY2FsbHkgYWRqdXN0IGhlaWdodCBpZiBmaWxsQ29udGFpbmVyID0gVFJVRQogICAgaWYgKGluc3RhbmNlLmZpbGxDb250YWluZXIpCiAgICAgIHRoaXMuZmlsbEF2YWlsYWJsZUhlaWdodChlbCwgaGVpZ2h0KTsKCiAgICB0aGlzLmFkanVzdFdpZHRoKGVsKTsKICB9LAoKICAvLyBkeW5hbWljYWxseSBzZXQgdGhlIHNjcm9sbCBib2R5IHRvIGZpbGwgYXZhaWxhYmxlIGhlaWdodAogIC8vICh1c2VkIHdpdGggZmlsbENvbnRhaW5lciA9IFRSVUUpCiAgZmlsbEF2YWlsYWJsZUhlaWdodDogZnVuY3Rpb24oZWwsIGF2YWlsYWJsZUhlaWdodCkgewoKICAgIC8vIHNlZSBob3cgbXVjaCBvZiB0aGUgdGFibGUgaXMgb2NjdXBpZWQgYnkgaGVhZGVyL2Zvb3RlciBlbGVtZW50cwogICAgLy8gYW5kIHVzZSB0aGF0IHRvIGNvbXB1dGUgYSB0YXJnZXQgc2Nyb2xsIGJvZHkgaGVpZ2h0CiAgICB2YXIgZHRXcmFwcGVyID0gJChlbCkuZmluZCgnZGl2LmRhdGFUYWJsZXNfd3JhcHBlcicpOwogICAgdmFyIGR0U2Nyb2xsQm9keSA9ICQoZWwpLmZpbmQoJCgnZGl2LmRhdGFUYWJsZXNfc2Nyb2xsQm9keScpKTsKICAgIHZhciBmcmFtaW5nSGVpZ2h0ID0gZHRXcmFwcGVyLmlubmVySGVpZ2h0KCkgLSBkdFNjcm9sbEJvZHkuaW5uZXJIZWlnaHQoKTsKICAgIHZhciBzY3JvbGxCb2R5SGVpZ2h0ID0gYXZhaWxhYmxlSGVpZ2h0IC0gZnJhbWluZ0hlaWdodDsKCiAgICAvLyB3ZSBuZWVkIHRvIHNldCBgbWF4LWhlaWdodGAgdG8gbm9uZSBhcyBkYXRhdGFibGVzIGxpYnJhcnkgbm93IHNldHMgdGhpcwogICAgLy8gdG8gYSBmaXhlZCBoZWlnaHQsIGRpc2FibGluZyB0aGUgYWJpbGl0eSB0byByZXNpemUgdG8gZmlsbCB0aGUgd2luZG93LAogICAgLy8gYXMgaXQgd2lsbCBiZSBzZXQgdG8gYSBmaXhlZCAxMDBweCB1bmRlciBzdWNoIGNpcmN1bXN0YW5jZXMsIGUuZy4sIFJTdHVkaW8gSURFLAogICAgLy8gb3IgRmxleERhc2hib2FyZAogICAgLy8gc2VlIGh0dHBzOi8vZ2l0aHViLmNvbS9yc3R1ZGlvL0RUL2lzc3Vlcy85NTEjaXNzdWVjb21tZW50LTEwMjY0NjQ1MDkKICAgIGR0U2Nyb2xsQm9keS5jc3MoJ21heC1oZWlnaHQnLCAnbm9uZScpOwogICAgLy8gc2V0IHRoZSBoZWlnaHQKICAgIGR0U2Nyb2xsQm9keS5oZWlnaHQoc2Nyb2xsQm9keUhlaWdodCArICdweCcpOwogIH0sCgogIC8vIGFkanVzdCB0aGUgd2lkdGggb2YgY29sdW1uczsgcmVtb3ZlIHRoZSBoYXJkLWNvZGVkIHdpZHRocyBvbiB0YWJsZSBhbmQgdGhlCiAgLy8gc2Nyb2xsIGhlYWRlciB3aGVuIHNjcm9sbFgvWSBhcmUgZW5hYmxlZAogIGFkanVzdFdpZHRoOiBmdW5jdGlvbihlbCkgewogICAgdmFyICRlbCA9ICQoZWwpLCB0YWJsZSA9ICRlbC5kYXRhKCdkYXRhdGFibGUnKTsKICAgIGlmICh0YWJsZSkgdGFibGUuY29sdW1ucy5hZGp1c3QoKTsKICAgICRlbC5maW5kKCcuZGF0YVRhYmxlc19zY3JvbGxIZWFkSW5uZXInKS5jc3MoJ3dpZHRoJywgJycpCiAgICAgICAgLmNoaWxkcmVuKCd0YWJsZScpLmNzcygnbWFyZ2luLWxlZnQnLCAnJyk7CiAgfQp9KTsKCiAgaWYgKCFIVE1MV2lkZ2V0cy5zaGlueU1vZGUpIHJldHVybjsKCiAgU2hpbnkuYWRkQ3VzdG9tTWVzc2FnZUhhbmRsZXIoJ2RhdGF0YWJsZS1jYWxscycsIGZ1bmN0aW9uKGRhdGEpIHsKICAgIHZhciBpZCA9IGRhdGEuaWQ7CiAgICB2YXIgZWwgPSBkb2N1bWVudC5nZXRFbGVtZW50QnlJZChpZCk7CiAgICB2YXIgdGFibGUgPSBlbCA/ICQoZWwpLmRhdGEoJ2RhdGF0YWJsZScpIDogbnVsbDsKICAgIGlmICghdGFibGUpIHsKICAgICAgY29uc29sZS5sb2coIkNvdWxkbid0IGZpbmQgdGFibGUgd2l0aCBpZCAiICsgaWQpOwogICAgICByZXR1cm47CiAgICB9CgogICAgdmFyIG1ldGhvZHMgPSB0YWJsZS5zaGlueU1ldGhvZHMsIGNhbGwgPSBkYXRhLmNhbGw7CiAgICBpZiAobWV0aG9kc1tjYWxsLm1ldGhvZF0pIHsKICAgICAgbWV0aG9kc1tjYWxsLm1ldGhvZF0uYXBwbHkodGFibGUsIGNhbGwuYXJncyk7CiAgICB9IGVsc2UgewogICAgICBjb25zb2xlLmxvZygiVW5rbm93biBtZXRob2QgIiArIGNhbGwubWV0aG9kKTsKICAgIH0KICB9KTsKCn0pKCk7Cg==\"></script>\n",
       "<script title=\"jquery\" src=\"data:application/javascript;base64,LyohIGpRdWVyeSB2My42LjAgfCAoYykgT3BlbkpTIEZvdW5kYXRpb24gYW5kIG90aGVyIGNvbnRyaWJ1dG9ycyB8IGpxdWVyeS5vcmcvbGljZW5zZSAqLwohZnVuY3Rpb24oZSx0KXsidXNlIHN0cmljdCI7Im9iamVjdCI9PXR5cGVvZiBtb2R1bGUmJiJvYmplY3QiPT10eXBlb2YgbW9kdWxlLmV4cG9ydHM/bW9kdWxlLmV4cG9ydHM9ZS5kb2N1bWVudD90KGUsITApOmZ1bmN0aW9uKGUpe2lmKCFlLmRvY3VtZW50KXRocm93IG5ldyBFcnJvcigialF1ZXJ5IHJlcXVpcmVzIGEgd2luZG93IHdpdGggYSBkb2N1bWVudCIpO3JldHVybiB0KGUpfTp0KGUpfSgidW5kZWZpbmVkIiE9dHlwZW9mIHdpbmRvdz93aW5kb3c6dGhpcyxmdW5jdGlvbihDLGUpeyJ1c2Ugc3RyaWN0Ijt2YXIgdD1bXSxyPU9iamVjdC5nZXRQcm90b3R5cGVPZixzPXQuc2xpY2UsZz10LmZsYXQ/ZnVuY3Rpb24oZSl7cmV0dXJuIHQuZmxhdC5jYWxsKGUpfTpmdW5jdGlvbihlKXtyZXR1cm4gdC5jb25jYXQuYXBwbHkoW10sZSl9LHU9dC5wdXNoLGk9dC5pbmRleE9mLG49e30sbz1uLnRvU3RyaW5nLHY9bi5oYXNPd25Qcm9wZXJ0eSxhPXYudG9TdHJpbmcsbD1hLmNhbGwoT2JqZWN0KSx5PXt9LG09ZnVuY3Rpb24oZSl7cmV0dXJuImZ1bmN0aW9uIj09dHlwZW9mIGUmJiJudW1iZXIiIT10eXBlb2YgZS5ub2RlVHlwZSYmImZ1bmN0aW9uIiE9dHlwZW9mIGUuaXRlbX0seD1mdW5jdGlvbihlKXtyZXR1cm4gbnVsbCE9ZSYmZT09PWUud2luZG93fSxFPUMuZG9jdW1lbnQsYz17dHlwZTohMCxzcmM6ITAsbm9uY2U6ITAsbm9Nb2R1bGU6ITB9O2Z1bmN0aW9uIGIoZSx0LG4pe3ZhciByLGksbz0obj1ufHxFKS5jcmVhdGVFbGVtZW50KCJzY3JpcHQiKTtpZihvLnRleHQ9ZSx0KWZvcihyIGluIGMpKGk9dFtyXXx8dC5nZXRBdHRyaWJ1dGUmJnQuZ2V0QXR0cmlidXRlKHIpKSYmby5zZXRBdHRyaWJ1dGUocixpKTtuLmhlYWQuYXBwZW5kQ2hpbGQobykucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChvKX1mdW5jdGlvbiB3KGUpe3JldHVybiBudWxsPT1lP2UrIiI6Im9iamVjdCI9PXR5cGVvZiBlfHwiZnVuY3Rpb24iPT10eXBlb2YgZT9uW28uY2FsbChlKV18fCJvYmplY3QiOnR5cGVvZiBlfXZhciBmPSIzLjYuMCIsUz1mdW5jdGlvbihlLHQpe3JldHVybiBuZXcgUy5mbi5pbml0KGUsdCl9O2Z1bmN0aW9uIHAoZSl7dmFyIHQ9ISFlJiYibGVuZ3RoImluIGUmJmUubGVuZ3RoLG49dyhlKTtyZXR1cm4hbShlKSYmIXgoZSkmJigiYXJyYXkiPT09bnx8MD09PXR8fCJudW1iZXIiPT10eXBlb2YgdCYmMDx0JiZ0LTEgaW4gZSl9Uy5mbj1TLnByb3RvdHlwZT17anF1ZXJ5OmYsY29uc3RydWN0b3I6UyxsZW5ndGg6MCx0b0FycmF5OmZ1bmN0aW9uKCl7cmV0dXJuIHMuY2FsbCh0aGlzKX0sZ2V0OmZ1bmN0aW9uKGUpe3JldHVybiBudWxsPT1lP3MuY2FsbCh0aGlzKTplPDA/dGhpc1tlK3RoaXMubGVuZ3RoXTp0aGlzW2VdfSxwdXNoU3RhY2s6ZnVuY3Rpb24oZSl7dmFyIHQ9Uy5tZXJnZSh0aGlzLmNvbnN0cnVjdG9yKCksZSk7cmV0dXJuIHQucHJldk9iamVjdD10aGlzLHR9LGVhY2g6ZnVuY3Rpb24oZSl7cmV0dXJuIFMuZWFjaCh0aGlzLGUpfSxtYXA6ZnVuY3Rpb24obil7cmV0dXJuIHRoaXMucHVzaFN0YWNrKFMubWFwKHRoaXMsZnVuY3Rpb24oZSx0KXtyZXR1cm4gbi5jYWxsKGUsdCxlKX0pKX0sc2xpY2U6ZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5wdXNoU3RhY2socy5hcHBseSh0aGlzLGFyZ3VtZW50cykpfSxmaXJzdDpmdW5jdGlvbigpe3JldHVybiB0aGlzLmVxKDApfSxsYXN0OmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuZXEoLTEpfSxldmVuOmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMucHVzaFN0YWNrKFMuZ3JlcCh0aGlzLGZ1bmN0aW9uKGUsdCl7cmV0dXJuKHQrMSklMn0pKX0sb2RkOmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMucHVzaFN0YWNrKFMuZ3JlcCh0aGlzLGZ1bmN0aW9uKGUsdCl7cmV0dXJuIHQlMn0pKX0sZXE6ZnVuY3Rpb24oZSl7dmFyIHQ9dGhpcy5sZW5ndGgsbj0rZSsoZTwwP3Q6MCk7cmV0dXJuIHRoaXMucHVzaFN0YWNrKDA8PW4mJm48dD9bdGhpc1tuXV06W10pfSxlbmQ6ZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5wcmV2T2JqZWN0fHx0aGlzLmNvbnN0cnVjdG9yKCl9LHB1c2g6dSxzb3J0OnQuc29ydCxzcGxpY2U6dC5zcGxpY2V9LFMuZXh0ZW5kPVMuZm4uZXh0ZW5kPWZ1bmN0aW9uKCl7dmFyIGUsdCxuLHIsaSxvLGE9YXJndW1lbnRzWzBdfHx7fSxzPTEsdT1hcmd1bWVudHMubGVuZ3RoLGw9ITE7Zm9yKCJib29sZWFuIj09dHlwZW9mIGEmJihsPWEsYT1hcmd1bWVudHNbc118fHt9LHMrKyksIm9iamVjdCI9PXR5cGVvZiBhfHxtKGEpfHwoYT17fSkscz09PXUmJihhPXRoaXMscy0tKTtzPHU7cysrKWlmKG51bGwhPShlPWFyZ3VtZW50c1tzXSkpZm9yKHQgaW4gZSlyPWVbdF0sIl9fcHJvdG9fXyIhPT10JiZhIT09ciYmKGwmJnImJihTLmlzUGxhaW5PYmplY3Qocil8fChpPUFycmF5LmlzQXJyYXkocikpKT8obj1hW3RdLG89aSYmIUFycmF5LmlzQXJyYXkobik/W106aXx8Uy5pc1BsYWluT2JqZWN0KG4pP246e30saT0hMSxhW3RdPVMuZXh0ZW5kKGwsbyxyKSk6dm9pZCAwIT09ciYmKGFbdF09cikpO3JldHVybiBhfSxTLmV4dGVuZCh7ZXhwYW5kbzoialF1ZXJ5IisoZitNYXRoLnJhbmRvbSgpKS5yZXBsYWNlKC9cRC9nLCIiKSxpc1JlYWR5OiEwLGVycm9yOmZ1bmN0aW9uKGUpe3Rocm93IG5ldyBFcnJvcihlKX0sbm9vcDpmdW5jdGlvbigpe30saXNQbGFpbk9iamVjdDpmdW5jdGlvbihlKXt2YXIgdCxuO3JldHVybiEoIWV8fCJbb2JqZWN0IE9iamVjdF0iIT09by5jYWxsKGUpKSYmKCEodD1yKGUpKXx8ImZ1bmN0aW9uIj09dHlwZW9mKG49di5jYWxsKHQsImNvbnN0cnVjdG9yIikmJnQuY29uc3RydWN0b3IpJiZhLmNhbGwobik9PT1sKX0saXNFbXB0eU9iamVjdDpmdW5jdGlvbihlKXt2YXIgdDtmb3IodCBpbiBlKXJldHVybiExO3JldHVybiEwfSxnbG9iYWxFdmFsOmZ1bmN0aW9uKGUsdCxuKXtiKGUse25vbmNlOnQmJnQubm9uY2V9LG4pfSxlYWNoOmZ1bmN0aW9uKGUsdCl7dmFyIG4scj0wO2lmKHAoZSkpe2ZvcihuPWUubGVuZ3RoO3I8bjtyKyspaWYoITE9PT10LmNhbGwoZVtyXSxyLGVbcl0pKWJyZWFrfWVsc2UgZm9yKHIgaW4gZSlpZighMT09PXQuY2FsbChlW3JdLHIsZVtyXSkpYnJlYWs7cmV0dXJuIGV9LG1ha2VBcnJheTpmdW5jdGlvbihlLHQpe3ZhciBuPXR8fFtdO3JldHVybiBudWxsIT1lJiYocChPYmplY3QoZSkpP1MubWVyZ2Uobiwic3RyaW5nIj09dHlwZW9mIGU/W2VdOmUpOnUuY2FsbChuLGUpKSxufSxpbkFycmF5OmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gbnVsbD09dD8tMTppLmNhbGwodCxlLG4pfSxtZXJnZTpmdW5jdGlvbihlLHQpe2Zvcih2YXIgbj0rdC5sZW5ndGgscj0wLGk9ZS5sZW5ndGg7cjxuO3IrKyllW2krK109dFtyXTtyZXR1cm4gZS5sZW5ndGg9aSxlfSxncmVwOmZ1bmN0aW9uKGUsdCxuKXtmb3IodmFyIHI9W10saT0wLG89ZS5sZW5ndGgsYT0hbjtpPG87aSsrKSF0KGVbaV0saSkhPT1hJiZyLnB1c2goZVtpXSk7cmV0dXJuIHJ9LG1hcDpmdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvPTAsYT1bXTtpZihwKGUpKWZvcihyPWUubGVuZ3RoO288cjtvKyspbnVsbCE9KGk9dChlW29dLG8sbikpJiZhLnB1c2goaSk7ZWxzZSBmb3IobyBpbiBlKW51bGwhPShpPXQoZVtvXSxvLG4pKSYmYS5wdXNoKGkpO3JldHVybiBnKGEpfSxndWlkOjEsc3VwcG9ydDp5fSksImZ1bmN0aW9uIj09dHlwZW9mIFN5bWJvbCYmKFMuZm5bU3ltYm9sLml0ZXJhdG9yXT10W1N5bWJvbC5pdGVyYXRvcl0pLFMuZWFjaCgiQm9vbGVhbiBOdW1iZXIgU3RyaW5nIEZ1bmN0aW9uIEFycmF5IERhdGUgUmVnRXhwIE9iamVjdCBFcnJvciBTeW1ib2wiLnNwbGl0KCIgIiksZnVuY3Rpb24oZSx0KXtuWyJbb2JqZWN0ICIrdCsiXSJdPXQudG9Mb3dlckNhc2UoKX0pO3ZhciBkPWZ1bmN0aW9uKG4pe3ZhciBlLGQsYixvLGksaCxmLGcsdyx1LGwsVCxDLGEsRSx2LHMsYyx5LFM9InNpenpsZSIrMSpuZXcgRGF0ZSxwPW4uZG9jdW1lbnQsaz0wLHI9MCxtPXVlKCkseD11ZSgpLEE9dWUoKSxOPXVlKCksaj1mdW5jdGlvbihlLHQpe3JldHVybiBlPT09dCYmKGw9ITApLDB9LEQ9e30uaGFzT3duUHJvcGVydHksdD1bXSxxPXQucG9wLEw9dC5wdXNoLEg9dC5wdXNoLE89dC5zbGljZSxQPWZ1bmN0aW9uKGUsdCl7Zm9yKHZhciBuPTAscj1lLmxlbmd0aDtuPHI7bisrKWlmKGVbbl09PT10KXJldHVybiBuO3JldHVybi0xfSxSPSJjaGVja2VkfHNlbGVjdGVkfGFzeW5jfGF1dG9mb2N1c3xhdXRvcGxheXxjb250cm9sc3xkZWZlcnxkaXNhYmxlZHxoaWRkZW58aXNtYXB8bG9vcHxtdWx0aXBsZXxvcGVufHJlYWRvbmx5fHJlcXVpcmVkfHNjb3BlZCIsTT0iW1xceDIwXFx0XFxyXFxuXFxmXSIsST0iKD86XFxcXFtcXGRhLWZBLUZdezEsNn0iK00rIj98XFxcXFteXFxyXFxuXFxmXXxbXFx3LV18W15cMC1cXHg3Zl0pKyIsVz0iXFxbIitNKyIqKCIrSSsiKSg/OiIrTSsiKihbKl4kfCF+XT89KSIrTSsiKig/OicoKD86XFxcXC58W15cXFxcJ10pKiknfFwiKCg/OlxcXFwufFteXFxcXFwiXSkqKVwifCgiK0krIikpfCkiK00rIipcXF0iLEY9IjooIitJKyIpKD86XFwoKCgnKCg/OlxcXFwufFteXFxcXCddKSopJ3xcIigoPzpcXFxcLnxbXlxcXFxcIl0pKilcIil8KCg/OlxcXFwufFteXFxcXCgpW1xcXV18IitXKyIpKil8LiopXFwpfCkiLEI9bmV3IFJlZ0V4cChNKyIrIiwiZyIpLCQ9bmV3IFJlZ0V4cCgiXiIrTSsiK3woKD86XnxbXlxcXFxdKSg/OlxcXFwuKSopIitNKyIrJCIsImciKSxfPW5ldyBSZWdFeHAoIl4iK00rIiosIitNKyIqIiksej1uZXcgUmVnRXhwKCJeIitNKyIqKFs+K35dfCIrTSsiKSIrTSsiKiIpLFU9bmV3IFJlZ0V4cChNKyJ8PiIpLFg9bmV3IFJlZ0V4cChGKSxWPW5ldyBSZWdFeHAoIl4iK0krIiQiKSxHPXtJRDpuZXcgUmVnRXhwKCJeIygiK0krIikiKSxDTEFTUzpuZXcgUmVnRXhwKCJeXFwuKCIrSSsiKSIpLFRBRzpuZXcgUmVnRXhwKCJeKCIrSSsifFsqXSkiKSxBVFRSOm5ldyBSZWdFeHAoIl4iK1cpLFBTRVVETzpuZXcgUmVnRXhwKCJeIitGKSxDSElMRDpuZXcgUmVnRXhwKCJeOihvbmx5fGZpcnN0fGxhc3R8bnRofG50aC1sYXN0KS0oY2hpbGR8b2YtdHlwZSkoPzpcXCgiK00rIiooZXZlbnxvZGR8KChbKy1dfCkoXFxkKilufCkiK00rIiooPzooWystXXwpIitNKyIqKFxcZCspfCkpIitNKyIqXFwpfCkiLCJpIiksYm9vbDpuZXcgUmVnRXhwKCJeKD86IitSKyIpJCIsImkiKSxuZWVkc0NvbnRleHQ6bmV3IFJlZ0V4cCgiXiIrTSsiKls+K35dfDooZXZlbnxvZGR8ZXF8Z3R8bHR8bnRofGZpcnN0fGxhc3QpKD86XFwoIitNKyIqKCg/Oi1cXGQpP1xcZCopIitNKyIqXFwpfCkoPz1bXi1dfCQpIiwiaSIpfSxZPS9IVE1MJC9pLFE9L14oPzppbnB1dHxzZWxlY3R8dGV4dGFyZWF8YnV0dG9uKSQvaSxKPS9eaFxkJC9pLEs9L15bXntdK1x7XHMqXFtuYXRpdmUgXHcvLFo9L14oPzojKFtcdy1dKyl8KFx3Kyl8XC4oW1x3LV0rKSkkLyxlZT0vWyt+XS8sdGU9bmV3IFJlZ0V4cCgiXFxcXFtcXGRhLWZBLUZdezEsNn0iK00rIj98XFxcXChbXlxcclxcblxcZl0pIiwiZyIpLG5lPWZ1bmN0aW9uKGUsdCl7dmFyIG49IjB4IitlLnNsaWNlKDEpLTY1NTM2O3JldHVybiB0fHwobjwwP1N0cmluZy5mcm9tQ2hhckNvZGUobis2NTUzNik6U3RyaW5nLmZyb21DaGFyQ29kZShuPj4xMHw1NTI5NiwxMDIzJm58NTYzMjApKX0scmU9LyhbXDAtXHgxZlx4N2ZdfF4tP1xkKXxeLSR8W15cMC1ceDFmXHg3Zi1cdUZGRkZcdy1dL2csaWU9ZnVuY3Rpb24oZSx0KXtyZXR1cm4gdD8iXDAiPT09ZT8iXHVmZmZkIjplLnNsaWNlKDAsLTEpKyJcXCIrZS5jaGFyQ29kZUF0KGUubGVuZ3RoLTEpLnRvU3RyaW5nKDE2KSsiICI6IlxcIitlfSxvZT1mdW5jdGlvbigpe1QoKX0sYWU9YmUoZnVuY3Rpb24oZSl7cmV0dXJuITA9PT1lLmRpc2FibGVkJiYiZmllbGRzZXQiPT09ZS5ub2RlTmFtZS50b0xvd2VyQ2FzZSgpfSx7ZGlyOiJwYXJlbnROb2RlIixuZXh0OiJsZWdlbmQifSk7dHJ5e0guYXBwbHkodD1PLmNhbGwocC5jaGlsZE5vZGVzKSxwLmNoaWxkTm9kZXMpLHRbcC5jaGlsZE5vZGVzLmxlbmd0aF0ubm9kZVR5cGV9Y2F0Y2goZSl7SD17YXBwbHk6dC5sZW5ndGg/ZnVuY3Rpb24oZSx0KXtMLmFwcGx5KGUsTy5jYWxsKHQpKX06ZnVuY3Rpb24oZSx0KXt2YXIgbj1lLmxlbmd0aCxyPTA7d2hpbGUoZVtuKytdPXRbcisrXSk7ZS5sZW5ndGg9bi0xfX19ZnVuY3Rpb24gc2UodCxlLG4scil7dmFyIGksbyxhLHMsdSxsLGMsZj1lJiZlLm93bmVyRG9jdW1lbnQscD1lP2Uubm9kZVR5cGU6OTtpZihuPW58fFtdLCJzdHJpbmciIT10eXBlb2YgdHx8IXR8fDEhPT1wJiY5IT09cCYmMTEhPT1wKXJldHVybiBuO2lmKCFyJiYoVChlKSxlPWV8fEMsRSkpe2lmKDExIT09cCYmKHU9Wi5leGVjKHQpKSlpZihpPXVbMV0pe2lmKDk9PT1wKXtpZighKGE9ZS5nZXRFbGVtZW50QnlJZChpKSkpcmV0dXJuIG47aWYoYS5pZD09PWkpcmV0dXJuIG4ucHVzaChhKSxufWVsc2UgaWYoZiYmKGE9Zi5nZXRFbGVtZW50QnlJZChpKSkmJnkoZSxhKSYmYS5pZD09PWkpcmV0dXJuIG4ucHVzaChhKSxufWVsc2V7aWYodVsyXSlyZXR1cm4gSC5hcHBseShuLGUuZ2V0RWxlbWVudHNCeVRhZ05hbWUodCkpLG47aWYoKGk9dVszXSkmJmQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZSYmZS5nZXRFbGVtZW50c0J5Q2xhc3NOYW1lKXJldHVybiBILmFwcGx5KG4sZS5nZXRFbGVtZW50c0J5Q2xhc3NOYW1lKGkpKSxufWlmKGQucXNhJiYhTlt0KyIgIl0mJighdnx8IXYudGVzdCh0KSkmJigxIT09cHx8Im9iamVjdCIhPT1lLm5vZGVOYW1lLnRvTG93ZXJDYXNlKCkpKXtpZihjPXQsZj1lLDE9PT1wJiYoVS50ZXN0KHQpfHx6LnRlc3QodCkpKXsoZj1lZS50ZXN0KHQpJiZ5ZShlLnBhcmVudE5vZGUpfHxlKT09PWUmJmQuc2NvcGV8fCgocz1lLmdldEF0dHJpYnV0ZSgiaWQiKSk/cz1zLnJlcGxhY2UocmUsaWUpOmUuc2V0QXR0cmlidXRlKCJpZCIscz1TKSksbz0obD1oKHQpKS5sZW5ndGg7d2hpbGUoby0tKWxbb109KHM/IiMiK3M6IjpzY29wZSIpKyIgIit4ZShsW29dKTtjPWwuam9pbigiLCIpfXRyeXtyZXR1cm4gSC5hcHBseShuLGYucXVlcnlTZWxlY3RvckFsbChjKSksbn1jYXRjaChlKXtOKHQsITApfWZpbmFsbHl7cz09PVMmJmUucmVtb3ZlQXR0cmlidXRlKCJpZCIpfX19cmV0dXJuIGcodC5yZXBsYWNlKCQsIiQxIiksZSxuLHIpfWZ1bmN0aW9uIHVlKCl7dmFyIHI9W107cmV0dXJuIGZ1bmN0aW9uIGUodCxuKXtyZXR1cm4gci5wdXNoKHQrIiAiKT5iLmNhY2hlTGVuZ3RoJiZkZWxldGUgZVtyLnNoaWZ0KCldLGVbdCsiICJdPW59fWZ1bmN0aW9uIGxlKGUpe3JldHVybiBlW1NdPSEwLGV9ZnVuY3Rpb24gY2UoZSl7dmFyIHQ9Qy5jcmVhdGVFbGVtZW50KCJmaWVsZHNldCIpO3RyeXtyZXR1cm4hIWUodCl9Y2F0Y2goZSl7cmV0dXJuITF9ZmluYWxseXt0LnBhcmVudE5vZGUmJnQucGFyZW50Tm9kZS5yZW1vdmVDaGlsZCh0KSx0PW51bGx9fWZ1bmN0aW9uIGZlKGUsdCl7dmFyIG49ZS5zcGxpdCgifCIpLHI9bi5sZW5ndGg7d2hpbGUoci0tKWIuYXR0ckhhbmRsZVtuW3JdXT10fWZ1bmN0aW9uIHBlKGUsdCl7dmFyIG49dCYmZSxyPW4mJjE9PT1lLm5vZGVUeXBlJiYxPT09dC5ub2RlVHlwZSYmZS5zb3VyY2VJbmRleC10LnNvdXJjZUluZGV4O2lmKHIpcmV0dXJuIHI7aWYobil3aGlsZShuPW4ubmV4dFNpYmxpbmcpaWYobj09PXQpcmV0dXJuLTE7cmV0dXJuIGU/MTotMX1mdW5jdGlvbiBkZSh0KXtyZXR1cm4gZnVuY3Rpb24oZSl7cmV0dXJuImlucHV0Ij09PWUubm9kZU5hbWUudG9Mb3dlckNhc2UoKSYmZS50eXBlPT09dH19ZnVuY3Rpb24gaGUobil7cmV0dXJuIGZ1bmN0aW9uKGUpe3ZhciB0PWUubm9kZU5hbWUudG9Mb3dlckNhc2UoKTtyZXR1cm4oImlucHV0Ij09PXR8fCJidXR0b24iPT09dCkmJmUudHlwZT09PW59fWZ1bmN0aW9uIGdlKHQpe3JldHVybiBmdW5jdGlvbihlKXtyZXR1cm4iZm9ybSJpbiBlP2UucGFyZW50Tm9kZSYmITE9PT1lLmRpc2FibGVkPyJsYWJlbCJpbiBlPyJsYWJlbCJpbiBlLnBhcmVudE5vZGU/ZS5wYXJlbnROb2RlLmRpc2FibGVkPT09dDplLmRpc2FibGVkPT09dDplLmlzRGlzYWJsZWQ9PT10fHxlLmlzRGlzYWJsZWQhPT0hdCYmYWUoZSk9PT10OmUuZGlzYWJsZWQ9PT10OiJsYWJlbCJpbiBlJiZlLmRpc2FibGVkPT09dH19ZnVuY3Rpb24gdmUoYSl7cmV0dXJuIGxlKGZ1bmN0aW9uKG8pe3JldHVybiBvPStvLGxlKGZ1bmN0aW9uKGUsdCl7dmFyIG4scj1hKFtdLGUubGVuZ3RoLG8pLGk9ci5sZW5ndGg7d2hpbGUoaS0tKWVbbj1yW2ldXSYmKGVbbl09ISh0W25dPWVbbl0pKX0pfSl9ZnVuY3Rpb24geWUoZSl7cmV0dXJuIGUmJiJ1bmRlZmluZWQiIT10eXBlb2YgZS5nZXRFbGVtZW50c0J5VGFnTmFtZSYmZX1mb3IoZSBpbiBkPXNlLnN1cHBvcnQ9e30saT1zZS5pc1hNTD1mdW5jdGlvbihlKXt2YXIgdD1lJiZlLm5hbWVzcGFjZVVSSSxuPWUmJihlLm93bmVyRG9jdW1lbnR8fGUpLmRvY3VtZW50RWxlbWVudDtyZXR1cm4hWS50ZXN0KHR8fG4mJm4ubm9kZU5hbWV8fCJIVE1MIil9LFQ9c2Uuc2V0RG9jdW1lbnQ9ZnVuY3Rpb24oZSl7dmFyIHQsbixyPWU/ZS5vd25lckRvY3VtZW50fHxlOnA7cmV0dXJuIHIhPUMmJjk9PT1yLm5vZGVUeXBlJiZyLmRvY3VtZW50RWxlbWVudCYmKGE9KEM9cikuZG9jdW1lbnRFbGVtZW50LEU9IWkoQykscCE9QyYmKG49Qy5kZWZhdWx0VmlldykmJm4udG9wIT09biYmKG4uYWRkRXZlbnRMaXN0ZW5lcj9uLmFkZEV2ZW50TGlzdGVuZXIoInVubG9hZCIsb2UsITEpOm4uYXR0YWNoRXZlbnQmJm4uYXR0YWNoRXZlbnQoIm9udW5sb2FkIixvZSkpLGQuc2NvcGU9Y2UoZnVuY3Rpb24oZSl7cmV0dXJuIGEuYXBwZW5kQ2hpbGQoZSkuYXBwZW5kQ2hpbGQoQy5jcmVhdGVFbGVtZW50KCJkaXYiKSksInVuZGVmaW5lZCIhPXR5cGVvZiBlLnF1ZXJ5U2VsZWN0b3JBbGwmJiFlLnF1ZXJ5U2VsZWN0b3JBbGwoIjpzY29wZSBmaWVsZHNldCBkaXYiKS5sZW5ndGh9KSxkLmF0dHJpYnV0ZXM9Y2UoZnVuY3Rpb24oZSl7cmV0dXJuIGUuY2xhc3NOYW1lPSJpIiwhZS5nZXRBdHRyaWJ1dGUoImNsYXNzTmFtZSIpfSksZC5nZXRFbGVtZW50c0J5VGFnTmFtZT1jZShmdW5jdGlvbihlKXtyZXR1cm4gZS5hcHBlbmRDaGlsZChDLmNyZWF0ZUNvbW1lbnQoIiIpKSwhZS5nZXRFbGVtZW50c0J5VGFnTmFtZSgiKiIpLmxlbmd0aH0pLGQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZT1LLnRlc3QoQy5nZXRFbGVtZW50c0J5Q2xhc3NOYW1lKSxkLmdldEJ5SWQ9Y2UoZnVuY3Rpb24oZSl7cmV0dXJuIGEuYXBwZW5kQ2hpbGQoZSkuaWQ9UywhQy5nZXRFbGVtZW50c0J5TmFtZXx8IUMuZ2V0RWxlbWVudHNCeU5hbWUoUykubGVuZ3RofSksZC5nZXRCeUlkPyhiLmZpbHRlci5JRD1mdW5jdGlvbihlKXt2YXIgdD1lLnJlcGxhY2UodGUsbmUpO3JldHVybiBmdW5jdGlvbihlKXtyZXR1cm4gZS5nZXRBdHRyaWJ1dGUoImlkIik9PT10fX0sYi5maW5kLklEPWZ1bmN0aW9uKGUsdCl7aWYoInVuZGVmaW5lZCIhPXR5cGVvZiB0LmdldEVsZW1lbnRCeUlkJiZFKXt2YXIgbj10LmdldEVsZW1lbnRCeUlkKGUpO3JldHVybiBuP1tuXTpbXX19KTooYi5maWx0ZXIuSUQ9ZnVuY3Rpb24oZSl7dmFyIG49ZS5yZXBsYWNlKHRlLG5lKTtyZXR1cm4gZnVuY3Rpb24oZSl7dmFyIHQ9InVuZGVmaW5lZCIhPXR5cGVvZiBlLmdldEF0dHJpYnV0ZU5vZGUmJmUuZ2V0QXR0cmlidXRlTm9kZSgiaWQiKTtyZXR1cm4gdCYmdC52YWx1ZT09PW59fSxiLmZpbmQuSUQ9ZnVuY3Rpb24oZSx0KXtpZigidW5kZWZpbmVkIiE9dHlwZW9mIHQuZ2V0RWxlbWVudEJ5SWQmJkUpe3ZhciBuLHIsaSxvPXQuZ2V0RWxlbWVudEJ5SWQoZSk7aWYobyl7aWYoKG49by5nZXRBdHRyaWJ1dGVOb2RlKCJpZCIpKSYmbi52YWx1ZT09PWUpcmV0dXJuW29dO2k9dC5nZXRFbGVtZW50c0J5TmFtZShlKSxyPTA7d2hpbGUobz1pW3IrK10paWYoKG49by5nZXRBdHRyaWJ1dGVOb2RlKCJpZCIpKSYmbi52YWx1ZT09PWUpcmV0dXJuW29dfXJldHVybltdfX0pLGIuZmluZC5UQUc9ZC5nZXRFbGVtZW50c0J5VGFnTmFtZT9mdW5jdGlvbihlLHQpe3JldHVybiJ1bmRlZmluZWQiIT10eXBlb2YgdC5nZXRFbGVtZW50c0J5VGFnTmFtZT90LmdldEVsZW1lbnRzQnlUYWdOYW1lKGUpOmQucXNhP3QucXVlcnlTZWxlY3RvckFsbChlKTp2b2lkIDB9OmZ1bmN0aW9uKGUsdCl7dmFyIG4scj1bXSxpPTAsbz10LmdldEVsZW1lbnRzQnlUYWdOYW1lKGUpO2lmKCIqIj09PWUpe3doaWxlKG49b1tpKytdKTE9PT1uLm5vZGVUeXBlJiZyLnB1c2gobik7cmV0dXJuIHJ9cmV0dXJuIG99LGIuZmluZC5DTEFTUz1kLmdldEVsZW1lbnRzQnlDbGFzc05hbWUmJmZ1bmN0aW9uKGUsdCl7aWYoInVuZGVmaW5lZCIhPXR5cGVvZiB0LmdldEVsZW1lbnRzQnlDbGFzc05hbWUmJkUpcmV0dXJuIHQuZ2V0RWxlbWVudHNCeUNsYXNzTmFtZShlKX0scz1bXSx2PVtdLChkLnFzYT1LLnRlc3QoQy5xdWVyeVNlbGVjdG9yQWxsKSkmJihjZShmdW5jdGlvbihlKXt2YXIgdDthLmFwcGVuZENoaWxkKGUpLmlubmVySFRNTD0iPGEgaWQ9JyIrUysiJz48L2E+PHNlbGVjdCBpZD0nIitTKyItXHJcXCcgbXNhbGxvd2NhcHR1cmU9Jyc+PG9wdGlvbiBzZWxlY3RlZD0nJz48L29wdGlvbj48L3NlbGVjdD4iLGUucXVlcnlTZWxlY3RvckFsbCgiW21zYWxsb3djYXB0dXJlXj0nJ10iKS5sZW5ndGgmJnYucHVzaCgiWypeJF09IitNKyIqKD86Jyd8XCJcIikiKSxlLnF1ZXJ5U2VsZWN0b3JBbGwoIltzZWxlY3RlZF0iKS5sZW5ndGh8fHYucHVzaCgiXFxbIitNKyIqKD86dmFsdWV8IitSKyIpIiksZS5xdWVyeVNlbGVjdG9yQWxsKCJbaWR+PSIrUysiLV0iKS5sZW5ndGh8fHYucHVzaCgifj0iKSwodD1DLmNyZWF0ZUVsZW1lbnQoImlucHV0IikpLnNldEF0dHJpYnV0ZSgibmFtZSIsIiIpLGUuYXBwZW5kQ2hpbGQodCksZS5xdWVyeVNlbGVjdG9yQWxsKCJbbmFtZT0nJ10iKS5sZW5ndGh8fHYucHVzaCgiXFxbIitNKyIqbmFtZSIrTSsiKj0iK00rIiooPzonJ3xcIlwiKSIpLGUucXVlcnlTZWxlY3RvckFsbCgiOmNoZWNrZWQiKS5sZW5ndGh8fHYucHVzaCgiOmNoZWNrZWQiKSxlLnF1ZXJ5U2VsZWN0b3JBbGwoImEjIitTKyIrKiIpLmxlbmd0aHx8di5wdXNoKCIuIy4rWyt+XSIpLGUucXVlcnlTZWxlY3RvckFsbCgiXFxcZiIpLHYucHVzaCgiW1xcclxcblxcZl0iKX0pLGNlKGZ1bmN0aW9uKGUpe2UuaW5uZXJIVE1MPSI8YSBocmVmPScnIGRpc2FibGVkPSdkaXNhYmxlZCc+PC9hPjxzZWxlY3QgZGlzYWJsZWQ9J2Rpc2FibGVkJz48b3B0aW9uLz48L3NlbGVjdD4iO3ZhciB0PUMuY3JlYXRlRWxlbWVudCgiaW5wdXQiKTt0LnNldEF0dHJpYnV0ZSgidHlwZSIsImhpZGRlbiIpLGUuYXBwZW5kQ2hpbGQodCkuc2V0QXR0cmlidXRlKCJuYW1lIiwiRCIpLGUucXVlcnlTZWxlY3RvckFsbCgiW25hbWU9ZF0iKS5sZW5ndGgmJnYucHVzaCgibmFtZSIrTSsiKlsqXiR8IX5dPz0iKSwyIT09ZS5xdWVyeVNlbGVjdG9yQWxsKCI6ZW5hYmxlZCIpLmxlbmd0aCYmdi5wdXNoKCI6ZW5hYmxlZCIsIjpkaXNhYmxlZCIpLGEuYXBwZW5kQ2hpbGQoZSkuZGlzYWJsZWQ9ITAsMiE9PWUucXVlcnlTZWxlY3RvckFsbCgiOmRpc2FibGVkIikubGVuZ3RoJiZ2LnB1c2goIjplbmFibGVkIiwiOmRpc2FibGVkIiksZS5xdWVyeVNlbGVjdG9yQWxsKCIqLDp4Iiksdi5wdXNoKCIsLio6Iil9KSksKGQubWF0Y2hlc1NlbGVjdG9yPUsudGVzdChjPWEubWF0Y2hlc3x8YS53ZWJraXRNYXRjaGVzU2VsZWN0b3J8fGEubW96TWF0Y2hlc1NlbGVjdG9yfHxhLm9NYXRjaGVzU2VsZWN0b3J8fGEubXNNYXRjaGVzU2VsZWN0b3IpKSYmY2UoZnVuY3Rpb24oZSl7ZC5kaXNjb25uZWN0ZWRNYXRjaD1jLmNhbGwoZSwiKiIpLGMuY2FsbChlLCJbcyE9JyddOngiKSxzLnB1c2goIiE9IixGKX0pLHY9di5sZW5ndGgmJm5ldyBSZWdFeHAodi5qb2luKCJ8IikpLHM9cy5sZW5ndGgmJm5ldyBSZWdFeHAocy5qb2luKCJ8IikpLHQ9Sy50ZXN0KGEuY29tcGFyZURvY3VtZW50UG9zaXRpb24pLHk9dHx8Sy50ZXN0KGEuY29udGFpbnMpP2Z1bmN0aW9uKGUsdCl7dmFyIG49OT09PWUubm9kZVR5cGU/ZS5kb2N1bWVudEVsZW1lbnQ6ZSxyPXQmJnQucGFyZW50Tm9kZTtyZXR1cm4gZT09PXJ8fCEoIXJ8fDEhPT1yLm5vZGVUeXBlfHwhKG4uY29udGFpbnM/bi5jb250YWlucyhyKTplLmNvbXBhcmVEb2N1bWVudFBvc2l0aW9uJiYxNiZlLmNvbXBhcmVEb2N1bWVudFBvc2l0aW9uKHIpKSl9OmZ1bmN0aW9uKGUsdCl7aWYodCl3aGlsZSh0PXQucGFyZW50Tm9kZSlpZih0PT09ZSlyZXR1cm4hMDtyZXR1cm4hMX0saj10P2Z1bmN0aW9uKGUsdCl7aWYoZT09PXQpcmV0dXJuIGw9ITAsMDt2YXIgbj0hZS5jb21wYXJlRG9jdW1lbnRQb3NpdGlvbi0hdC5jb21wYXJlRG9jdW1lbnRQb3NpdGlvbjtyZXR1cm4gbnx8KDEmKG49KGUub3duZXJEb2N1bWVudHx8ZSk9PSh0Lm93bmVyRG9jdW1lbnR8fHQpP2UuY29tcGFyZURvY3VtZW50UG9zaXRpb24odCk6MSl8fCFkLnNvcnREZXRhY2hlZCYmdC5jb21wYXJlRG9jdW1lbnRQb3NpdGlvbihlKT09PW4/ZT09Q3x8ZS5vd25lckRvY3VtZW50PT1wJiZ5KHAsZSk/LTE6dD09Q3x8dC5vd25lckRvY3VtZW50PT1wJiZ5KHAsdCk/MTp1P1AodSxlKS1QKHUsdCk6MDo0Jm4/LTE6MSl9OmZ1bmN0aW9uKGUsdCl7aWYoZT09PXQpcmV0dXJuIGw9ITAsMDt2YXIgbixyPTAsaT1lLnBhcmVudE5vZGUsbz10LnBhcmVudE5vZGUsYT1bZV0scz1bdF07aWYoIWl8fCFvKXJldHVybiBlPT1DPy0xOnQ9PUM/MTppPy0xOm8/MTp1P1AodSxlKS1QKHUsdCk6MDtpZihpPT09bylyZXR1cm4gcGUoZSx0KTtuPWU7d2hpbGUobj1uLnBhcmVudE5vZGUpYS51bnNoaWZ0KG4pO249dDt3aGlsZShuPW4ucGFyZW50Tm9kZSlzLnVuc2hpZnQobik7d2hpbGUoYVtyXT09PXNbcl0pcisrO3JldHVybiByP3BlKGFbcl0sc1tyXSk6YVtyXT09cD8tMTpzW3JdPT1wPzE6MH0pLEN9LHNlLm1hdGNoZXM9ZnVuY3Rpb24oZSx0KXtyZXR1cm4gc2UoZSxudWxsLG51bGwsdCl9LHNlLm1hdGNoZXNTZWxlY3Rvcj1mdW5jdGlvbihlLHQpe2lmKFQoZSksZC5tYXRjaGVzU2VsZWN0b3ImJkUmJiFOW3QrIiAiXSYmKCFzfHwhcy50ZXN0KHQpKSYmKCF2fHwhdi50ZXN0KHQpKSl0cnl7dmFyIG49Yy5jYWxsKGUsdCk7aWYobnx8ZC5kaXNjb25uZWN0ZWRNYXRjaHx8ZS5kb2N1bWVudCYmMTEhPT1lLmRvY3VtZW50Lm5vZGVUeXBlKXJldHVybiBufWNhdGNoKGUpe04odCwhMCl9cmV0dXJuIDA8c2UodCxDLG51bGwsW2VdKS5sZW5ndGh9LHNlLmNvbnRhaW5zPWZ1bmN0aW9uKGUsdCl7cmV0dXJuKGUub3duZXJEb2N1bWVudHx8ZSkhPUMmJlQoZSkseShlLHQpfSxzZS5hdHRyPWZ1bmN0aW9uKGUsdCl7KGUub3duZXJEb2N1bWVudHx8ZSkhPUMmJlQoZSk7dmFyIG49Yi5hdHRySGFuZGxlW3QudG9Mb3dlckNhc2UoKV0scj1uJiZELmNhbGwoYi5hdHRySGFuZGxlLHQudG9Mb3dlckNhc2UoKSk/bihlLHQsIUUpOnZvaWQgMDtyZXR1cm4gdm9pZCAwIT09cj9yOmQuYXR0cmlidXRlc3x8IUU/ZS5nZXRBdHRyaWJ1dGUodCk6KHI9ZS5nZXRBdHRyaWJ1dGVOb2RlKHQpKSYmci5zcGVjaWZpZWQ/ci52YWx1ZTpudWxsfSxzZS5lc2NhcGU9ZnVuY3Rpb24oZSl7cmV0dXJuKGUrIiIpLnJlcGxhY2UocmUsaWUpfSxzZS5lcnJvcj1mdW5jdGlvbihlKXt0aHJvdyBuZXcgRXJyb3IoIlN5bnRheCBlcnJvciwgdW5yZWNvZ25pemVkIGV4cHJlc3Npb246ICIrZSl9LHNlLnVuaXF1ZVNvcnQ9ZnVuY3Rpb24oZSl7dmFyIHQsbj1bXSxyPTAsaT0wO2lmKGw9IWQuZGV0ZWN0RHVwbGljYXRlcyx1PSFkLnNvcnRTdGFibGUmJmUuc2xpY2UoMCksZS5zb3J0KGopLGwpe3doaWxlKHQ9ZVtpKytdKXQ9PT1lW2ldJiYocj1uLnB1c2goaSkpO3doaWxlKHItLSllLnNwbGljZShuW3JdLDEpfXJldHVybiB1PW51bGwsZX0sbz1zZS5nZXRUZXh0PWZ1bmN0aW9uKGUpe3ZhciB0LG49IiIscj0wLGk9ZS5ub2RlVHlwZTtpZihpKXtpZigxPT09aXx8OT09PWl8fDExPT09aSl7aWYoInN0cmluZyI9PXR5cGVvZiBlLnRleHRDb250ZW50KXJldHVybiBlLnRleHRDb250ZW50O2ZvcihlPWUuZmlyc3RDaGlsZDtlO2U9ZS5uZXh0U2libGluZyluKz1vKGUpfWVsc2UgaWYoMz09PWl8fDQ9PT1pKXJldHVybiBlLm5vZGVWYWx1ZX1lbHNlIHdoaWxlKHQ9ZVtyKytdKW4rPW8odCk7cmV0dXJuIG59LChiPXNlLnNlbGVjdG9ycz17Y2FjaGVMZW5ndGg6NTAsY3JlYXRlUHNldWRvOmxlLG1hdGNoOkcsYXR0ckhhbmRsZTp7fSxmaW5kOnt9LHJlbGF0aXZlOnsiPiI6e2RpcjoicGFyZW50Tm9kZSIsZmlyc3Q6ITB9LCIgIjp7ZGlyOiJwYXJlbnROb2RlIn0sIisiOntkaXI6InByZXZpb3VzU2libGluZyIsZmlyc3Q6ITB9LCJ+Ijp7ZGlyOiJwcmV2aW91c1NpYmxpbmcifX0scHJlRmlsdGVyOntBVFRSOmZ1bmN0aW9uKGUpe3JldHVybiBlWzFdPWVbMV0ucmVwbGFjZSh0ZSxuZSksZVszXT0oZVszXXx8ZVs0XXx8ZVs1XXx8IiIpLnJlcGxhY2UodGUsbmUpLCJ+PSI9PT1lWzJdJiYoZVszXT0iICIrZVszXSsiICIpLGUuc2xpY2UoMCw0KX0sQ0hJTEQ6ZnVuY3Rpb24oZSl7cmV0dXJuIGVbMV09ZVsxXS50b0xvd2VyQ2FzZSgpLCJudGgiPT09ZVsxXS5zbGljZSgwLDMpPyhlWzNdfHxzZS5lcnJvcihlWzBdKSxlWzRdPSsoZVs0XT9lWzVdKyhlWzZdfHwxKToyKigiZXZlbiI9PT1lWzNdfHwib2RkIj09PWVbM10pKSxlWzVdPSsoZVs3XStlWzhdfHwib2RkIj09PWVbM10pKTplWzNdJiZzZS5lcnJvcihlWzBdKSxlfSxQU0VVRE86ZnVuY3Rpb24oZSl7dmFyIHQsbj0hZVs2XSYmZVsyXTtyZXR1cm4gRy5DSElMRC50ZXN0KGVbMF0pP251bGw6KGVbM10/ZVsyXT1lWzRdfHxlWzVdfHwiIjpuJiZYLnRlc3QobikmJih0PWgobiwhMCkpJiYodD1uLmluZGV4T2YoIikiLG4ubGVuZ3RoLXQpLW4ubGVuZ3RoKSYmKGVbMF09ZVswXS5zbGljZSgwLHQpLGVbMl09bi5zbGljZSgwLHQpKSxlLnNsaWNlKDAsMykpfX0sZmlsdGVyOntUQUc6ZnVuY3Rpb24oZSl7dmFyIHQ9ZS5yZXBsYWNlKHRlLG5lKS50b0xvd2VyQ2FzZSgpO3JldHVybiIqIj09PWU/ZnVuY3Rpb24oKXtyZXR1cm4hMH06ZnVuY3Rpb24oZSl7cmV0dXJuIGUubm9kZU5hbWUmJmUubm9kZU5hbWUudG9Mb3dlckNhc2UoKT09PXR9fSxDTEFTUzpmdW5jdGlvbihlKXt2YXIgdD1tW2UrIiAiXTtyZXR1cm4gdHx8KHQ9bmV3IFJlZ0V4cCgiKF58IitNKyIpIitlKyIoIitNKyJ8JCkiKSkmJm0oZSxmdW5jdGlvbihlKXtyZXR1cm4gdC50ZXN0KCJzdHJpbmciPT10eXBlb2YgZS5jbGFzc05hbWUmJmUuY2xhc3NOYW1lfHwidW5kZWZpbmVkIiE9dHlwZW9mIGUuZ2V0QXR0cmlidXRlJiZlLmdldEF0dHJpYnV0ZSgiY2xhc3MiKXx8IiIpfSl9LEFUVFI6ZnVuY3Rpb24obixyLGkpe3JldHVybiBmdW5jdGlvbihlKXt2YXIgdD1zZS5hdHRyKGUsbik7cmV0dXJuIG51bGw9PXQ/IiE9Ij09PXI6IXJ8fCh0Kz0iIiwiPSI9PT1yP3Q9PT1pOiIhPSI9PT1yP3QhPT1pOiJePSI9PT1yP2kmJjA9PT10LmluZGV4T2YoaSk6Iio9Ij09PXI/aSYmLTE8dC5pbmRleE9mKGkpOiIkPSI9PT1yP2kmJnQuc2xpY2UoLWkubGVuZ3RoKT09PWk6In49Ij09PXI/LTE8KCIgIit0LnJlcGxhY2UoQiwiICIpKyIgIikuaW5kZXhPZihpKToifD0iPT09ciYmKHQ9PT1pfHx0LnNsaWNlKDAsaS5sZW5ndGgrMSk9PT1pKyItIikpfX0sQ0hJTEQ6ZnVuY3Rpb24oaCxlLHQsZyx2KXt2YXIgeT0ibnRoIiE9PWguc2xpY2UoMCwzKSxtPSJsYXN0IiE9PWguc2xpY2UoLTQpLHg9Im9mLXR5cGUiPT09ZTtyZXR1cm4gMT09PWcmJjA9PT12P2Z1bmN0aW9uKGUpe3JldHVybiEhZS5wYXJlbnROb2RlfTpmdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvLGEscyx1LGw9eSE9PW0/Im5leHRTaWJsaW5nIjoicHJldmlvdXNTaWJsaW5nIixjPWUucGFyZW50Tm9kZSxmPXgmJmUubm9kZU5hbWUudG9Mb3dlckNhc2UoKSxwPSFuJiYheCxkPSExO2lmKGMpe2lmKHkpe3doaWxlKGwpe2E9ZTt3aGlsZShhPWFbbF0paWYoeD9hLm5vZGVOYW1lLnRvTG93ZXJDYXNlKCk9PT1mOjE9PT1hLm5vZGVUeXBlKXJldHVybiExO3U9bD0ib25seSI9PT1oJiYhdSYmIm5leHRTaWJsaW5nIn1yZXR1cm4hMH1pZih1PVttP2MuZmlyc3RDaGlsZDpjLmxhc3RDaGlsZF0sbSYmcCl7ZD0ocz0ocj0oaT0obz0oYT1jKVtTXXx8KGFbU109e30pKVthLnVuaXF1ZUlEXXx8KG9bYS51bmlxdWVJRF09e30pKVtoXXx8W10pWzBdPT09ayYmclsxXSkmJnJbMl0sYT1zJiZjLmNoaWxkTm9kZXNbc107d2hpbGUoYT0rK3MmJmEmJmFbbF18fChkPXM9MCl8fHUucG9wKCkpaWYoMT09PWEubm9kZVR5cGUmJisrZCYmYT09PWUpe2lbaF09W2sscyxkXTticmVha319ZWxzZSBpZihwJiYoZD1zPShyPShpPShvPShhPWUpW1NdfHwoYVtTXT17fSkpW2EudW5pcXVlSURdfHwob1thLnVuaXF1ZUlEXT17fSkpW2hdfHxbXSlbMF09PT1rJiZyWzFdKSwhMT09PWQpd2hpbGUoYT0rK3MmJmEmJmFbbF18fChkPXM9MCl8fHUucG9wKCkpaWYoKHg/YS5ub2RlTmFtZS50b0xvd2VyQ2FzZSgpPT09ZjoxPT09YS5ub2RlVHlwZSkmJisrZCYmKHAmJigoaT0obz1hW1NdfHwoYVtTXT17fSkpW2EudW5pcXVlSURdfHwob1thLnVuaXF1ZUlEXT17fSkpW2hdPVtrLGRdKSxhPT09ZSkpYnJlYWs7cmV0dXJuKGQtPXYpPT09Z3x8ZCVnPT0wJiYwPD1kL2d9fX0sUFNFVURPOmZ1bmN0aW9uKGUsbyl7dmFyIHQsYT1iLnBzZXVkb3NbZV18fGIuc2V0RmlsdGVyc1tlLnRvTG93ZXJDYXNlKCldfHxzZS5lcnJvcigidW5zdXBwb3J0ZWQgcHNldWRvOiAiK2UpO3JldHVybiBhW1NdP2Eobyk6MTxhLmxlbmd0aD8odD1bZSxlLCIiLG9dLGIuc2V0RmlsdGVycy5oYXNPd25Qcm9wZXJ0eShlLnRvTG93ZXJDYXNlKCkpP2xlKGZ1bmN0aW9uKGUsdCl7dmFyIG4scj1hKGUsbyksaT1yLmxlbmd0aDt3aGlsZShpLS0pZVtuPVAoZSxyW2ldKV09ISh0W25dPXJbaV0pfSk6ZnVuY3Rpb24oZSl7cmV0dXJuIGEoZSwwLHQpfSk6YX19LHBzZXVkb3M6e25vdDpsZShmdW5jdGlvbihlKXt2YXIgcj1bXSxpPVtdLHM9ZihlLnJlcGxhY2UoJCwiJDEiKSk7cmV0dXJuIHNbU10/bGUoZnVuY3Rpb24oZSx0LG4scil7dmFyIGksbz1zKGUsbnVsbCxyLFtdKSxhPWUubGVuZ3RoO3doaWxlKGEtLSkoaT1vW2FdKSYmKGVbYV09ISh0W2FdPWkpKX0pOmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gclswXT1lLHMocixudWxsLG4saSksclswXT1udWxsLCFpLnBvcCgpfX0pLGhhczpsZShmdW5jdGlvbih0KXtyZXR1cm4gZnVuY3Rpb24oZSl7cmV0dXJuIDA8c2UodCxlKS5sZW5ndGh9fSksY29udGFpbnM6bGUoZnVuY3Rpb24odCl7cmV0dXJuIHQ9dC5yZXBsYWNlKHRlLG5lKSxmdW5jdGlvbihlKXtyZXR1cm4tMTwoZS50ZXh0Q29udGVudHx8byhlKSkuaW5kZXhPZih0KX19KSxsYW5nOmxlKGZ1bmN0aW9uKG4pe3JldHVybiBWLnRlc3Qobnx8IiIpfHxzZS5lcnJvcigidW5zdXBwb3J0ZWQgbGFuZzogIituKSxuPW4ucmVwbGFjZSh0ZSxuZSkudG9Mb3dlckNhc2UoKSxmdW5jdGlvbihlKXt2YXIgdDtkb3tpZih0PUU/ZS5sYW5nOmUuZ2V0QXR0cmlidXRlKCJ4bWw6bGFuZyIpfHxlLmdldEF0dHJpYnV0ZSgibGFuZyIpKXJldHVybih0PXQudG9Mb3dlckNhc2UoKSk9PT1ufHwwPT09dC5pbmRleE9mKG4rIi0iKX13aGlsZSgoZT1lLnBhcmVudE5vZGUpJiYxPT09ZS5ub2RlVHlwZSk7cmV0dXJuITF9fSksdGFyZ2V0OmZ1bmN0aW9uKGUpe3ZhciB0PW4ubG9jYXRpb24mJm4ubG9jYXRpb24uaGFzaDtyZXR1cm4gdCYmdC5zbGljZSgxKT09PWUuaWR9LHJvb3Q6ZnVuY3Rpb24oZSl7cmV0dXJuIGU9PT1hfSxmb2N1czpmdW5jdGlvbihlKXtyZXR1cm4gZT09PUMuYWN0aXZlRWxlbWVudCYmKCFDLmhhc0ZvY3VzfHxDLmhhc0ZvY3VzKCkpJiYhIShlLnR5cGV8fGUuaHJlZnx8fmUudGFiSW5kZXgpfSxlbmFibGVkOmdlKCExKSxkaXNhYmxlZDpnZSghMCksY2hlY2tlZDpmdW5jdGlvbihlKXt2YXIgdD1lLm5vZGVOYW1lLnRvTG93ZXJDYXNlKCk7cmV0dXJuImlucHV0Ij09PXQmJiEhZS5jaGVja2VkfHwib3B0aW9uIj09PXQmJiEhZS5zZWxlY3RlZH0sc2VsZWN0ZWQ6ZnVuY3Rpb24oZSl7cmV0dXJuIGUucGFyZW50Tm9kZSYmZS5wYXJlbnROb2RlLnNlbGVjdGVkSW5kZXgsITA9PT1lLnNlbGVjdGVkfSxlbXB0eTpmdW5jdGlvbihlKXtmb3IoZT1lLmZpcnN0Q2hpbGQ7ZTtlPWUubmV4dFNpYmxpbmcpaWYoZS5ub2RlVHlwZTw2KXJldHVybiExO3JldHVybiEwfSxwYXJlbnQ6ZnVuY3Rpb24oZSl7cmV0dXJuIWIucHNldWRvcy5lbXB0eShlKX0saGVhZGVyOmZ1bmN0aW9uKGUpe3JldHVybiBKLnRlc3QoZS5ub2RlTmFtZSl9LGlucHV0OmZ1bmN0aW9uKGUpe3JldHVybiBRLnRlc3QoZS5ub2RlTmFtZSl9LGJ1dHRvbjpmdW5jdGlvbihlKXt2YXIgdD1lLm5vZGVOYW1lLnRvTG93ZXJDYXNlKCk7cmV0dXJuImlucHV0Ij09PXQmJiJidXR0b24iPT09ZS50eXBlfHwiYnV0dG9uIj09PXR9LHRleHQ6ZnVuY3Rpb24oZSl7dmFyIHQ7cmV0dXJuImlucHV0Ij09PWUubm9kZU5hbWUudG9Mb3dlckNhc2UoKSYmInRleHQiPT09ZS50eXBlJiYobnVsbD09KHQ9ZS5nZXRBdHRyaWJ1dGUoInR5cGUiKSl8fCJ0ZXh0Ij09PXQudG9Mb3dlckNhc2UoKSl9LGZpcnN0OnZlKGZ1bmN0aW9uKCl7cmV0dXJuWzBdfSksbGFzdDp2ZShmdW5jdGlvbihlLHQpe3JldHVyblt0LTFdfSksZXE6dmUoZnVuY3Rpb24oZSx0LG4pe3JldHVybltuPDA/bit0Om5dfSksZXZlbjp2ZShmdW5jdGlvbihlLHQpe2Zvcih2YXIgbj0wO248dDtuKz0yKWUucHVzaChuKTtyZXR1cm4gZX0pLG9kZDp2ZShmdW5jdGlvbihlLHQpe2Zvcih2YXIgbj0xO248dDtuKz0yKWUucHVzaChuKTtyZXR1cm4gZX0pLGx0OnZlKGZ1bmN0aW9uKGUsdCxuKXtmb3IodmFyIHI9bjwwP24rdDp0PG4/dDpuOzA8PS0tcjspZS5wdXNoKHIpO3JldHVybiBlfSksZ3Q6dmUoZnVuY3Rpb24oZSx0LG4pe2Zvcih2YXIgcj1uPDA/bit0Om47KytyPHQ7KWUucHVzaChyKTtyZXR1cm4gZX0pfX0pLnBzZXVkb3MubnRoPWIucHNldWRvcy5lcSx7cmFkaW86ITAsY2hlY2tib3g6ITAsZmlsZTohMCxwYXNzd29yZDohMCxpbWFnZTohMH0pYi5wc2V1ZG9zW2VdPWRlKGUpO2ZvcihlIGlue3N1Ym1pdDohMCxyZXNldDohMH0pYi5wc2V1ZG9zW2VdPWhlKGUpO2Z1bmN0aW9uIG1lKCl7fWZ1bmN0aW9uIHhlKGUpe2Zvcih2YXIgdD0wLG49ZS5sZW5ndGgscj0iIjt0PG47dCsrKXIrPWVbdF0udmFsdWU7cmV0dXJuIHJ9ZnVuY3Rpb24gYmUocyxlLHQpe3ZhciB1PWUuZGlyLGw9ZS5uZXh0LGM9bHx8dSxmPXQmJiJwYXJlbnROb2RlIj09PWMscD1yKys7cmV0dXJuIGUuZmlyc3Q/ZnVuY3Rpb24oZSx0LG4pe3doaWxlKGU9ZVt1XSlpZigxPT09ZS5ub2RlVHlwZXx8ZilyZXR1cm4gcyhlLHQsbik7cmV0dXJuITF9OmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG8sYT1bayxwXTtpZihuKXt3aGlsZShlPWVbdV0paWYoKDE9PT1lLm5vZGVUeXBlfHxmKSYmcyhlLHQsbikpcmV0dXJuITB9ZWxzZSB3aGlsZShlPWVbdV0paWYoMT09PWUubm9kZVR5cGV8fGYpaWYoaT0obz1lW1NdfHwoZVtTXT17fSkpW2UudW5pcXVlSURdfHwob1tlLnVuaXF1ZUlEXT17fSksbCYmbD09PWUubm9kZU5hbWUudG9Mb3dlckNhc2UoKSllPWVbdV18fGU7ZWxzZXtpZigocj1pW2NdKSYmclswXT09PWsmJnJbMV09PT1wKXJldHVybiBhWzJdPXJbMl07aWYoKGlbY109YSlbMl09cyhlLHQsbikpcmV0dXJuITB9cmV0dXJuITF9fWZ1bmN0aW9uIHdlKGkpe3JldHVybiAxPGkubGVuZ3RoP2Z1bmN0aW9uKGUsdCxuKXt2YXIgcj1pLmxlbmd0aDt3aGlsZShyLS0paWYoIWlbcl0oZSx0LG4pKXJldHVybiExO3JldHVybiEwfTppWzBdfWZ1bmN0aW9uIFRlKGUsdCxuLHIsaSl7Zm9yKHZhciBvLGE9W10scz0wLHU9ZS5sZW5ndGgsbD1udWxsIT10O3M8dTtzKyspKG89ZVtzXSkmJihuJiYhbihvLHIsaSl8fChhLnB1c2gobyksbCYmdC5wdXNoKHMpKSk7cmV0dXJuIGF9ZnVuY3Rpb24gQ2UoZCxoLGcsdix5LGUpe3JldHVybiB2JiYhdltTXSYmKHY9Q2UodikpLHkmJiF5W1NdJiYoeT1DZSh5LGUpKSxsZShmdW5jdGlvbihlLHQsbixyKXt2YXIgaSxvLGEscz1bXSx1PVtdLGw9dC5sZW5ndGgsYz1lfHxmdW5jdGlvbihlLHQsbil7Zm9yKHZhciByPTAsaT10Lmxlbmd0aDtyPGk7cisrKXNlKGUsdFtyXSxuKTtyZXR1cm4gbn0oaHx8IioiLG4ubm9kZVR5cGU/W25dOm4sW10pLGY9IWR8fCFlJiZoP2M6VGUoYyxzLGQsbixyKSxwPWc/eXx8KGU/ZDpsfHx2KT9bXTp0OmY7aWYoZyYmZyhmLHAsbixyKSx2KXtpPVRlKHAsdSksdihpLFtdLG4sciksbz1pLmxlbmd0aDt3aGlsZShvLS0pKGE9aVtvXSkmJihwW3Vbb11dPSEoZlt1W29dXT1hKSl9aWYoZSl7aWYoeXx8ZCl7aWYoeSl7aT1bXSxvPXAubGVuZ3RoO3doaWxlKG8tLSkoYT1wW29dKSYmaS5wdXNoKGZbb109YSk7eShudWxsLHA9W10saSxyKX1vPXAubGVuZ3RoO3doaWxlKG8tLSkoYT1wW29dKSYmLTE8KGk9eT9QKGUsYSk6c1tvXSkmJihlW2ldPSEodFtpXT1hKSl9fWVsc2UgcD1UZShwPT09dD9wLnNwbGljZShsLHAubGVuZ3RoKTpwKSx5P3kobnVsbCx0LHAscik6SC5hcHBseSh0LHApfSl9ZnVuY3Rpb24gRWUoZSl7Zm9yKHZhciBpLHQsbixyPWUubGVuZ3RoLG89Yi5yZWxhdGl2ZVtlWzBdLnR5cGVdLGE9b3x8Yi5yZWxhdGl2ZVsiICJdLHM9bz8xOjAsdT1iZShmdW5jdGlvbihlKXtyZXR1cm4gZT09PWl9LGEsITApLGw9YmUoZnVuY3Rpb24oZSl7cmV0dXJuLTE8UChpLGUpfSxhLCEwKSxjPVtmdW5jdGlvbihlLHQsbil7dmFyIHI9IW8mJihufHx0IT09dyl8fCgoaT10KS5ub2RlVHlwZT91KGUsdCxuKTpsKGUsdCxuKSk7cmV0dXJuIGk9bnVsbCxyfV07czxyO3MrKylpZih0PWIucmVsYXRpdmVbZVtzXS50eXBlXSljPVtiZSh3ZShjKSx0KV07ZWxzZXtpZigodD1iLmZpbHRlcltlW3NdLnR5cGVdLmFwcGx5KG51bGwsZVtzXS5tYXRjaGVzKSlbU10pe2ZvcihuPSsrcztuPHI7bisrKWlmKGIucmVsYXRpdmVbZVtuXS50eXBlXSlicmVhaztyZXR1cm4gQ2UoMTxzJiZ3ZShjKSwxPHMmJnhlKGUuc2xpY2UoMCxzLTEpLmNvbmNhdCh7dmFsdWU6IiAiPT09ZVtzLTJdLnR5cGU/IioiOiIifSkpLnJlcGxhY2UoJCwiJDEiKSx0LHM8biYmRWUoZS5zbGljZShzLG4pKSxuPHImJkVlKGU9ZS5zbGljZShuKSksbjxyJiZ4ZShlKSl9Yy5wdXNoKHQpfXJldHVybiB3ZShjKX1yZXR1cm4gbWUucHJvdG90eXBlPWIuZmlsdGVycz1iLnBzZXVkb3MsYi5zZXRGaWx0ZXJzPW5ldyBtZSxoPXNlLnRva2VuaXplPWZ1bmN0aW9uKGUsdCl7dmFyIG4scixpLG8sYSxzLHUsbD14W2UrIiAiXTtpZihsKXJldHVybiB0PzA6bC5zbGljZSgwKTthPWUscz1bXSx1PWIucHJlRmlsdGVyO3doaWxlKGEpe2ZvcihvIGluIG4mJiEocj1fLmV4ZWMoYSkpfHwociYmKGE9YS5zbGljZShyWzBdLmxlbmd0aCl8fGEpLHMucHVzaChpPVtdKSksbj0hMSwocj16LmV4ZWMoYSkpJiYobj1yLnNoaWZ0KCksaS5wdXNoKHt2YWx1ZTpuLHR5cGU6clswXS5yZXBsYWNlKCQsIiAiKX0pLGE9YS5zbGljZShuLmxlbmd0aCkpLGIuZmlsdGVyKSEocj1HW29dLmV4ZWMoYSkpfHx1W29dJiYhKHI9dVtvXShyKSl8fChuPXIuc2hpZnQoKSxpLnB1c2goe3ZhbHVlOm4sdHlwZTpvLG1hdGNoZXM6cn0pLGE9YS5zbGljZShuLmxlbmd0aCkpO2lmKCFuKWJyZWFrfXJldHVybiB0P2EubGVuZ3RoOmE/c2UuZXJyb3IoZSk6eChlLHMpLnNsaWNlKDApfSxmPXNlLmNvbXBpbGU9ZnVuY3Rpb24oZSx0KXt2YXIgbix2LHksbSx4LHIsaT1bXSxvPVtdLGE9QVtlKyIgIl07aWYoIWEpe3R8fCh0PWgoZSkpLG49dC5sZW5ndGg7d2hpbGUobi0tKShhPUVlKHRbbl0pKVtTXT9pLnB1c2goYSk6by5wdXNoKGEpOyhhPUEoZSwodj1vLG09MDwoeT1pKS5sZW5ndGgseD0wPHYubGVuZ3RoLHI9ZnVuY3Rpb24oZSx0LG4scixpKXt2YXIgbyxhLHMsdT0wLGw9IjAiLGM9ZSYmW10sZj1bXSxwPXcsZD1lfHx4JiZiLmZpbmQuVEFHKCIqIixpKSxoPWsrPW51bGw9PXA/MTpNYXRoLnJhbmRvbSgpfHwuMSxnPWQubGVuZ3RoO2ZvcihpJiYodz10PT1DfHx0fHxpKTtsIT09ZyYmbnVsbCE9KG89ZFtsXSk7bCsrKXtpZih4JiZvKXthPTAsdHx8by5vd25lckRvY3VtZW50PT1DfHwoVChvKSxuPSFFKTt3aGlsZShzPXZbYSsrXSlpZihzKG8sdHx8QyxuKSl7ci5wdXNoKG8pO2JyZWFrfWkmJihrPWgpfW0mJigobz0hcyYmbykmJnUtLSxlJiZjLnB1c2gobykpfWlmKHUrPWwsbSYmbCE9PXUpe2E9MDt3aGlsZShzPXlbYSsrXSlzKGMsZix0LG4pO2lmKGUpe2lmKDA8dSl3aGlsZShsLS0pY1tsXXx8ZltsXXx8KGZbbF09cS5jYWxsKHIpKTtmPVRlKGYpfUguYXBwbHkocixmKSxpJiYhZSYmMDxmLmxlbmd0aCYmMTx1K3kubGVuZ3RoJiZzZS51bmlxdWVTb3J0KHIpfXJldHVybiBpJiYoaz1oLHc9cCksY30sbT9sZShyKTpyKSkpLnNlbGVjdG9yPWV9cmV0dXJuIGF9LGc9c2Uuc2VsZWN0PWZ1bmN0aW9uKGUsdCxuLHIpe3ZhciBpLG8sYSxzLHUsbD0iZnVuY3Rpb24iPT10eXBlb2YgZSYmZSxjPSFyJiZoKGU9bC5zZWxlY3Rvcnx8ZSk7aWYobj1ufHxbXSwxPT09Yy5sZW5ndGgpe2lmKDI8KG89Y1swXT1jWzBdLnNsaWNlKDApKS5sZW5ndGgmJiJJRCI9PT0oYT1vWzBdKS50eXBlJiY5PT09dC5ub2RlVHlwZSYmRSYmYi5yZWxhdGl2ZVtvWzFdLnR5cGVdKXtpZighKHQ9KGIuZmluZC5JRChhLm1hdGNoZXNbMF0ucmVwbGFjZSh0ZSxuZSksdCl8fFtdKVswXSkpcmV0dXJuIG47bCYmKHQ9dC5wYXJlbnROb2RlKSxlPWUuc2xpY2Uoby5zaGlmdCgpLnZhbHVlLmxlbmd0aCl9aT1HLm5lZWRzQ29udGV4dC50ZXN0KGUpPzA6by5sZW5ndGg7d2hpbGUoaS0tKXtpZihhPW9baV0sYi5yZWxhdGl2ZVtzPWEudHlwZV0pYnJlYWs7aWYoKHU9Yi5maW5kW3NdKSYmKHI9dShhLm1hdGNoZXNbMF0ucmVwbGFjZSh0ZSxuZSksZWUudGVzdChvWzBdLnR5cGUpJiZ5ZSh0LnBhcmVudE5vZGUpfHx0KSkpe2lmKG8uc3BsaWNlKGksMSksIShlPXIubGVuZ3RoJiZ4ZShvKSkpcmV0dXJuIEguYXBwbHkobixyKSxuO2JyZWFrfX19cmV0dXJuKGx8fGYoZSxjKSkocix0LCFFLG4sIXR8fGVlLnRlc3QoZSkmJnllKHQucGFyZW50Tm9kZSl8fHQpLG59LGQuc29ydFN0YWJsZT1TLnNwbGl0KCIiKS5zb3J0KGopLmpvaW4oIiIpPT09UyxkLmRldGVjdER1cGxpY2F0ZXM9ISFsLFQoKSxkLnNvcnREZXRhY2hlZD1jZShmdW5jdGlvbihlKXtyZXR1cm4gMSZlLmNvbXBhcmVEb2N1bWVudFBvc2l0aW9uKEMuY3JlYXRlRWxlbWVudCgiZmllbGRzZXQiKSl9KSxjZShmdW5jdGlvbihlKXtyZXR1cm4gZS5pbm5lckhUTUw9IjxhIGhyZWY9JyMnPjwvYT4iLCIjIj09PWUuZmlyc3RDaGlsZC5nZXRBdHRyaWJ1dGUoImhyZWYiKX0pfHxmZSgidHlwZXxocmVmfGhlaWdodHx3aWR0aCIsZnVuY3Rpb24oZSx0LG4pe2lmKCFuKXJldHVybiBlLmdldEF0dHJpYnV0ZSh0LCJ0eXBlIj09PXQudG9Mb3dlckNhc2UoKT8xOjIpfSksZC5hdHRyaWJ1dGVzJiZjZShmdW5jdGlvbihlKXtyZXR1cm4gZS5pbm5lckhUTUw9IjxpbnB1dC8+IixlLmZpcnN0Q2hpbGQuc2V0QXR0cmlidXRlKCJ2YWx1ZSIsIiIpLCIiPT09ZS5maXJzdENoaWxkLmdldEF0dHJpYnV0ZSgidmFsdWUiKX0pfHxmZSgidmFsdWUiLGZ1bmN0aW9uKGUsdCxuKXtpZighbiYmImlucHV0Ij09PWUubm9kZU5hbWUudG9Mb3dlckNhc2UoKSlyZXR1cm4gZS5kZWZhdWx0VmFsdWV9KSxjZShmdW5jdGlvbihlKXtyZXR1cm4gbnVsbD09ZS5nZXRBdHRyaWJ1dGUoImRpc2FibGVkIil9KXx8ZmUoUixmdW5jdGlvbihlLHQsbil7dmFyIHI7aWYoIW4pcmV0dXJuITA9PT1lW3RdP3QudG9Mb3dlckNhc2UoKToocj1lLmdldEF0dHJpYnV0ZU5vZGUodCkpJiZyLnNwZWNpZmllZD9yLnZhbHVlOm51bGx9KSxzZX0oQyk7Uy5maW5kPWQsUy5leHByPWQuc2VsZWN0b3JzLFMuZXhwclsiOiJdPVMuZXhwci5wc2V1ZG9zLFMudW5pcXVlU29ydD1TLnVuaXF1ZT1kLnVuaXF1ZVNvcnQsUy50ZXh0PWQuZ2V0VGV4dCxTLmlzWE1MRG9jPWQuaXNYTUwsUy5jb250YWlucz1kLmNvbnRhaW5zLFMuZXNjYXBlU2VsZWN0b3I9ZC5lc2NhcGU7dmFyIGg9ZnVuY3Rpb24oZSx0LG4pe3ZhciByPVtdLGk9dm9pZCAwIT09bjt3aGlsZSgoZT1lW3RdKSYmOSE9PWUubm9kZVR5cGUpaWYoMT09PWUubm9kZVR5cGUpe2lmKGkmJlMoZSkuaXMobikpYnJlYWs7ci5wdXNoKGUpfXJldHVybiByfSxUPWZ1bmN0aW9uKGUsdCl7Zm9yKHZhciBuPVtdO2U7ZT1lLm5leHRTaWJsaW5nKTE9PT1lLm5vZGVUeXBlJiZlIT09dCYmbi5wdXNoKGUpO3JldHVybiBufSxrPVMuZXhwci5tYXRjaC5uZWVkc0NvbnRleHQ7ZnVuY3Rpb24gQShlLHQpe3JldHVybiBlLm5vZGVOYW1lJiZlLm5vZGVOYW1lLnRvTG93ZXJDYXNlKCk9PT10LnRvTG93ZXJDYXNlKCl9dmFyIE49L148KFthLXpdW15cL1wwPjpceDIwXHRcclxuXGZdKilbXHgyMFx0XHJcblxmXSpcLz8+KD86PFwvXDE+fCkkL2k7ZnVuY3Rpb24gaihlLG4scil7cmV0dXJuIG0obik/Uy5ncmVwKGUsZnVuY3Rpb24oZSx0KXtyZXR1cm4hIW4uY2FsbChlLHQsZSkhPT1yfSk6bi5ub2RlVHlwZT9TLmdyZXAoZSxmdW5jdGlvbihlKXtyZXR1cm4gZT09PW4hPT1yfSk6InN0cmluZyIhPXR5cGVvZiBuP1MuZ3JlcChlLGZ1bmN0aW9uKGUpe3JldHVybi0xPGkuY2FsbChuLGUpIT09cn0pOlMuZmlsdGVyKG4sZSxyKX1TLmZpbHRlcj1mdW5jdGlvbihlLHQsbil7dmFyIHI9dFswXTtyZXR1cm4gbiYmKGU9Ijpub3QoIitlKyIpIiksMT09PXQubGVuZ3RoJiYxPT09ci5ub2RlVHlwZT9TLmZpbmQubWF0Y2hlc1NlbGVjdG9yKHIsZSk/W3JdOltdOlMuZmluZC5tYXRjaGVzKGUsUy5ncmVwKHQsZnVuY3Rpb24oZSl7cmV0dXJuIDE9PT1lLm5vZGVUeXBlfSkpfSxTLmZuLmV4dGVuZCh7ZmluZDpmdW5jdGlvbihlKXt2YXIgdCxuLHI9dGhpcy5sZW5ndGgsaT10aGlzO2lmKCJzdHJpbmciIT10eXBlb2YgZSlyZXR1cm4gdGhpcy5wdXNoU3RhY2soUyhlKS5maWx0ZXIoZnVuY3Rpb24oKXtmb3IodD0wO3Q8cjt0KyspaWYoUy5jb250YWlucyhpW3RdLHRoaXMpKXJldHVybiEwfSkpO2ZvcihuPXRoaXMucHVzaFN0YWNrKFtdKSx0PTA7dDxyO3QrKylTLmZpbmQoZSxpW3RdLG4pO3JldHVybiAxPHI/Uy51bmlxdWVTb3J0KG4pOm59LGZpbHRlcjpmdW5jdGlvbihlKXtyZXR1cm4gdGhpcy5wdXNoU3RhY2soaih0aGlzLGV8fFtdLCExKSl9LG5vdDpmdW5jdGlvbihlKXtyZXR1cm4gdGhpcy5wdXNoU3RhY2soaih0aGlzLGV8fFtdLCEwKSl9LGlzOmZ1bmN0aW9uKGUpe3JldHVybiEhaih0aGlzLCJzdHJpbmciPT10eXBlb2YgZSYmay50ZXN0KGUpP1MoZSk6ZXx8W10sITEpLmxlbmd0aH19KTt2YXIgRCxxPS9eKD86XHMqKDxbXHdcV10rPilbXj5dKnwjKFtcdy1dKykpJC87KFMuZm4uaW5pdD1mdW5jdGlvbihlLHQsbil7dmFyIHIsaTtpZighZSlyZXR1cm4gdGhpcztpZihuPW58fEQsInN0cmluZyI9PXR5cGVvZiBlKXtpZighKHI9IjwiPT09ZVswXSYmIj4iPT09ZVtlLmxlbmd0aC0xXSYmMzw9ZS5sZW5ndGg/W251bGwsZSxudWxsXTpxLmV4ZWMoZSkpfHwhclsxXSYmdClyZXR1cm4hdHx8dC5qcXVlcnk/KHR8fG4pLmZpbmQoZSk6dGhpcy5jb25zdHJ1Y3Rvcih0KS5maW5kKGUpO2lmKHJbMV0pe2lmKHQ9dCBpbnN0YW5jZW9mIFM/dFswXTp0LFMubWVyZ2UodGhpcyxTLnBhcnNlSFRNTChyWzFdLHQmJnQubm9kZVR5cGU/dC5vd25lckRvY3VtZW50fHx0OkUsITApKSxOLnRlc3QoclsxXSkmJlMuaXNQbGFpbk9iamVjdCh0KSlmb3IociBpbiB0KW0odGhpc1tyXSk/dGhpc1tyXSh0W3JdKTp0aGlzLmF0dHIocix0W3JdKTtyZXR1cm4gdGhpc31yZXR1cm4oaT1FLmdldEVsZW1lbnRCeUlkKHJbMl0pKSYmKHRoaXNbMF09aSx0aGlzLmxlbmd0aD0xKSx0aGlzfXJldHVybiBlLm5vZGVUeXBlPyh0aGlzWzBdPWUsdGhpcy5sZW5ndGg9MSx0aGlzKTptKGUpP3ZvaWQgMCE9PW4ucmVhZHk/bi5yZWFkeShlKTplKFMpOlMubWFrZUFycmF5KGUsdGhpcyl9KS5wcm90b3R5cGU9Uy5mbixEPVMoRSk7dmFyIEw9L14oPzpwYXJlbnRzfHByZXYoPzpVbnRpbHxBbGwpKS8sSD17Y2hpbGRyZW46ITAsY29udGVudHM6ITAsbmV4dDohMCxwcmV2OiEwfTtmdW5jdGlvbiBPKGUsdCl7d2hpbGUoKGU9ZVt0XSkmJjEhPT1lLm5vZGVUeXBlKTtyZXR1cm4gZX1TLmZuLmV4dGVuZCh7aGFzOmZ1bmN0aW9uKGUpe3ZhciB0PVMoZSx0aGlzKSxuPXQubGVuZ3RoO3JldHVybiB0aGlzLmZpbHRlcihmdW5jdGlvbigpe2Zvcih2YXIgZT0wO2U8bjtlKyspaWYoUy5jb250YWlucyh0aGlzLHRbZV0pKXJldHVybiEwfSl9LGNsb3Nlc3Q6ZnVuY3Rpb24oZSx0KXt2YXIgbixyPTAsaT10aGlzLmxlbmd0aCxvPVtdLGE9InN0cmluZyIhPXR5cGVvZiBlJiZTKGUpO2lmKCFrLnRlc3QoZSkpZm9yKDtyPGk7cisrKWZvcihuPXRoaXNbcl07biYmbiE9PXQ7bj1uLnBhcmVudE5vZGUpaWYobi5ub2RlVHlwZTwxMSYmKGE/LTE8YS5pbmRleChuKToxPT09bi5ub2RlVHlwZSYmUy5maW5kLm1hdGNoZXNTZWxlY3RvcihuLGUpKSl7by5wdXNoKG4pO2JyZWFrfXJldHVybiB0aGlzLnB1c2hTdGFjaygxPG8ubGVuZ3RoP1MudW5pcXVlU29ydChvKTpvKX0saW5kZXg6ZnVuY3Rpb24oZSl7cmV0dXJuIGU/InN0cmluZyI9PXR5cGVvZiBlP2kuY2FsbChTKGUpLHRoaXNbMF0pOmkuY2FsbCh0aGlzLGUuanF1ZXJ5P2VbMF06ZSk6dGhpc1swXSYmdGhpc1swXS5wYXJlbnROb2RlP3RoaXMuZmlyc3QoKS5wcmV2QWxsKCkubGVuZ3RoOi0xfSxhZGQ6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gdGhpcy5wdXNoU3RhY2soUy51bmlxdWVTb3J0KFMubWVyZ2UodGhpcy5nZXQoKSxTKGUsdCkpKSl9LGFkZEJhY2s6ZnVuY3Rpb24oZSl7cmV0dXJuIHRoaXMuYWRkKG51bGw9PWU/dGhpcy5wcmV2T2JqZWN0OnRoaXMucHJldk9iamVjdC5maWx0ZXIoZSkpfX0pLFMuZWFjaCh7cGFyZW50OmZ1bmN0aW9uKGUpe3ZhciB0PWUucGFyZW50Tm9kZTtyZXR1cm4gdCYmMTEhPT10Lm5vZGVUeXBlP3Q6bnVsbH0scGFyZW50czpmdW5jdGlvbihlKXtyZXR1cm4gaChlLCJwYXJlbnROb2RlIil9LHBhcmVudHNVbnRpbDpmdW5jdGlvbihlLHQsbil7cmV0dXJuIGgoZSwicGFyZW50Tm9kZSIsbil9LG5leHQ6ZnVuY3Rpb24oZSl7cmV0dXJuIE8oZSwibmV4dFNpYmxpbmciKX0scHJldjpmdW5jdGlvbihlKXtyZXR1cm4gTyhlLCJwcmV2aW91c1NpYmxpbmciKX0sbmV4dEFsbDpmdW5jdGlvbihlKXtyZXR1cm4gaChlLCJuZXh0U2libGluZyIpfSxwcmV2QWxsOmZ1bmN0aW9uKGUpe3JldHVybiBoKGUsInByZXZpb3VzU2libGluZyIpfSxuZXh0VW50aWw6ZnVuY3Rpb24oZSx0LG4pe3JldHVybiBoKGUsIm5leHRTaWJsaW5nIixuKX0scHJldlVudGlsOmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gaChlLCJwcmV2aW91c1NpYmxpbmciLG4pfSxzaWJsaW5nczpmdW5jdGlvbihlKXtyZXR1cm4gVCgoZS5wYXJlbnROb2RlfHx7fSkuZmlyc3RDaGlsZCxlKX0sY2hpbGRyZW46ZnVuY3Rpb24oZSl7cmV0dXJuIFQoZS5maXJzdENoaWxkKX0sY29udGVudHM6ZnVuY3Rpb24oZSl7cmV0dXJuIG51bGwhPWUuY29udGVudERvY3VtZW50JiZyKGUuY29udGVudERvY3VtZW50KT9lLmNvbnRlbnREb2N1bWVudDooQShlLCJ0ZW1wbGF0ZSIpJiYoZT1lLmNvbnRlbnR8fGUpLFMubWVyZ2UoW10sZS5jaGlsZE5vZGVzKSl9fSxmdW5jdGlvbihyLGkpe1MuZm5bcl09ZnVuY3Rpb24oZSx0KXt2YXIgbj1TLm1hcCh0aGlzLGksZSk7cmV0dXJuIlVudGlsIiE9PXIuc2xpY2UoLTUpJiYodD1lKSx0JiYic3RyaW5nIj09dHlwZW9mIHQmJihuPVMuZmlsdGVyKHQsbikpLDE8dGhpcy5sZW5ndGgmJihIW3JdfHxTLnVuaXF1ZVNvcnQobiksTC50ZXN0KHIpJiZuLnJldmVyc2UoKSksdGhpcy5wdXNoU3RhY2sobil9fSk7dmFyIFA9L1teXHgyMFx0XHJcblxmXSsvZztmdW5jdGlvbiBSKGUpe3JldHVybiBlfWZ1bmN0aW9uIE0oZSl7dGhyb3cgZX1mdW5jdGlvbiBJKGUsdCxuLHIpe3ZhciBpO3RyeXtlJiZtKGk9ZS5wcm9taXNlKT9pLmNhbGwoZSkuZG9uZSh0KS5mYWlsKG4pOmUmJm0oaT1lLnRoZW4pP2kuY2FsbChlLHQsbik6dC5hcHBseSh2b2lkIDAsW2VdLnNsaWNlKHIpKX1jYXRjaChlKXtuLmFwcGx5KHZvaWQgMCxbZV0pfX1TLkNhbGxiYWNrcz1mdW5jdGlvbihyKXt2YXIgZSxuO3I9InN0cmluZyI9PXR5cGVvZiByPyhlPXIsbj17fSxTLmVhY2goZS5tYXRjaChQKXx8W10sZnVuY3Rpb24oZSx0KXtuW3RdPSEwfSksbik6Uy5leHRlbmQoe30scik7dmFyIGksdCxvLGEscz1bXSx1PVtdLGw9LTEsYz1mdW5jdGlvbigpe2ZvcihhPWF8fHIub25jZSxvPWk9ITA7dS5sZW5ndGg7bD0tMSl7dD11LnNoaWZ0KCk7d2hpbGUoKytsPHMubGVuZ3RoKSExPT09c1tsXS5hcHBseSh0WzBdLHRbMV0pJiZyLnN0b3BPbkZhbHNlJiYobD1zLmxlbmd0aCx0PSExKX1yLm1lbW9yeXx8KHQ9ITEpLGk9ITEsYSYmKHM9dD9bXToiIil9LGY9e2FkZDpmdW5jdGlvbigpe3JldHVybiBzJiYodCYmIWkmJihsPXMubGVuZ3RoLTEsdS5wdXNoKHQpKSxmdW5jdGlvbiBuKGUpe1MuZWFjaChlLGZ1bmN0aW9uKGUsdCl7bSh0KT9yLnVuaXF1ZSYmZi5oYXModCl8fHMucHVzaCh0KTp0JiZ0Lmxlbmd0aCYmInN0cmluZyIhPT13KHQpJiZuKHQpfSl9KGFyZ3VtZW50cyksdCYmIWkmJmMoKSksdGhpc30scmVtb3ZlOmZ1bmN0aW9uKCl7cmV0dXJuIFMuZWFjaChhcmd1bWVudHMsZnVuY3Rpb24oZSx0KXt2YXIgbjt3aGlsZSgtMTwobj1TLmluQXJyYXkodCxzLG4pKSlzLnNwbGljZShuLDEpLG48PWwmJmwtLX0pLHRoaXN9LGhhczpmdW5jdGlvbihlKXtyZXR1cm4gZT8tMTxTLmluQXJyYXkoZSxzKTowPHMubGVuZ3RofSxlbXB0eTpmdW5jdGlvbigpe3JldHVybiBzJiYocz1bXSksdGhpc30sZGlzYWJsZTpmdW5jdGlvbigpe3JldHVybiBhPXU9W10scz10PSIiLHRoaXN9LGRpc2FibGVkOmZ1bmN0aW9uKCl7cmV0dXJuIXN9LGxvY2s6ZnVuY3Rpb24oKXtyZXR1cm4gYT11PVtdLHR8fGl8fChzPXQ9IiIpLHRoaXN9LGxvY2tlZDpmdW5jdGlvbigpe3JldHVybiEhYX0sZmlyZVdpdGg6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gYXx8KHQ9W2UsKHQ9dHx8W10pLnNsaWNlP3Quc2xpY2UoKTp0XSx1LnB1c2godCksaXx8YygpKSx0aGlzfSxmaXJlOmZ1bmN0aW9uKCl7cmV0dXJuIGYuZmlyZVdpdGgodGhpcyxhcmd1bWVudHMpLHRoaXN9LGZpcmVkOmZ1bmN0aW9uKCl7cmV0dXJuISFvfX07cmV0dXJuIGZ9LFMuZXh0ZW5kKHtEZWZlcnJlZDpmdW5jdGlvbihlKXt2YXIgbz1bWyJub3RpZnkiLCJwcm9ncmVzcyIsUy5DYWxsYmFja3MoIm1lbW9yeSIpLFMuQ2FsbGJhY2tzKCJtZW1vcnkiKSwyXSxbInJlc29sdmUiLCJkb25lIixTLkNhbGxiYWNrcygib25jZSBtZW1vcnkiKSxTLkNhbGxiYWNrcygib25jZSBtZW1vcnkiKSwwLCJyZXNvbHZlZCJdLFsicmVqZWN0IiwiZmFpbCIsUy5DYWxsYmFja3MoIm9uY2UgbWVtb3J5IiksUy5DYWxsYmFja3MoIm9uY2UgbWVtb3J5IiksMSwicmVqZWN0ZWQiXV0saT0icGVuZGluZyIsYT17c3RhdGU6ZnVuY3Rpb24oKXtyZXR1cm4gaX0sYWx3YXlzOmZ1bmN0aW9uKCl7cmV0dXJuIHMuZG9uZShhcmd1bWVudHMpLmZhaWwoYXJndW1lbnRzKSx0aGlzfSwiY2F0Y2giOmZ1bmN0aW9uKGUpe3JldHVybiBhLnRoZW4obnVsbCxlKX0scGlwZTpmdW5jdGlvbigpe3ZhciBpPWFyZ3VtZW50cztyZXR1cm4gUy5EZWZlcnJlZChmdW5jdGlvbihyKXtTLmVhY2gobyxmdW5jdGlvbihlLHQpe3ZhciBuPW0oaVt0WzRdXSkmJmlbdFs0XV07c1t0WzFdXShmdW5jdGlvbigpe3ZhciBlPW4mJm4uYXBwbHkodGhpcyxhcmd1bWVudHMpO2UmJm0oZS5wcm9taXNlKT9lLnByb21pc2UoKS5wcm9ncmVzcyhyLm5vdGlmeSkuZG9uZShyLnJlc29sdmUpLmZhaWwoci5yZWplY3QpOnJbdFswXSsiV2l0aCJdKHRoaXMsbj9bZV06YXJndW1lbnRzKX0pfSksaT1udWxsfSkucHJvbWlzZSgpfSx0aGVuOmZ1bmN0aW9uKHQsbixyKXt2YXIgdT0wO2Z1bmN0aW9uIGwoaSxvLGEscyl7cmV0dXJuIGZ1bmN0aW9uKCl7dmFyIG49dGhpcyxyPWFyZ3VtZW50cyxlPWZ1bmN0aW9uKCl7dmFyIGUsdDtpZighKGk8dSkpe2lmKChlPWEuYXBwbHkobixyKSk9PT1vLnByb21pc2UoKSl0aHJvdyBuZXcgVHlwZUVycm9yKCJUaGVuYWJsZSBzZWxmLXJlc29sdXRpb24iKTt0PWUmJigib2JqZWN0Ij09dHlwZW9mIGV8fCJmdW5jdGlvbiI9PXR5cGVvZiBlKSYmZS50aGVuLG0odCk/cz90LmNhbGwoZSxsKHUsbyxSLHMpLGwodSxvLE0scykpOih1KyssdC5jYWxsKGUsbCh1LG8sUixzKSxsKHUsbyxNLHMpLGwodSxvLFIsby5ub3RpZnlXaXRoKSkpOihhIT09UiYmKG49dm9pZCAwLHI9W2VdKSwoc3x8by5yZXNvbHZlV2l0aCkobixyKSl9fSx0PXM/ZTpmdW5jdGlvbigpe3RyeXtlKCl9Y2F0Y2goZSl7Uy5EZWZlcnJlZC5leGNlcHRpb25Ib29rJiZTLkRlZmVycmVkLmV4Y2VwdGlvbkhvb2soZSx0LnN0YWNrVHJhY2UpLHU8PWkrMSYmKGEhPT1NJiYobj12b2lkIDAscj1bZV0pLG8ucmVqZWN0V2l0aChuLHIpKX19O2k/dCgpOihTLkRlZmVycmVkLmdldFN0YWNrSG9vayYmKHQuc3RhY2tUcmFjZT1TLkRlZmVycmVkLmdldFN0YWNrSG9vaygpKSxDLnNldFRpbWVvdXQodCkpfX1yZXR1cm4gUy5EZWZlcnJlZChmdW5jdGlvbihlKXtvWzBdWzNdLmFkZChsKDAsZSxtKHIpP3I6UixlLm5vdGlmeVdpdGgpKSxvWzFdWzNdLmFkZChsKDAsZSxtKHQpP3Q6UikpLG9bMl1bM10uYWRkKGwoMCxlLG0obik/bjpNKSl9KS5wcm9taXNlKCl9LHByb21pc2U6ZnVuY3Rpb24oZSl7cmV0dXJuIG51bGwhPWU/Uy5leHRlbmQoZSxhKTphfX0scz17fTtyZXR1cm4gUy5lYWNoKG8sZnVuY3Rpb24oZSx0KXt2YXIgbj10WzJdLHI9dFs1XTthW3RbMV1dPW4uYWRkLHImJm4uYWRkKGZ1bmN0aW9uKCl7aT1yfSxvWzMtZV1bMl0uZGlzYWJsZSxvWzMtZV1bM10uZGlzYWJsZSxvWzBdWzJdLmxvY2ssb1swXVszXS5sb2NrKSxuLmFkZCh0WzNdLmZpcmUpLHNbdFswXV09ZnVuY3Rpb24oKXtyZXR1cm4gc1t0WzBdKyJXaXRoIl0odGhpcz09PXM/dm9pZCAwOnRoaXMsYXJndW1lbnRzKSx0aGlzfSxzW3RbMF0rIldpdGgiXT1uLmZpcmVXaXRofSksYS5wcm9taXNlKHMpLGUmJmUuY2FsbChzLHMpLHN9LHdoZW46ZnVuY3Rpb24oZSl7dmFyIG49YXJndW1lbnRzLmxlbmd0aCx0PW4scj1BcnJheSh0KSxpPXMuY2FsbChhcmd1bWVudHMpLG89Uy5EZWZlcnJlZCgpLGE9ZnVuY3Rpb24odCl7cmV0dXJuIGZ1bmN0aW9uKGUpe3JbdF09dGhpcyxpW3RdPTE8YXJndW1lbnRzLmxlbmd0aD9zLmNhbGwoYXJndW1lbnRzKTplLC0tbnx8by5yZXNvbHZlV2l0aChyLGkpfX07aWYobjw9MSYmKEkoZSxvLmRvbmUoYSh0KSkucmVzb2x2ZSxvLnJlamVjdCwhbiksInBlbmRpbmciPT09by5zdGF0ZSgpfHxtKGlbdF0mJmlbdF0udGhlbikpKXJldHVybiBvLnRoZW4oKTt3aGlsZSh0LS0pSShpW3RdLGEodCksby5yZWplY3QpO3JldHVybiBvLnByb21pc2UoKX19KTt2YXIgVz0vXihFdmFsfEludGVybmFsfFJhbmdlfFJlZmVyZW5jZXxTeW50YXh8VHlwZXxVUkkpRXJyb3IkLztTLkRlZmVycmVkLmV4Y2VwdGlvbkhvb2s9ZnVuY3Rpb24oZSx0KXtDLmNvbnNvbGUmJkMuY29uc29sZS53YXJuJiZlJiZXLnRlc3QoZS5uYW1lKSYmQy5jb25zb2xlLndhcm4oImpRdWVyeS5EZWZlcnJlZCBleGNlcHRpb246ICIrZS5tZXNzYWdlLGUuc3RhY2ssdCl9LFMucmVhZHlFeGNlcHRpb249ZnVuY3Rpb24oZSl7Qy5zZXRUaW1lb3V0KGZ1bmN0aW9uKCl7dGhyb3cgZX0pfTt2YXIgRj1TLkRlZmVycmVkKCk7ZnVuY3Rpb24gQigpe0UucmVtb3ZlRXZlbnRMaXN0ZW5lcigiRE9NQ29udGVudExvYWRlZCIsQiksQy5yZW1vdmVFdmVudExpc3RlbmVyKCJsb2FkIixCKSxTLnJlYWR5KCl9Uy5mbi5yZWFkeT1mdW5jdGlvbihlKXtyZXR1cm4gRi50aGVuKGUpWyJjYXRjaCJdKGZ1bmN0aW9uKGUpe1MucmVhZHlFeGNlcHRpb24oZSl9KSx0aGlzfSxTLmV4dGVuZCh7aXNSZWFkeTohMSxyZWFkeVdhaXQ6MSxyZWFkeTpmdW5jdGlvbihlKXsoITA9PT1lPy0tUy5yZWFkeVdhaXQ6Uy5pc1JlYWR5KXx8KFMuaXNSZWFkeT0hMCkhPT1lJiYwPC0tUy5yZWFkeVdhaXR8fEYucmVzb2x2ZVdpdGgoRSxbU10pfX0pLFMucmVhZHkudGhlbj1GLnRoZW4sImNvbXBsZXRlIj09PUUucmVhZHlTdGF0ZXx8ImxvYWRpbmciIT09RS5yZWFkeVN0YXRlJiYhRS5kb2N1bWVudEVsZW1lbnQuZG9TY3JvbGw/Qy5zZXRUaW1lb3V0KFMucmVhZHkpOihFLmFkZEV2ZW50TGlzdGVuZXIoIkRPTUNvbnRlbnRMb2FkZWQiLEIpLEMuYWRkRXZlbnRMaXN0ZW5lcigibG9hZCIsQikpO3ZhciAkPWZ1bmN0aW9uKGUsdCxuLHIsaSxvLGEpe3ZhciBzPTAsdT1lLmxlbmd0aCxsPW51bGw9PW47aWYoIm9iamVjdCI9PT13KG4pKWZvcihzIGluIGk9ITAsbikkKGUsdCxzLG5bc10sITAsbyxhKTtlbHNlIGlmKHZvaWQgMCE9PXImJihpPSEwLG0ocil8fChhPSEwKSxsJiYoYT8odC5jYWxsKGUsciksdD1udWxsKToobD10LHQ9ZnVuY3Rpb24oZSx0LG4pe3JldHVybiBsLmNhbGwoUyhlKSxuKX0pKSx0KSlmb3IoO3M8dTtzKyspdChlW3NdLG4sYT9yOnIuY2FsbChlW3NdLHMsdChlW3NdLG4pKSk7cmV0dXJuIGk/ZTpsP3QuY2FsbChlKTp1P3QoZVswXSxuKTpvfSxfPS9eLW1zLS8sej0vLShbYS16XSkvZztmdW5jdGlvbiBVKGUsdCl7cmV0dXJuIHQudG9VcHBlckNhc2UoKX1mdW5jdGlvbiBYKGUpe3JldHVybiBlLnJlcGxhY2UoXywibXMtIikucmVwbGFjZSh6LFUpfXZhciBWPWZ1bmN0aW9uKGUpe3JldHVybiAxPT09ZS5ub2RlVHlwZXx8OT09PWUubm9kZVR5cGV8fCErZS5ub2RlVHlwZX07ZnVuY3Rpb24gRygpe3RoaXMuZXhwYW5kbz1TLmV4cGFuZG8rRy51aWQrK31HLnVpZD0xLEcucHJvdG90eXBlPXtjYWNoZTpmdW5jdGlvbihlKXt2YXIgdD1lW3RoaXMuZXhwYW5kb107cmV0dXJuIHR8fCh0PXt9LFYoZSkmJihlLm5vZGVUeXBlP2VbdGhpcy5leHBhbmRvXT10Ok9iamVjdC5kZWZpbmVQcm9wZXJ0eShlLHRoaXMuZXhwYW5kbyx7dmFsdWU6dCxjb25maWd1cmFibGU6ITB9KSkpLHR9LHNldDpmdW5jdGlvbihlLHQsbil7dmFyIHIsaT10aGlzLmNhY2hlKGUpO2lmKCJzdHJpbmciPT10eXBlb2YgdClpW1godCldPW47ZWxzZSBmb3IociBpbiB0KWlbWChyKV09dFtyXTtyZXR1cm4gaX0sZ2V0OmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHZvaWQgMD09PXQ/dGhpcy5jYWNoZShlKTplW3RoaXMuZXhwYW5kb10mJmVbdGhpcy5leHBhbmRvXVtYKHQpXX0sYWNjZXNzOmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gdm9pZCAwPT09dHx8dCYmInN0cmluZyI9PXR5cGVvZiB0JiZ2b2lkIDA9PT1uP3RoaXMuZ2V0KGUsdCk6KHRoaXMuc2V0KGUsdCxuKSx2b2lkIDAhPT1uP246dCl9LHJlbW92ZTpmdW5jdGlvbihlLHQpe3ZhciBuLHI9ZVt0aGlzLmV4cGFuZG9dO2lmKHZvaWQgMCE9PXIpe2lmKHZvaWQgMCE9PXQpe249KHQ9QXJyYXkuaXNBcnJheSh0KT90Lm1hcChYKToodD1YKHQpKWluIHI/W3RdOnQubWF0Y2goUCl8fFtdKS5sZW5ndGg7d2hpbGUobi0tKWRlbGV0ZSByW3Rbbl1dfSh2b2lkIDA9PT10fHxTLmlzRW1wdHlPYmplY3QocikpJiYoZS5ub2RlVHlwZT9lW3RoaXMuZXhwYW5kb109dm9pZCAwOmRlbGV0ZSBlW3RoaXMuZXhwYW5kb10pfX0saGFzRGF0YTpmdW5jdGlvbihlKXt2YXIgdD1lW3RoaXMuZXhwYW5kb107cmV0dXJuIHZvaWQgMCE9PXQmJiFTLmlzRW1wdHlPYmplY3QodCl9fTt2YXIgWT1uZXcgRyxRPW5ldyBHLEo9L14oPzpce1tcd1xXXSpcfXxcW1tcd1xXXSpcXSkkLyxLPS9bQS1aXS9nO2Z1bmN0aW9uIFooZSx0LG4pe3ZhciByLGk7aWYodm9pZCAwPT09biYmMT09PWUubm9kZVR5cGUpaWYocj0iZGF0YS0iK3QucmVwbGFjZShLLCItJCYiKS50b0xvd2VyQ2FzZSgpLCJzdHJpbmciPT10eXBlb2Yobj1lLmdldEF0dHJpYnV0ZShyKSkpe3RyeXtuPSJ0cnVlIj09PShpPW4pfHwiZmFsc2UiIT09aSYmKCJudWxsIj09PWk/bnVsbDppPT09K2krIiI/K2k6Si50ZXN0KGkpP0pTT04ucGFyc2UoaSk6aSl9Y2F0Y2goZSl7fVEuc2V0KGUsdCxuKX1lbHNlIG49dm9pZCAwO3JldHVybiBufVMuZXh0ZW5kKHtoYXNEYXRhOmZ1bmN0aW9uKGUpe3JldHVybiBRLmhhc0RhdGEoZSl8fFkuaGFzRGF0YShlKX0sZGF0YTpmdW5jdGlvbihlLHQsbil7cmV0dXJuIFEuYWNjZXNzKGUsdCxuKX0scmVtb3ZlRGF0YTpmdW5jdGlvbihlLHQpe1EucmVtb3ZlKGUsdCl9LF9kYXRhOmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gWS5hY2Nlc3MoZSx0LG4pfSxfcmVtb3ZlRGF0YTpmdW5jdGlvbihlLHQpe1kucmVtb3ZlKGUsdCl9fSksUy5mbi5leHRlbmQoe2RhdGE6ZnVuY3Rpb24obixlKXt2YXIgdCxyLGksbz10aGlzWzBdLGE9byYmby5hdHRyaWJ1dGVzO2lmKHZvaWQgMD09PW4pe2lmKHRoaXMubGVuZ3RoJiYoaT1RLmdldChvKSwxPT09by5ub2RlVHlwZSYmIVkuZ2V0KG8sImhhc0RhdGFBdHRycyIpKSl7dD1hLmxlbmd0aDt3aGlsZSh0LS0pYVt0XSYmMD09PShyPWFbdF0ubmFtZSkuaW5kZXhPZigiZGF0YS0iKSYmKHI9WChyLnNsaWNlKDUpKSxaKG8scixpW3JdKSk7WS5zZXQobywiaGFzRGF0YUF0dHJzIiwhMCl9cmV0dXJuIGl9cmV0dXJuIm9iamVjdCI9PXR5cGVvZiBuP3RoaXMuZWFjaChmdW5jdGlvbigpe1Euc2V0KHRoaXMsbil9KTokKHRoaXMsZnVuY3Rpb24oZSl7dmFyIHQ7aWYobyYmdm9pZCAwPT09ZSlyZXR1cm4gdm9pZCAwIT09KHQ9US5nZXQobyxuKSk/dDp2b2lkIDAhPT0odD1aKG8sbikpP3Q6dm9pZCAwO3RoaXMuZWFjaChmdW5jdGlvbigpe1Euc2V0KHRoaXMsbixlKX0pfSxudWxsLGUsMTxhcmd1bWVudHMubGVuZ3RoLG51bGwsITApfSxyZW1vdmVEYXRhOmZ1bmN0aW9uKGUpe3JldHVybiB0aGlzLmVhY2goZnVuY3Rpb24oKXtRLnJlbW92ZSh0aGlzLGUpfSl9fSksUy5leHRlbmQoe3F1ZXVlOmZ1bmN0aW9uKGUsdCxuKXt2YXIgcjtpZihlKXJldHVybiB0PSh0fHwiZngiKSsicXVldWUiLHI9WS5nZXQoZSx0KSxuJiYoIXJ8fEFycmF5LmlzQXJyYXkobik/cj1ZLmFjY2VzcyhlLHQsUy5tYWtlQXJyYXkobikpOnIucHVzaChuKSkscnx8W119LGRlcXVldWU6ZnVuY3Rpb24oZSx0KXt0PXR8fCJmeCI7dmFyIG49Uy5xdWV1ZShlLHQpLHI9bi5sZW5ndGgsaT1uLnNoaWZ0KCksbz1TLl9xdWV1ZUhvb2tzKGUsdCk7ImlucHJvZ3Jlc3MiPT09aSYmKGk9bi5zaGlmdCgpLHItLSksaSYmKCJmeCI9PT10JiZuLnVuc2hpZnQoImlucHJvZ3Jlc3MiKSxkZWxldGUgby5zdG9wLGkuY2FsbChlLGZ1bmN0aW9uKCl7Uy5kZXF1ZXVlKGUsdCl9LG8pKSwhciYmbyYmby5lbXB0eS5maXJlKCl9LF9xdWV1ZUhvb2tzOmZ1bmN0aW9uKGUsdCl7dmFyIG49dCsicXVldWVIb29rcyI7cmV0dXJuIFkuZ2V0KGUsbil8fFkuYWNjZXNzKGUsbix7ZW1wdHk6Uy5DYWxsYmFja3MoIm9uY2UgbWVtb3J5IikuYWRkKGZ1bmN0aW9uKCl7WS5yZW1vdmUoZSxbdCsicXVldWUiLG5dKX0pfSl9fSksUy5mbi5leHRlbmQoe3F1ZXVlOmZ1bmN0aW9uKHQsbil7dmFyIGU9MjtyZXR1cm4ic3RyaW5nIiE9dHlwZW9mIHQmJihuPXQsdD0iZngiLGUtLSksYXJndW1lbnRzLmxlbmd0aDxlP1MucXVldWUodGhpc1swXSx0KTp2b2lkIDA9PT1uP3RoaXM6dGhpcy5lYWNoKGZ1bmN0aW9uKCl7dmFyIGU9Uy5xdWV1ZSh0aGlzLHQsbik7Uy5fcXVldWVIb29rcyh0aGlzLHQpLCJmeCI9PT10JiYiaW5wcm9ncmVzcyIhPT1lWzBdJiZTLmRlcXVldWUodGhpcyx0KX0pfSxkZXF1ZXVlOmZ1bmN0aW9uKGUpe3JldHVybiB0aGlzLmVhY2goZnVuY3Rpb24oKXtTLmRlcXVldWUodGhpcyxlKX0pfSxjbGVhclF1ZXVlOmZ1bmN0aW9uKGUpe3JldHVybiB0aGlzLnF1ZXVlKGV8fCJmeCIsW10pfSxwcm9taXNlOmZ1bmN0aW9uKGUsdCl7dmFyIG4scj0xLGk9Uy5EZWZlcnJlZCgpLG89dGhpcyxhPXRoaXMubGVuZ3RoLHM9ZnVuY3Rpb24oKXstLXJ8fGkucmVzb2x2ZVdpdGgobyxbb10pfTsic3RyaW5nIiE9dHlwZW9mIGUmJih0PWUsZT12b2lkIDApLGU9ZXx8ImZ4Ijt3aGlsZShhLS0pKG49WS5nZXQob1thXSxlKyJxdWV1ZUhvb2tzIikpJiZuLmVtcHR5JiYocisrLG4uZW1wdHkuYWRkKHMpKTtyZXR1cm4gcygpLGkucHJvbWlzZSh0KX19KTt2YXIgZWU9L1srLV0/KD86XGQqXC58KVxkKyg/OltlRV1bKy1dP1xkK3wpLy5zb3VyY2UsdGU9bmV3IFJlZ0V4cCgiXig/OihbKy1dKT18KSgiK2VlKyIpKFthLXolXSopJCIsImkiKSxuZT1bIlRvcCIsIlJpZ2h0IiwiQm90dG9tIiwiTGVmdCJdLHJlPUUuZG9jdW1lbnRFbGVtZW50LGllPWZ1bmN0aW9uKGUpe3JldHVybiBTLmNvbnRhaW5zKGUub3duZXJEb2N1bWVudCxlKX0sb2U9e2NvbXBvc2VkOiEwfTtyZS5nZXRSb290Tm9kZSYmKGllPWZ1bmN0aW9uKGUpe3JldHVybiBTLmNvbnRhaW5zKGUub3duZXJEb2N1bWVudCxlKXx8ZS5nZXRSb290Tm9kZShvZSk9PT1lLm93bmVyRG9jdW1lbnR9KTt2YXIgYWU9ZnVuY3Rpb24oZSx0KXtyZXR1cm4ibm9uZSI9PT0oZT10fHxlKS5zdHlsZS5kaXNwbGF5fHwiIj09PWUuc3R5bGUuZGlzcGxheSYmaWUoZSkmJiJub25lIj09PVMuY3NzKGUsImRpc3BsYXkiKX07ZnVuY3Rpb24gc2UoZSx0LG4scil7dmFyIGksbyxhPTIwLHM9cj9mdW5jdGlvbigpe3JldHVybiByLmN1cigpfTpmdW5jdGlvbigpe3JldHVybiBTLmNzcyhlLHQsIiIpfSx1PXMoKSxsPW4mJm5bM118fChTLmNzc051bWJlclt0XT8iIjoicHgiKSxjPWUubm9kZVR5cGUmJihTLmNzc051bWJlclt0XXx8InB4IiE9PWwmJit1KSYmdGUuZXhlYyhTLmNzcyhlLHQpKTtpZihjJiZjWzNdIT09bCl7dS89MixsPWx8fGNbM10sYz0rdXx8MTt3aGlsZShhLS0pUy5zdHlsZShlLHQsYytsKSwoMS1vKSooMS0obz1zKCkvdXx8LjUpKTw9MCYmKGE9MCksYy89bztjKj0yLFMuc3R5bGUoZSx0LGMrbCksbj1ufHxbXX1yZXR1cm4gbiYmKGM9K2N8fCt1fHwwLGk9blsxXT9jKyhuWzFdKzEpKm5bMl06K25bMl0sciYmKHIudW5pdD1sLHIuc3RhcnQ9YyxyLmVuZD1pKSksaX12YXIgdWU9e307ZnVuY3Rpb24gbGUoZSx0KXtmb3IodmFyIG4scixpLG8sYSxzLHUsbD1bXSxjPTAsZj1lLmxlbmd0aDtjPGY7YysrKShyPWVbY10pLnN0eWxlJiYobj1yLnN0eWxlLmRpc3BsYXksdD8oIm5vbmUiPT09biYmKGxbY109WS5nZXQociwiZGlzcGxheSIpfHxudWxsLGxbY118fChyLnN0eWxlLmRpc3BsYXk9IiIpKSwiIj09PXIuc3R5bGUuZGlzcGxheSYmYWUocikmJihsW2NdPSh1PWE9bz12b2lkIDAsYT0oaT1yKS5vd25lckRvY3VtZW50LHM9aS5ub2RlTmFtZSwodT11ZVtzXSl8fChvPWEuYm9keS5hcHBlbmRDaGlsZChhLmNyZWF0ZUVsZW1lbnQocykpLHU9Uy5jc3MobywiZGlzcGxheSIpLG8ucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChvKSwibm9uZSI9PT11JiYodT0iYmxvY2siKSx1ZVtzXT11KSkpKToibm9uZSIhPT1uJiYobFtjXT0ibm9uZSIsWS5zZXQociwiZGlzcGxheSIsbikpKTtmb3IoYz0wO2M8ZjtjKyspbnVsbCE9bFtjXSYmKGVbY10uc3R5bGUuZGlzcGxheT1sW2NdKTtyZXR1cm4gZX1TLmZuLmV4dGVuZCh7c2hvdzpmdW5jdGlvbigpe3JldHVybiBsZSh0aGlzLCEwKX0saGlkZTpmdW5jdGlvbigpe3JldHVybiBsZSh0aGlzKX0sdG9nZ2xlOmZ1bmN0aW9uKGUpe3JldHVybiJib29sZWFuIj09dHlwZW9mIGU/ZT90aGlzLnNob3coKTp0aGlzLmhpZGUoKTp0aGlzLmVhY2goZnVuY3Rpb24oKXthZSh0aGlzKT9TKHRoaXMpLnNob3coKTpTKHRoaXMpLmhpZGUoKX0pfX0pO3ZhciBjZSxmZSxwZT0vXig/OmNoZWNrYm94fHJhZGlvKSQvaSxkZT0vPChbYS16XVteXC9cMD5ceDIwXHRcclxuXGZdKikvaSxoZT0vXiR8Xm1vZHVsZSR8XC8oPzpqYXZhfGVjbWEpc2NyaXB0L2k7Y2U9RS5jcmVhdGVEb2N1bWVudEZyYWdtZW50KCkuYXBwZW5kQ2hpbGQoRS5jcmVhdGVFbGVtZW50KCJkaXYiKSksKGZlPUUuY3JlYXRlRWxlbWVudCgiaW5wdXQiKSkuc2V0QXR0cmlidXRlKCJ0eXBlIiwicmFkaW8iKSxmZS5zZXRBdHRyaWJ1dGUoImNoZWNrZWQiLCJjaGVja2VkIiksZmUuc2V0QXR0cmlidXRlKCJuYW1lIiwidCIpLGNlLmFwcGVuZENoaWxkKGZlKSx5LmNoZWNrQ2xvbmU9Y2UuY2xvbmVOb2RlKCEwKS5jbG9uZU5vZGUoITApLmxhc3RDaGlsZC5jaGVja2VkLGNlLmlubmVySFRNTD0iPHRleHRhcmVhPng8L3RleHRhcmVhPiIseS5ub0Nsb25lQ2hlY2tlZD0hIWNlLmNsb25lTm9kZSghMCkubGFzdENoaWxkLmRlZmF1bHRWYWx1ZSxjZS5pbm5lckhUTUw9IjxvcHRpb24+PC9vcHRpb24+Iix5Lm9wdGlvbj0hIWNlLmxhc3RDaGlsZDt2YXIgZ2U9e3RoZWFkOlsxLCI8dGFibGU+IiwiPC90YWJsZT4iXSxjb2w6WzIsIjx0YWJsZT48Y29sZ3JvdXA+IiwiPC9jb2xncm91cD48L3RhYmxlPiJdLHRyOlsyLCI8dGFibGU+PHRib2R5PiIsIjwvdGJvZHk+PC90YWJsZT4iXSx0ZDpbMywiPHRhYmxlPjx0Ym9keT48dHI+IiwiPC90cj48L3Rib2R5PjwvdGFibGU+Il0sX2RlZmF1bHQ6WzAsIiIsIiJdfTtmdW5jdGlvbiB2ZShlLHQpe3ZhciBuO3JldHVybiBuPSJ1bmRlZmluZWQiIT10eXBlb2YgZS5nZXRFbGVtZW50c0J5VGFnTmFtZT9lLmdldEVsZW1lbnRzQnlUYWdOYW1lKHR8fCIqIik6InVuZGVmaW5lZCIhPXR5cGVvZiBlLnF1ZXJ5U2VsZWN0b3JBbGw/ZS5xdWVyeVNlbGVjdG9yQWxsKHR8fCIqIik6W10sdm9pZCAwPT09dHx8dCYmQShlLHQpP1MubWVyZ2UoW2VdLG4pOm59ZnVuY3Rpb24geWUoZSx0KXtmb3IodmFyIG49MCxyPWUubGVuZ3RoO248cjtuKyspWS5zZXQoZVtuXSwiZ2xvYmFsRXZhbCIsIXR8fFkuZ2V0KHRbbl0sImdsb2JhbEV2YWwiKSl9Z2UudGJvZHk9Z2UudGZvb3Q9Z2UuY29sZ3JvdXA9Z2UuY2FwdGlvbj1nZS50aGVhZCxnZS50aD1nZS50ZCx5Lm9wdGlvbnx8KGdlLm9wdGdyb3VwPWdlLm9wdGlvbj1bMSwiPHNlbGVjdCBtdWx0aXBsZT0nbXVsdGlwbGUnPiIsIjwvc2VsZWN0PiJdKTt2YXIgbWU9Lzx8JiM/XHcrOy87ZnVuY3Rpb24geGUoZSx0LG4scixpKXtmb3IodmFyIG8sYSxzLHUsbCxjLGY9dC5jcmVhdGVEb2N1bWVudEZyYWdtZW50KCkscD1bXSxkPTAsaD1lLmxlbmd0aDtkPGg7ZCsrKWlmKChvPWVbZF0pfHwwPT09bylpZigib2JqZWN0Ij09PXcobykpUy5tZXJnZShwLG8ubm9kZVR5cGU/W29dOm8pO2Vsc2UgaWYobWUudGVzdChvKSl7YT1hfHxmLmFwcGVuZENoaWxkKHQuY3JlYXRlRWxlbWVudCgiZGl2IikpLHM9KGRlLmV4ZWMobyl8fFsiIiwiIl0pWzFdLnRvTG93ZXJDYXNlKCksdT1nZVtzXXx8Z2UuX2RlZmF1bHQsYS5pbm5lckhUTUw9dVsxXStTLmh0bWxQcmVmaWx0ZXIobykrdVsyXSxjPXVbMF07d2hpbGUoYy0tKWE9YS5sYXN0Q2hpbGQ7Uy5tZXJnZShwLGEuY2hpbGROb2RlcyksKGE9Zi5maXJzdENoaWxkKS50ZXh0Q29udGVudD0iIn1lbHNlIHAucHVzaCh0LmNyZWF0ZVRleHROb2RlKG8pKTtmLnRleHRDb250ZW50PSIiLGQ9MDt3aGlsZShvPXBbZCsrXSlpZihyJiYtMTxTLmluQXJyYXkobyxyKSlpJiZpLnB1c2gobyk7ZWxzZSBpZihsPWllKG8pLGE9dmUoZi5hcHBlbmRDaGlsZChvKSwic2NyaXB0IiksbCYmeWUoYSksbil7Yz0wO3doaWxlKG89YVtjKytdKWhlLnRlc3Qoby50eXBlfHwiIikmJm4ucHVzaChvKX1yZXR1cm4gZn12YXIgYmU9L14oW14uXSopKD86XC4oLispfCkvO2Z1bmN0aW9uIHdlKCl7cmV0dXJuITB9ZnVuY3Rpb24gVGUoKXtyZXR1cm4hMX1mdW5jdGlvbiBDZShlLHQpe3JldHVybiBlPT09ZnVuY3Rpb24oKXt0cnl7cmV0dXJuIEUuYWN0aXZlRWxlbWVudH1jYXRjaChlKXt9fSgpPT0oImZvY3VzIj09PXQpfWZ1bmN0aW9uIEVlKGUsdCxuLHIsaSxvKXt2YXIgYSxzO2lmKCJvYmplY3QiPT10eXBlb2YgdCl7Zm9yKHMgaW4ic3RyaW5nIiE9dHlwZW9mIG4mJihyPXJ8fG4sbj12b2lkIDApLHQpRWUoZSxzLG4scix0W3NdLG8pO3JldHVybiBlfWlmKG51bGw9PXImJm51bGw9PWk/KGk9bixyPW49dm9pZCAwKTpudWxsPT1pJiYoInN0cmluZyI9PXR5cGVvZiBuPyhpPXIscj12b2lkIDApOihpPXIscj1uLG49dm9pZCAwKSksITE9PT1pKWk9VGU7ZWxzZSBpZighaSlyZXR1cm4gZTtyZXR1cm4gMT09PW8mJihhPWksKGk9ZnVuY3Rpb24oZSl7cmV0dXJuIFMoKS5vZmYoZSksYS5hcHBseSh0aGlzLGFyZ3VtZW50cyl9KS5ndWlkPWEuZ3VpZHx8KGEuZ3VpZD1TLmd1aWQrKykpLGUuZWFjaChmdW5jdGlvbigpe1MuZXZlbnQuYWRkKHRoaXMsdCxpLHIsbil9KX1mdW5jdGlvbiBTZShlLGksbyl7bz8oWS5zZXQoZSxpLCExKSxTLmV2ZW50LmFkZChlLGkse25hbWVzcGFjZTohMSxoYW5kbGVyOmZ1bmN0aW9uKGUpe3ZhciB0LG4scj1ZLmdldCh0aGlzLGkpO2lmKDEmZS5pc1RyaWdnZXImJnRoaXNbaV0pe2lmKHIubGVuZ3RoKShTLmV2ZW50LnNwZWNpYWxbaV18fHt9KS5kZWxlZ2F0ZVR5cGUmJmUuc3RvcFByb3BhZ2F0aW9uKCk7ZWxzZSBpZihyPXMuY2FsbChhcmd1bWVudHMpLFkuc2V0KHRoaXMsaSxyKSx0PW8odGhpcyxpKSx0aGlzW2ldKCksciE9PShuPVkuZ2V0KHRoaXMsaSkpfHx0P1kuc2V0KHRoaXMsaSwhMSk6bj17fSxyIT09bilyZXR1cm4gZS5zdG9wSW1tZWRpYXRlUHJvcGFnYXRpb24oKSxlLnByZXZlbnREZWZhdWx0KCksbiYmbi52YWx1ZX1lbHNlIHIubGVuZ3RoJiYoWS5zZXQodGhpcyxpLHt2YWx1ZTpTLmV2ZW50LnRyaWdnZXIoUy5leHRlbmQoclswXSxTLkV2ZW50LnByb3RvdHlwZSksci5zbGljZSgxKSx0aGlzKX0pLGUuc3RvcEltbWVkaWF0ZVByb3BhZ2F0aW9uKCkpfX0pKTp2b2lkIDA9PT1ZLmdldChlLGkpJiZTLmV2ZW50LmFkZChlLGksd2UpfVMuZXZlbnQ9e2dsb2JhbDp7fSxhZGQ6ZnVuY3Rpb24odCxlLG4scixpKXt2YXIgbyxhLHMsdSxsLGMsZixwLGQsaCxnLHY9WS5nZXQodCk7aWYoVih0KSl7bi5oYW5kbGVyJiYobj0obz1uKS5oYW5kbGVyLGk9by5zZWxlY3RvciksaSYmUy5maW5kLm1hdGNoZXNTZWxlY3RvcihyZSxpKSxuLmd1aWR8fChuLmd1aWQ9Uy5ndWlkKyspLCh1PXYuZXZlbnRzKXx8KHU9di5ldmVudHM9T2JqZWN0LmNyZWF0ZShudWxsKSksKGE9di5oYW5kbGUpfHwoYT12LmhhbmRsZT1mdW5jdGlvbihlKXtyZXR1cm4idW5kZWZpbmVkIiE9dHlwZW9mIFMmJlMuZXZlbnQudHJpZ2dlcmVkIT09ZS50eXBlP1MuZXZlbnQuZGlzcGF0Y2guYXBwbHkodCxhcmd1bWVudHMpOnZvaWQgMH0pLGw9KGU9KGV8fCIiKS5tYXRjaChQKXx8WyIiXSkubGVuZ3RoO3doaWxlKGwtLSlkPWc9KHM9YmUuZXhlYyhlW2xdKXx8W10pWzFdLGg9KHNbMl18fCIiKS5zcGxpdCgiLiIpLnNvcnQoKSxkJiYoZj1TLmV2ZW50LnNwZWNpYWxbZF18fHt9LGQ9KGk/Zi5kZWxlZ2F0ZVR5cGU6Zi5iaW5kVHlwZSl8fGQsZj1TLmV2ZW50LnNwZWNpYWxbZF18fHt9LGM9Uy5leHRlbmQoe3R5cGU6ZCxvcmlnVHlwZTpnLGRhdGE6cixoYW5kbGVyOm4sZ3VpZDpuLmd1aWQsc2VsZWN0b3I6aSxuZWVkc0NvbnRleHQ6aSYmUy5leHByLm1hdGNoLm5lZWRzQ29udGV4dC50ZXN0KGkpLG5hbWVzcGFjZTpoLmpvaW4oIi4iKX0sbyksKHA9dVtkXSl8fCgocD11W2RdPVtdKS5kZWxlZ2F0ZUNvdW50PTAsZi5zZXR1cCYmITEhPT1mLnNldHVwLmNhbGwodCxyLGgsYSl8fHQuYWRkRXZlbnRMaXN0ZW5lciYmdC5hZGRFdmVudExpc3RlbmVyKGQsYSkpLGYuYWRkJiYoZi5hZGQuY2FsbCh0LGMpLGMuaGFuZGxlci5ndWlkfHwoYy5oYW5kbGVyLmd1aWQ9bi5ndWlkKSksaT9wLnNwbGljZShwLmRlbGVnYXRlQ291bnQrKywwLGMpOnAucHVzaChjKSxTLmV2ZW50Lmdsb2JhbFtkXT0hMCl9fSxyZW1vdmU6ZnVuY3Rpb24oZSx0LG4scixpKXt2YXIgbyxhLHMsdSxsLGMsZixwLGQsaCxnLHY9WS5oYXNEYXRhKGUpJiZZLmdldChlKTtpZih2JiYodT12LmV2ZW50cykpe2w9KHQ9KHR8fCIiKS5tYXRjaChQKXx8WyIiXSkubGVuZ3RoO3doaWxlKGwtLSlpZihkPWc9KHM9YmUuZXhlYyh0W2xdKXx8W10pWzFdLGg9KHNbMl18fCIiKS5zcGxpdCgiLiIpLnNvcnQoKSxkKXtmPVMuZXZlbnQuc3BlY2lhbFtkXXx8e30scD11W2Q9KHI/Zi5kZWxlZ2F0ZVR5cGU6Zi5iaW5kVHlwZSl8fGRdfHxbXSxzPXNbMl0mJm5ldyBSZWdFeHAoIihefFxcLikiK2guam9pbigiXFwuKD86LipcXC58KSIpKyIoXFwufCQpIiksYT1vPXAubGVuZ3RoO3doaWxlKG8tLSljPXBbb10sIWkmJmchPT1jLm9yaWdUeXBlfHxuJiZuLmd1aWQhPT1jLmd1aWR8fHMmJiFzLnRlc3QoYy5uYW1lc3BhY2UpfHxyJiZyIT09Yy5zZWxlY3RvciYmKCIqKiIhPT1yfHwhYy5zZWxlY3Rvcil8fChwLnNwbGljZShvLDEpLGMuc2VsZWN0b3ImJnAuZGVsZWdhdGVDb3VudC0tLGYucmVtb3ZlJiZmLnJlbW92ZS5jYWxsKGUsYykpO2EmJiFwLmxlbmd0aCYmKGYudGVhcmRvd24mJiExIT09Zi50ZWFyZG93bi5jYWxsKGUsaCx2LmhhbmRsZSl8fFMucmVtb3ZlRXZlbnQoZSxkLHYuaGFuZGxlKSxkZWxldGUgdVtkXSl9ZWxzZSBmb3IoZCBpbiB1KVMuZXZlbnQucmVtb3ZlKGUsZCt0W2xdLG4sciwhMCk7Uy5pc0VtcHR5T2JqZWN0KHUpJiZZLnJlbW92ZShlLCJoYW5kbGUgZXZlbnRzIil9fSxkaXNwYXRjaDpmdW5jdGlvbihlKXt2YXIgdCxuLHIsaSxvLGEscz1uZXcgQXJyYXkoYXJndW1lbnRzLmxlbmd0aCksdT1TLmV2ZW50LmZpeChlKSxsPShZLmdldCh0aGlzLCJldmVudHMiKXx8T2JqZWN0LmNyZWF0ZShudWxsKSlbdS50eXBlXXx8W10sYz1TLmV2ZW50LnNwZWNpYWxbdS50eXBlXXx8e307Zm9yKHNbMF09dSx0PTE7dDxhcmd1bWVudHMubGVuZ3RoO3QrKylzW3RdPWFyZ3VtZW50c1t0XTtpZih1LmRlbGVnYXRlVGFyZ2V0PXRoaXMsIWMucHJlRGlzcGF0Y2h8fCExIT09Yy5wcmVEaXNwYXRjaC5jYWxsKHRoaXMsdSkpe2E9Uy5ldmVudC5oYW5kbGVycy5jYWxsKHRoaXMsdSxsKSx0PTA7d2hpbGUoKGk9YVt0KytdKSYmIXUuaXNQcm9wYWdhdGlvblN0b3BwZWQoKSl7dS5jdXJyZW50VGFyZ2V0PWkuZWxlbSxuPTA7d2hpbGUoKG89aS5oYW5kbGVyc1tuKytdKSYmIXUuaXNJbW1lZGlhdGVQcm9wYWdhdGlvblN0b3BwZWQoKSl1LnJuYW1lc3BhY2UmJiExIT09by5uYW1lc3BhY2UmJiF1LnJuYW1lc3BhY2UudGVzdChvLm5hbWVzcGFjZSl8fCh1LmhhbmRsZU9iaj1vLHUuZGF0YT1vLmRhdGEsdm9pZCAwIT09KHI9KChTLmV2ZW50LnNwZWNpYWxbby5vcmlnVHlwZV18fHt9KS5oYW5kbGV8fG8uaGFuZGxlcikuYXBwbHkoaS5lbGVtLHMpKSYmITE9PT0odS5yZXN1bHQ9cikmJih1LnByZXZlbnREZWZhdWx0KCksdS5zdG9wUHJvcGFnYXRpb24oKSkpfXJldHVybiBjLnBvc3REaXNwYXRjaCYmYy5wb3N0RGlzcGF0Y2guY2FsbCh0aGlzLHUpLHUucmVzdWx0fX0saGFuZGxlcnM6ZnVuY3Rpb24oZSx0KXt2YXIgbixyLGksbyxhLHM9W10sdT10LmRlbGVnYXRlQ291bnQsbD1lLnRhcmdldDtpZih1JiZsLm5vZGVUeXBlJiYhKCJjbGljayI9PT1lLnR5cGUmJjE8PWUuYnV0dG9uKSlmb3IoO2whPT10aGlzO2w9bC5wYXJlbnROb2RlfHx0aGlzKWlmKDE9PT1sLm5vZGVUeXBlJiYoImNsaWNrIiE9PWUudHlwZXx8ITAhPT1sLmRpc2FibGVkKSl7Zm9yKG89W10sYT17fSxuPTA7bjx1O24rKyl2b2lkIDA9PT1hW2k9KHI9dFtuXSkuc2VsZWN0b3IrIiAiXSYmKGFbaV09ci5uZWVkc0NvbnRleHQ/LTE8UyhpLHRoaXMpLmluZGV4KGwpOlMuZmluZChpLHRoaXMsbnVsbCxbbF0pLmxlbmd0aCksYVtpXSYmby5wdXNoKHIpO28ubGVuZ3RoJiZzLnB1c2goe2VsZW06bCxoYW5kbGVyczpvfSl9cmV0dXJuIGw9dGhpcyx1PHQubGVuZ3RoJiZzLnB1c2goe2VsZW06bCxoYW5kbGVyczp0LnNsaWNlKHUpfSksc30sYWRkUHJvcDpmdW5jdGlvbih0LGUpe09iamVjdC5kZWZpbmVQcm9wZXJ0eShTLkV2ZW50LnByb3RvdHlwZSx0LHtlbnVtZXJhYmxlOiEwLGNvbmZpZ3VyYWJsZTohMCxnZXQ6bShlKT9mdW5jdGlvbigpe2lmKHRoaXMub3JpZ2luYWxFdmVudClyZXR1cm4gZSh0aGlzLm9yaWdpbmFsRXZlbnQpfTpmdW5jdGlvbigpe2lmKHRoaXMub3JpZ2luYWxFdmVudClyZXR1cm4gdGhpcy5vcmlnaW5hbEV2ZW50W3RdfSxzZXQ6ZnVuY3Rpb24oZSl7T2JqZWN0LmRlZmluZVByb3BlcnR5KHRoaXMsdCx7ZW51bWVyYWJsZTohMCxjb25maWd1cmFibGU6ITAsd3JpdGFibGU6ITAsdmFsdWU6ZX0pfX0pfSxmaXg6ZnVuY3Rpb24oZSl7cmV0dXJuIGVbUy5leHBhbmRvXT9lOm5ldyBTLkV2ZW50KGUpfSxzcGVjaWFsOntsb2FkOntub0J1YmJsZTohMH0sY2xpY2s6e3NldHVwOmZ1bmN0aW9uKGUpe3ZhciB0PXRoaXN8fGU7cmV0dXJuIHBlLnRlc3QodC50eXBlKSYmdC5jbGljayYmQSh0LCJpbnB1dCIpJiZTZSh0LCJjbGljayIsd2UpLCExfSx0cmlnZ2VyOmZ1bmN0aW9uKGUpe3ZhciB0PXRoaXN8fGU7cmV0dXJuIHBlLnRlc3QodC50eXBlKSYmdC5jbGljayYmQSh0LCJpbnB1dCIpJiZTZSh0LCJjbGljayIpLCEwfSxfZGVmYXVsdDpmdW5jdGlvbihlKXt2YXIgdD1lLnRhcmdldDtyZXR1cm4gcGUudGVzdCh0LnR5cGUpJiZ0LmNsaWNrJiZBKHQsImlucHV0IikmJlkuZ2V0KHQsImNsaWNrIil8fEEodCwiYSIpfX0sYmVmb3JldW5sb2FkOntwb3N0RGlzcGF0Y2g6ZnVuY3Rpb24oZSl7dm9pZCAwIT09ZS5yZXN1bHQmJmUub3JpZ2luYWxFdmVudCYmKGUub3JpZ2luYWxFdmVudC5yZXR1cm5WYWx1ZT1lLnJlc3VsdCl9fX19LFMucmVtb3ZlRXZlbnQ9ZnVuY3Rpb24oZSx0LG4pe2UucmVtb3ZlRXZlbnRMaXN0ZW5lciYmZS5yZW1vdmVFdmVudExpc3RlbmVyKHQsbil9LFMuRXZlbnQ9ZnVuY3Rpb24oZSx0KXtpZighKHRoaXMgaW5zdGFuY2VvZiBTLkV2ZW50KSlyZXR1cm4gbmV3IFMuRXZlbnQoZSx0KTtlJiZlLnR5cGU/KHRoaXMub3JpZ2luYWxFdmVudD1lLHRoaXMudHlwZT1lLnR5cGUsdGhpcy5pc0RlZmF1bHRQcmV2ZW50ZWQ9ZS5kZWZhdWx0UHJldmVudGVkfHx2b2lkIDA9PT1lLmRlZmF1bHRQcmV2ZW50ZWQmJiExPT09ZS5yZXR1cm5WYWx1ZT93ZTpUZSx0aGlzLnRhcmdldD1lLnRhcmdldCYmMz09PWUudGFyZ2V0Lm5vZGVUeXBlP2UudGFyZ2V0LnBhcmVudE5vZGU6ZS50YXJnZXQsdGhpcy5jdXJyZW50VGFyZ2V0PWUuY3VycmVudFRhcmdldCx0aGlzLnJlbGF0ZWRUYXJnZXQ9ZS5yZWxhdGVkVGFyZ2V0KTp0aGlzLnR5cGU9ZSx0JiZTLmV4dGVuZCh0aGlzLHQpLHRoaXMudGltZVN0YW1wPWUmJmUudGltZVN0YW1wfHxEYXRlLm5vdygpLHRoaXNbUy5leHBhbmRvXT0hMH0sUy5FdmVudC5wcm90b3R5cGU9e2NvbnN0cnVjdG9yOlMuRXZlbnQsaXNEZWZhdWx0UHJldmVudGVkOlRlLGlzUHJvcGFnYXRpb25TdG9wcGVkOlRlLGlzSW1tZWRpYXRlUHJvcGFnYXRpb25TdG9wcGVkOlRlLGlzU2ltdWxhdGVkOiExLHByZXZlbnREZWZhdWx0OmZ1bmN0aW9uKCl7dmFyIGU9dGhpcy5vcmlnaW5hbEV2ZW50O3RoaXMuaXNEZWZhdWx0UHJldmVudGVkPXdlLGUmJiF0aGlzLmlzU2ltdWxhdGVkJiZlLnByZXZlbnREZWZhdWx0KCl9LHN0b3BQcm9wYWdhdGlvbjpmdW5jdGlvbigpe3ZhciBlPXRoaXMub3JpZ2luYWxFdmVudDt0aGlzLmlzUHJvcGFnYXRpb25TdG9wcGVkPXdlLGUmJiF0aGlzLmlzU2ltdWxhdGVkJiZlLnN0b3BQcm9wYWdhdGlvbigpfSxzdG9wSW1tZWRpYXRlUHJvcGFnYXRpb246ZnVuY3Rpb24oKXt2YXIgZT10aGlzLm9yaWdpbmFsRXZlbnQ7dGhpcy5pc0ltbWVkaWF0ZVByb3BhZ2F0aW9uU3RvcHBlZD13ZSxlJiYhdGhpcy5pc1NpbXVsYXRlZCYmZS5zdG9wSW1tZWRpYXRlUHJvcGFnYXRpb24oKSx0aGlzLnN0b3BQcm9wYWdhdGlvbigpfX0sUy5lYWNoKHthbHRLZXk6ITAsYnViYmxlczohMCxjYW5jZWxhYmxlOiEwLGNoYW5nZWRUb3VjaGVzOiEwLGN0cmxLZXk6ITAsZGV0YWlsOiEwLGV2ZW50UGhhc2U6ITAsbWV0YUtleTohMCxwYWdlWDohMCxwYWdlWTohMCxzaGlmdEtleTohMCx2aWV3OiEwLCJjaGFyIjohMCxjb2RlOiEwLGNoYXJDb2RlOiEwLGtleTohMCxrZXlDb2RlOiEwLGJ1dHRvbjohMCxidXR0b25zOiEwLGNsaWVudFg6ITAsY2xpZW50WTohMCxvZmZzZXRYOiEwLG9mZnNldFk6ITAscG9pbnRlcklkOiEwLHBvaW50ZXJUeXBlOiEwLHNjcmVlblg6ITAsc2NyZWVuWTohMCx0YXJnZXRUb3VjaGVzOiEwLHRvRWxlbWVudDohMCx0b3VjaGVzOiEwLHdoaWNoOiEwfSxTLmV2ZW50LmFkZFByb3ApLFMuZWFjaCh7Zm9jdXM6ImZvY3VzaW4iLGJsdXI6ImZvY3Vzb3V0In0sZnVuY3Rpb24oZSx0KXtTLmV2ZW50LnNwZWNpYWxbZV09e3NldHVwOmZ1bmN0aW9uKCl7cmV0dXJuIFNlKHRoaXMsZSxDZSksITF9LHRyaWdnZXI6ZnVuY3Rpb24oKXtyZXR1cm4gU2UodGhpcyxlKSwhMH0sX2RlZmF1bHQ6ZnVuY3Rpb24oKXtyZXR1cm4hMH0sZGVsZWdhdGVUeXBlOnR9fSksUy5lYWNoKHttb3VzZWVudGVyOiJtb3VzZW92ZXIiLG1vdXNlbGVhdmU6Im1vdXNlb3V0Iixwb2ludGVyZW50ZXI6InBvaW50ZXJvdmVyIixwb2ludGVybGVhdmU6InBvaW50ZXJvdXQifSxmdW5jdGlvbihlLGkpe1MuZXZlbnQuc3BlY2lhbFtlXT17ZGVsZWdhdGVUeXBlOmksYmluZFR5cGU6aSxoYW5kbGU6ZnVuY3Rpb24oZSl7dmFyIHQsbj1lLnJlbGF0ZWRUYXJnZXQscj1lLmhhbmRsZU9iajtyZXR1cm4gbiYmKG49PT10aGlzfHxTLmNvbnRhaW5zKHRoaXMsbikpfHwoZS50eXBlPXIub3JpZ1R5cGUsdD1yLmhhbmRsZXIuYXBwbHkodGhpcyxhcmd1bWVudHMpLGUudHlwZT1pKSx0fX19KSxTLmZuLmV4dGVuZCh7b246ZnVuY3Rpb24oZSx0LG4scil7cmV0dXJuIEVlKHRoaXMsZSx0LG4scil9LG9uZTpmdW5jdGlvbihlLHQsbixyKXtyZXR1cm4gRWUodGhpcyxlLHQsbixyLDEpfSxvZmY6ZnVuY3Rpb24oZSx0LG4pe3ZhciByLGk7aWYoZSYmZS5wcmV2ZW50RGVmYXVsdCYmZS5oYW5kbGVPYmopcmV0dXJuIHI9ZS5oYW5kbGVPYmosUyhlLmRlbGVnYXRlVGFyZ2V0KS5vZmYoci5uYW1lc3BhY2U/ci5vcmlnVHlwZSsiLiIrci5uYW1lc3BhY2U6ci5vcmlnVHlwZSxyLnNlbGVjdG9yLHIuaGFuZGxlciksdGhpcztpZigib2JqZWN0Ij09dHlwZW9mIGUpe2ZvcihpIGluIGUpdGhpcy5vZmYoaSx0LGVbaV0pO3JldHVybiB0aGlzfXJldHVybiExIT09dCYmImZ1bmN0aW9uIiE9dHlwZW9mIHR8fChuPXQsdD12b2lkIDApLCExPT09biYmKG49VGUpLHRoaXMuZWFjaChmdW5jdGlvbigpe1MuZXZlbnQucmVtb3ZlKHRoaXMsZSxuLHQpfSl9fSk7dmFyIGtlPS88c2NyaXB0fDxzdHlsZXw8bGluay9pLEFlPS9jaGVja2VkXHMqKD86W149XXw9XHMqLmNoZWNrZWQuKS9pLE5lPS9eXHMqPCEoPzpcW0NEQVRBXFt8LS0pfCg/OlxdXF18LS0pPlxzKiQvZztmdW5jdGlvbiBqZShlLHQpe3JldHVybiBBKGUsInRhYmxlIikmJkEoMTEhPT10Lm5vZGVUeXBlP3Q6dC5maXJzdENoaWxkLCJ0ciIpJiZTKGUpLmNoaWxkcmVuKCJ0Ym9keSIpWzBdfHxlfWZ1bmN0aW9uIERlKGUpe3JldHVybiBlLnR5cGU9KG51bGwhPT1lLmdldEF0dHJpYnV0ZSgidHlwZSIpKSsiLyIrZS50eXBlLGV9ZnVuY3Rpb24gcWUoZSl7cmV0dXJuInRydWUvIj09PShlLnR5cGV8fCIiKS5zbGljZSgwLDUpP2UudHlwZT1lLnR5cGUuc2xpY2UoNSk6ZS5yZW1vdmVBdHRyaWJ1dGUoInR5cGUiKSxlfWZ1bmN0aW9uIExlKGUsdCl7dmFyIG4scixpLG8sYSxzO2lmKDE9PT10Lm5vZGVUeXBlKXtpZihZLmhhc0RhdGEoZSkmJihzPVkuZ2V0KGUpLmV2ZW50cykpZm9yKGkgaW4gWS5yZW1vdmUodCwiaGFuZGxlIGV2ZW50cyIpLHMpZm9yKG49MCxyPXNbaV0ubGVuZ3RoO248cjtuKyspUy5ldmVudC5hZGQodCxpLHNbaV1bbl0pO1EuaGFzRGF0YShlKSYmKG89US5hY2Nlc3MoZSksYT1TLmV4dGVuZCh7fSxvKSxRLnNldCh0LGEpKX19ZnVuY3Rpb24gSGUobixyLGksbyl7cj1nKHIpO3ZhciBlLHQsYSxzLHUsbCxjPTAsZj1uLmxlbmd0aCxwPWYtMSxkPXJbMF0saD1tKGQpO2lmKGh8fDE8ZiYmInN0cmluZyI9PXR5cGVvZiBkJiYheS5jaGVja0Nsb25lJiZBZS50ZXN0KGQpKXJldHVybiBuLmVhY2goZnVuY3Rpb24oZSl7dmFyIHQ9bi5lcShlKTtoJiYoclswXT1kLmNhbGwodGhpcyxlLHQuaHRtbCgpKSksSGUodCxyLGksbyl9KTtpZihmJiYodD0oZT14ZShyLG5bMF0ub3duZXJEb2N1bWVudCwhMSxuLG8pKS5maXJzdENoaWxkLDE9PT1lLmNoaWxkTm9kZXMubGVuZ3RoJiYoZT10KSx0fHxvKSl7Zm9yKHM9KGE9Uy5tYXAodmUoZSwic2NyaXB0IiksRGUpKS5sZW5ndGg7YzxmO2MrKyl1PWUsYyE9PXAmJih1PVMuY2xvbmUodSwhMCwhMCkscyYmUy5tZXJnZShhLHZlKHUsInNjcmlwdCIpKSksaS5jYWxsKG5bY10sdSxjKTtpZihzKWZvcihsPWFbYS5sZW5ndGgtMV0ub3duZXJEb2N1bWVudCxTLm1hcChhLHFlKSxjPTA7YzxzO2MrKyl1PWFbY10saGUudGVzdCh1LnR5cGV8fCIiKSYmIVkuYWNjZXNzKHUsImdsb2JhbEV2YWwiKSYmUy5jb250YWlucyhsLHUpJiYodS5zcmMmJiJtb2R1bGUiIT09KHUudHlwZXx8IiIpLnRvTG93ZXJDYXNlKCk/Uy5fZXZhbFVybCYmIXUubm9Nb2R1bGUmJlMuX2V2YWxVcmwodS5zcmMse25vbmNlOnUubm9uY2V8fHUuZ2V0QXR0cmlidXRlKCJub25jZSIpfSxsKTpiKHUudGV4dENvbnRlbnQucmVwbGFjZShOZSwiIiksdSxsKSl9cmV0dXJuIG59ZnVuY3Rpb24gT2UoZSx0LG4pe2Zvcih2YXIgcixpPXQ/Uy5maWx0ZXIodCxlKTplLG89MDtudWxsIT0ocj1pW29dKTtvKyspbnx8MSE9PXIubm9kZVR5cGV8fFMuY2xlYW5EYXRhKHZlKHIpKSxyLnBhcmVudE5vZGUmJihuJiZpZShyKSYmeWUodmUociwic2NyaXB0IikpLHIucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChyKSk7cmV0dXJuIGV9Uy5leHRlbmQoe2h0bWxQcmVmaWx0ZXI6ZnVuY3Rpb24oZSl7cmV0dXJuIGV9LGNsb25lOmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG8sYSxzLHUsbCxjPWUuY2xvbmVOb2RlKCEwKSxmPWllKGUpO2lmKCEoeS5ub0Nsb25lQ2hlY2tlZHx8MSE9PWUubm9kZVR5cGUmJjExIT09ZS5ub2RlVHlwZXx8Uy5pc1hNTERvYyhlKSkpZm9yKGE9dmUoYykscj0wLGk9KG89dmUoZSkpLmxlbmd0aDtyPGk7cisrKXM9b1tyXSx1PWFbcl0sdm9pZCAwLCJpbnB1dCI9PT0obD11Lm5vZGVOYW1lLnRvTG93ZXJDYXNlKCkpJiZwZS50ZXN0KHMudHlwZSk/dS5jaGVja2VkPXMuY2hlY2tlZDoiaW5wdXQiIT09bCYmInRleHRhcmVhIiE9PWx8fCh1LmRlZmF1bHRWYWx1ZT1zLmRlZmF1bHRWYWx1ZSk7aWYodClpZihuKWZvcihvPW98fHZlKGUpLGE9YXx8dmUoYykscj0wLGk9by5sZW5ndGg7cjxpO3IrKylMZShvW3JdLGFbcl0pO2Vsc2UgTGUoZSxjKTtyZXR1cm4gMDwoYT12ZShjLCJzY3JpcHQiKSkubGVuZ3RoJiZ5ZShhLCFmJiZ2ZShlLCJzY3JpcHQiKSksY30sY2xlYW5EYXRhOmZ1bmN0aW9uKGUpe2Zvcih2YXIgdCxuLHIsaT1TLmV2ZW50LnNwZWNpYWwsbz0wO3ZvaWQgMCE9PShuPWVbb10pO28rKylpZihWKG4pKXtpZih0PW5bWS5leHBhbmRvXSl7aWYodC5ldmVudHMpZm9yKHIgaW4gdC5ldmVudHMpaVtyXT9TLmV2ZW50LnJlbW92ZShuLHIpOlMucmVtb3ZlRXZlbnQobixyLHQuaGFuZGxlKTtuW1kuZXhwYW5kb109dm9pZCAwfW5bUS5leHBhbmRvXSYmKG5bUS5leHBhbmRvXT12b2lkIDApfX19KSxTLmZuLmV4dGVuZCh7ZGV0YWNoOmZ1bmN0aW9uKGUpe3JldHVybiBPZSh0aGlzLGUsITApfSxyZW1vdmU6ZnVuY3Rpb24oZSl7cmV0dXJuIE9lKHRoaXMsZSl9LHRleHQ6ZnVuY3Rpb24oZSl7cmV0dXJuICQodGhpcyxmdW5jdGlvbihlKXtyZXR1cm4gdm9pZCAwPT09ZT9TLnRleHQodGhpcyk6dGhpcy5lbXB0eSgpLmVhY2goZnVuY3Rpb24oKXsxIT09dGhpcy5ub2RlVHlwZSYmMTEhPT10aGlzLm5vZGVUeXBlJiY5IT09dGhpcy5ub2RlVHlwZXx8KHRoaXMudGV4dENvbnRlbnQ9ZSl9KX0sbnVsbCxlLGFyZ3VtZW50cy5sZW5ndGgpfSxhcHBlbmQ6ZnVuY3Rpb24oKXtyZXR1cm4gSGUodGhpcyxhcmd1bWVudHMsZnVuY3Rpb24oZSl7MSE9PXRoaXMubm9kZVR5cGUmJjExIT09dGhpcy5ub2RlVHlwZSYmOSE9PXRoaXMubm9kZVR5cGV8fGplKHRoaXMsZSkuYXBwZW5kQ2hpbGQoZSl9KX0scHJlcGVuZDpmdW5jdGlvbigpe3JldHVybiBIZSh0aGlzLGFyZ3VtZW50cyxmdW5jdGlvbihlKXtpZigxPT09dGhpcy5ub2RlVHlwZXx8MTE9PT10aGlzLm5vZGVUeXBlfHw5PT09dGhpcy5ub2RlVHlwZSl7dmFyIHQ9amUodGhpcyxlKTt0Lmluc2VydEJlZm9yZShlLHQuZmlyc3RDaGlsZCl9fSl9LGJlZm9yZTpmdW5jdGlvbigpe3JldHVybiBIZSh0aGlzLGFyZ3VtZW50cyxmdW5jdGlvbihlKXt0aGlzLnBhcmVudE5vZGUmJnRoaXMucGFyZW50Tm9kZS5pbnNlcnRCZWZvcmUoZSx0aGlzKX0pfSxhZnRlcjpmdW5jdGlvbigpe3JldHVybiBIZSh0aGlzLGFyZ3VtZW50cyxmdW5jdGlvbihlKXt0aGlzLnBhcmVudE5vZGUmJnRoaXMucGFyZW50Tm9kZS5pbnNlcnRCZWZvcmUoZSx0aGlzLm5leHRTaWJsaW5nKX0pfSxlbXB0eTpmdW5jdGlvbigpe2Zvcih2YXIgZSx0PTA7bnVsbCE9KGU9dGhpc1t0XSk7dCsrKTE9PT1lLm5vZGVUeXBlJiYoUy5jbGVhbkRhdGEodmUoZSwhMSkpLGUudGV4dENvbnRlbnQ9IiIpO3JldHVybiB0aGlzfSxjbG9uZTpmdW5jdGlvbihlLHQpe3JldHVybiBlPW51bGwhPWUmJmUsdD1udWxsPT10P2U6dCx0aGlzLm1hcChmdW5jdGlvbigpe3JldHVybiBTLmNsb25lKHRoaXMsZSx0KX0pfSxodG1sOmZ1bmN0aW9uKGUpe3JldHVybiAkKHRoaXMsZnVuY3Rpb24oZSl7dmFyIHQ9dGhpc1swXXx8e30sbj0wLHI9dGhpcy5sZW5ndGg7aWYodm9pZCAwPT09ZSYmMT09PXQubm9kZVR5cGUpcmV0dXJuIHQuaW5uZXJIVE1MO2lmKCJzdHJpbmciPT10eXBlb2YgZSYmIWtlLnRlc3QoZSkmJiFnZVsoZGUuZXhlYyhlKXx8WyIiLCIiXSlbMV0udG9Mb3dlckNhc2UoKV0pe2U9Uy5odG1sUHJlZmlsdGVyKGUpO3RyeXtmb3IoO248cjtuKyspMT09PSh0PXRoaXNbbl18fHt9KS5ub2RlVHlwZSYmKFMuY2xlYW5EYXRhKHZlKHQsITEpKSx0LmlubmVySFRNTD1lKTt0PTB9Y2F0Y2goZSl7fX10JiZ0aGlzLmVtcHR5KCkuYXBwZW5kKGUpfSxudWxsLGUsYXJndW1lbnRzLmxlbmd0aCl9LHJlcGxhY2VXaXRoOmZ1bmN0aW9uKCl7dmFyIG49W107cmV0dXJuIEhlKHRoaXMsYXJndW1lbnRzLGZ1bmN0aW9uKGUpe3ZhciB0PXRoaXMucGFyZW50Tm9kZTtTLmluQXJyYXkodGhpcyxuKTwwJiYoUy5jbGVhbkRhdGEodmUodGhpcykpLHQmJnQucmVwbGFjZUNoaWxkKGUsdGhpcykpfSxuKX19KSxTLmVhY2goe2FwcGVuZFRvOiJhcHBlbmQiLHByZXBlbmRUbzoicHJlcGVuZCIsaW5zZXJ0QmVmb3JlOiJiZWZvcmUiLGluc2VydEFmdGVyOiJhZnRlciIscmVwbGFjZUFsbDoicmVwbGFjZVdpdGgifSxmdW5jdGlvbihlLGEpe1MuZm5bZV09ZnVuY3Rpb24oZSl7Zm9yKHZhciB0LG49W10scj1TKGUpLGk9ci5sZW5ndGgtMSxvPTA7bzw9aTtvKyspdD1vPT09aT90aGlzOnRoaXMuY2xvbmUoITApLFMocltvXSlbYV0odCksdS5hcHBseShuLHQuZ2V0KCkpO3JldHVybiB0aGlzLnB1c2hTdGFjayhuKX19KTt2YXIgUGU9bmV3IFJlZ0V4cCgiXigiK2VlKyIpKD8hcHgpW2EteiVdKyQiLCJpIiksUmU9ZnVuY3Rpb24oZSl7dmFyIHQ9ZS5vd25lckRvY3VtZW50LmRlZmF1bHRWaWV3O3JldHVybiB0JiZ0Lm9wZW5lcnx8KHQ9QyksdC5nZXRDb21wdXRlZFN0eWxlKGUpfSxNZT1mdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvPXt9O2ZvcihpIGluIHQpb1tpXT1lLnN0eWxlW2ldLGUuc3R5bGVbaV09dFtpXTtmb3IoaSBpbiByPW4uY2FsbChlKSx0KWUuc3R5bGVbaV09b1tpXTtyZXR1cm4gcn0sSWU9bmV3IFJlZ0V4cChuZS5qb2luKCJ8IiksImkiKTtmdW5jdGlvbiBXZShlLHQsbil7dmFyIHIsaSxvLGEscz1lLnN0eWxlO3JldHVybihuPW58fFJlKGUpKSYmKCIiIT09KGE9bi5nZXRQcm9wZXJ0eVZhbHVlKHQpfHxuW3RdKXx8aWUoZSl8fChhPVMuc3R5bGUoZSx0KSksIXkucGl4ZWxCb3hTdHlsZXMoKSYmUGUudGVzdChhKSYmSWUudGVzdCh0KSYmKHI9cy53aWR0aCxpPXMubWluV2lkdGgsbz1zLm1heFdpZHRoLHMubWluV2lkdGg9cy5tYXhXaWR0aD1zLndpZHRoPWEsYT1uLndpZHRoLHMud2lkdGg9cixzLm1pbldpZHRoPWkscy5tYXhXaWR0aD1vKSksdm9pZCAwIT09YT9hKyIiOmF9ZnVuY3Rpb24gRmUoZSx0KXtyZXR1cm57Z2V0OmZ1bmN0aW9uKCl7aWYoIWUoKSlyZXR1cm4odGhpcy5nZXQ9dCkuYXBwbHkodGhpcyxhcmd1bWVudHMpO2RlbGV0ZSB0aGlzLmdldH19fSFmdW5jdGlvbigpe2Z1bmN0aW9uIGUoKXtpZihsKXt1LnN0eWxlLmNzc1RleHQ9InBvc2l0aW9uOmFic29sdXRlO2xlZnQ6LTExMTExcHg7d2lkdGg6NjBweDttYXJnaW4tdG9wOjFweDtwYWRkaW5nOjA7Ym9yZGVyOjAiLGwuc3R5bGUuY3NzVGV4dD0icG9zaXRpb246cmVsYXRpdmU7ZGlzcGxheTpibG9jaztib3gtc2l6aW5nOmJvcmRlci1ib3g7b3ZlcmZsb3c6c2Nyb2xsO21hcmdpbjphdXRvO2JvcmRlcjoxcHg7cGFkZGluZzoxcHg7d2lkdGg6NjAlO3RvcDoxJSIscmUuYXBwZW5kQ2hpbGQodSkuYXBwZW5kQ2hpbGQobCk7dmFyIGU9Qy5nZXRDb21wdXRlZFN0eWxlKGwpO249IjElIiE9PWUudG9wLHM9MTI9PT10KGUubWFyZ2luTGVmdCksbC5zdHlsZS5yaWdodD0iNjAlIixvPTM2PT09dChlLnJpZ2h0KSxyPTM2PT09dChlLndpZHRoKSxsLnN0eWxlLnBvc2l0aW9uPSJhYnNvbHV0ZSIsaT0xMj09PXQobC5vZmZzZXRXaWR0aC8zKSxyZS5yZW1vdmVDaGlsZCh1KSxsPW51bGx9fWZ1bmN0aW9uIHQoZSl7cmV0dXJuIE1hdGgucm91bmQocGFyc2VGbG9hdChlKSl9dmFyIG4scixpLG8sYSxzLHU9RS5jcmVhdGVFbGVtZW50KCJkaXYiKSxsPUUuY3JlYXRlRWxlbWVudCgiZGl2Iik7bC5zdHlsZSYmKGwuc3R5bGUuYmFja2dyb3VuZENsaXA9ImNvbnRlbnQtYm94IixsLmNsb25lTm9kZSghMCkuc3R5bGUuYmFja2dyb3VuZENsaXA9IiIseS5jbGVhckNsb25lU3R5bGU9ImNvbnRlbnQtYm94Ij09PWwuc3R5bGUuYmFja2dyb3VuZENsaXAsUy5leHRlbmQoeSx7Ym94U2l6aW5nUmVsaWFibGU6ZnVuY3Rpb24oKXtyZXR1cm4gZSgpLHJ9LHBpeGVsQm94U3R5bGVzOmZ1bmN0aW9uKCl7cmV0dXJuIGUoKSxvfSxwaXhlbFBvc2l0aW9uOmZ1bmN0aW9uKCl7cmV0dXJuIGUoKSxufSxyZWxpYWJsZU1hcmdpbkxlZnQ6ZnVuY3Rpb24oKXtyZXR1cm4gZSgpLHN9LHNjcm9sbGJveFNpemU6ZnVuY3Rpb24oKXtyZXR1cm4gZSgpLGl9LHJlbGlhYmxlVHJEaW1lbnNpb25zOmZ1bmN0aW9uKCl7dmFyIGUsdCxuLHI7cmV0dXJuIG51bGw9PWEmJihlPUUuY3JlYXRlRWxlbWVudCgidGFibGUiKSx0PUUuY3JlYXRlRWxlbWVudCgidHIiKSxuPUUuY3JlYXRlRWxlbWVudCgiZGl2IiksZS5zdHlsZS5jc3NUZXh0PSJwb3NpdGlvbjphYnNvbHV0ZTtsZWZ0Oi0xMTExMXB4O2JvcmRlci1jb2xsYXBzZTpzZXBhcmF0ZSIsdC5zdHlsZS5jc3NUZXh0PSJib3JkZXI6MXB4IHNvbGlkIix0LnN0eWxlLmhlaWdodD0iMXB4IixuLnN0eWxlLmhlaWdodD0iOXB4IixuLnN0eWxlLmRpc3BsYXk9ImJsb2NrIixyZS5hcHBlbmRDaGlsZChlKS5hcHBlbmRDaGlsZCh0KS5hcHBlbmRDaGlsZChuKSxyPUMuZ2V0Q29tcHV0ZWRTdHlsZSh0KSxhPXBhcnNlSW50KHIuaGVpZ2h0LDEwKStwYXJzZUludChyLmJvcmRlclRvcFdpZHRoLDEwKStwYXJzZUludChyLmJvcmRlckJvdHRvbVdpZHRoLDEwKT09PXQub2Zmc2V0SGVpZ2h0LHJlLnJlbW92ZUNoaWxkKGUpKSxhfX0pKX0oKTt2YXIgQmU9WyJXZWJraXQiLCJNb3oiLCJtcyJdLCRlPUUuY3JlYXRlRWxlbWVudCgiZGl2Iikuc3R5bGUsX2U9e307ZnVuY3Rpb24gemUoZSl7dmFyIHQ9Uy5jc3NQcm9wc1tlXXx8X2VbZV07cmV0dXJuIHR8fChlIGluICRlP2U6X2VbZV09ZnVuY3Rpb24oZSl7dmFyIHQ9ZVswXS50b1VwcGVyQ2FzZSgpK2Uuc2xpY2UoMSksbj1CZS5sZW5ndGg7d2hpbGUobi0tKWlmKChlPUJlW25dK3QpaW4gJGUpcmV0dXJuIGV9KGUpfHxlKX12YXIgVWU9L14obm9uZXx0YWJsZSg/IS1jW2VhXSkuKykvLFhlPS9eLS0vLFZlPXtwb3NpdGlvbjoiYWJzb2x1dGUiLHZpc2liaWxpdHk6ImhpZGRlbiIsZGlzcGxheToiYmxvY2sifSxHZT17bGV0dGVyU3BhY2luZzoiMCIsZm9udFdlaWdodDoiNDAwIn07ZnVuY3Rpb24gWWUoZSx0LG4pe3ZhciByPXRlLmV4ZWModCk7cmV0dXJuIHI/TWF0aC5tYXgoMCxyWzJdLShufHwwKSkrKHJbM118fCJweCIpOnR9ZnVuY3Rpb24gUWUoZSx0LG4scixpLG8pe3ZhciBhPSJ3aWR0aCI9PT10PzE6MCxzPTAsdT0wO2lmKG49PT0ocj8iYm9yZGVyIjoiY29udGVudCIpKXJldHVybiAwO2Zvcig7YTw0O2ErPTIpIm1hcmdpbiI9PT1uJiYodSs9Uy5jc3MoZSxuK25lW2FdLCEwLGkpKSxyPygiY29udGVudCI9PT1uJiYodS09Uy5jc3MoZSwicGFkZGluZyIrbmVbYV0sITAsaSkpLCJtYXJnaW4iIT09biYmKHUtPVMuY3NzKGUsImJvcmRlciIrbmVbYV0rIldpZHRoIiwhMCxpKSkpOih1Kz1TLmNzcyhlLCJwYWRkaW5nIituZVthXSwhMCxpKSwicGFkZGluZyIhPT1uP3UrPVMuY3NzKGUsImJvcmRlciIrbmVbYV0rIldpZHRoIiwhMCxpKTpzKz1TLmNzcyhlLCJib3JkZXIiK25lW2FdKyJXaWR0aCIsITAsaSkpO3JldHVybiFyJiYwPD1vJiYodSs9TWF0aC5tYXgoMCxNYXRoLmNlaWwoZVsib2Zmc2V0Iit0WzBdLnRvVXBwZXJDYXNlKCkrdC5zbGljZSgxKV0tby11LXMtLjUpKXx8MCksdX1mdW5jdGlvbiBKZShlLHQsbil7dmFyIHI9UmUoZSksaT0oIXkuYm94U2l6aW5nUmVsaWFibGUoKXx8bikmJiJib3JkZXItYm94Ij09PVMuY3NzKGUsImJveFNpemluZyIsITEsciksbz1pLGE9V2UoZSx0LHIpLHM9Im9mZnNldCIrdFswXS50b1VwcGVyQ2FzZSgpK3Quc2xpY2UoMSk7aWYoUGUudGVzdChhKSl7aWYoIW4pcmV0dXJuIGE7YT0iYXV0byJ9cmV0dXJuKCF5LmJveFNpemluZ1JlbGlhYmxlKCkmJml8fCF5LnJlbGlhYmxlVHJEaW1lbnNpb25zKCkmJkEoZSwidHIiKXx8ImF1dG8iPT09YXx8IXBhcnNlRmxvYXQoYSkmJiJpbmxpbmUiPT09Uy5jc3MoZSwiZGlzcGxheSIsITEscikpJiZlLmdldENsaWVudFJlY3RzKCkubGVuZ3RoJiYoaT0iYm9yZGVyLWJveCI9PT1TLmNzcyhlLCJib3hTaXppbmciLCExLHIpLChvPXMgaW4gZSkmJihhPWVbc10pKSwoYT1wYXJzZUZsb2F0KGEpfHwwKStRZShlLHQsbnx8KGk/ImJvcmRlciI6ImNvbnRlbnQiKSxvLHIsYSkrInB4In1mdW5jdGlvbiBLZShlLHQsbixyLGkpe3JldHVybiBuZXcgS2UucHJvdG90eXBlLmluaXQoZSx0LG4scixpKX1TLmV4dGVuZCh7Y3NzSG9va3M6e29wYWNpdHk6e2dldDpmdW5jdGlvbihlLHQpe2lmKHQpe3ZhciBuPVdlKGUsIm9wYWNpdHkiKTtyZXR1cm4iIj09PW4/IjEiOm59fX19LGNzc051bWJlcjp7YW5pbWF0aW9uSXRlcmF0aW9uQ291bnQ6ITAsY29sdW1uQ291bnQ6ITAsZmlsbE9wYWNpdHk6ITAsZmxleEdyb3c6ITAsZmxleFNocmluazohMCxmb250V2VpZ2h0OiEwLGdyaWRBcmVhOiEwLGdyaWRDb2x1bW46ITAsZ3JpZENvbHVtbkVuZDohMCxncmlkQ29sdW1uU3RhcnQ6ITAsZ3JpZFJvdzohMCxncmlkUm93RW5kOiEwLGdyaWRSb3dTdGFydDohMCxsaW5lSGVpZ2h0OiEwLG9wYWNpdHk6ITAsb3JkZXI6ITAsb3JwaGFuczohMCx3aWRvd3M6ITAsekluZGV4OiEwLHpvb206ITB9LGNzc1Byb3BzOnt9LHN0eWxlOmZ1bmN0aW9uKGUsdCxuLHIpe2lmKGUmJjMhPT1lLm5vZGVUeXBlJiY4IT09ZS5ub2RlVHlwZSYmZS5zdHlsZSl7dmFyIGksbyxhLHM9WCh0KSx1PVhlLnRlc3QodCksbD1lLnN0eWxlO2lmKHV8fCh0PXplKHMpKSxhPVMuY3NzSG9va3NbdF18fFMuY3NzSG9va3Nbc10sdm9pZCAwPT09bilyZXR1cm4gYSYmImdldCJpbiBhJiZ2b2lkIDAhPT0oaT1hLmdldChlLCExLHIpKT9pOmxbdF07InN0cmluZyI9PT0obz10eXBlb2YgbikmJihpPXRlLmV4ZWMobikpJiZpWzFdJiYobj1zZShlLHQsaSksbz0ibnVtYmVyIiksbnVsbCE9biYmbj09biYmKCJudW1iZXIiIT09b3x8dXx8KG4rPWkmJmlbM118fChTLmNzc051bWJlcltzXT8iIjoicHgiKSkseS5jbGVhckNsb25lU3R5bGV8fCIiIT09bnx8MCE9PXQuaW5kZXhPZigiYmFja2dyb3VuZCIpfHwobFt0XT0iaW5oZXJpdCIpLGEmJiJzZXQiaW4gYSYmdm9pZCAwPT09KG49YS5zZXQoZSxuLHIpKXx8KHU/bC5zZXRQcm9wZXJ0eSh0LG4pOmxbdF09bikpfX0sY3NzOmZ1bmN0aW9uKGUsdCxuLHIpe3ZhciBpLG8sYSxzPVgodCk7cmV0dXJuIFhlLnRlc3QodCl8fCh0PXplKHMpKSwoYT1TLmNzc0hvb2tzW3RdfHxTLmNzc0hvb2tzW3NdKSYmImdldCJpbiBhJiYoaT1hLmdldChlLCEwLG4pKSx2b2lkIDA9PT1pJiYoaT1XZShlLHQscikpLCJub3JtYWwiPT09aSYmdCBpbiBHZSYmKGk9R2VbdF0pLCIiPT09bnx8bj8obz1wYXJzZUZsb2F0KGkpLCEwPT09bnx8aXNGaW5pdGUobyk/b3x8MDppKTppfX0pLFMuZWFjaChbImhlaWdodCIsIndpZHRoIl0sZnVuY3Rpb24oZSx1KXtTLmNzc0hvb2tzW3VdPXtnZXQ6ZnVuY3Rpb24oZSx0LG4pe2lmKHQpcmV0dXJuIVVlLnRlc3QoUy5jc3MoZSwiZGlzcGxheSIpKXx8ZS5nZXRDbGllbnRSZWN0cygpLmxlbmd0aCYmZS5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKS53aWR0aD9KZShlLHUsbik6TWUoZSxWZSxmdW5jdGlvbigpe3JldHVybiBKZShlLHUsbil9KX0sc2V0OmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpPVJlKGUpLG89IXkuc2Nyb2xsYm94U2l6ZSgpJiYiYWJzb2x1dGUiPT09aS5wb3NpdGlvbixhPShvfHxuKSYmImJvcmRlci1ib3giPT09Uy5jc3MoZSwiYm94U2l6aW5nIiwhMSxpKSxzPW4/UWUoZSx1LG4sYSxpKTowO3JldHVybiBhJiZvJiYocy09TWF0aC5jZWlsKGVbIm9mZnNldCIrdVswXS50b1VwcGVyQ2FzZSgpK3Uuc2xpY2UoMSldLXBhcnNlRmxvYXQoaVt1XSktUWUoZSx1LCJib3JkZXIiLCExLGkpLS41KSkscyYmKHI9dGUuZXhlYyh0KSkmJiJweCIhPT0oclszXXx8InB4IikmJihlLnN0eWxlW3VdPXQsdD1TLmNzcyhlLHUpKSxZZSgwLHQscyl9fX0pLFMuY3NzSG9va3MubWFyZ2luTGVmdD1GZSh5LnJlbGlhYmxlTWFyZ2luTGVmdCxmdW5jdGlvbihlLHQpe2lmKHQpcmV0dXJuKHBhcnNlRmxvYXQoV2UoZSwibWFyZ2luTGVmdCIpKXx8ZS5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKS5sZWZ0LU1lKGUse21hcmdpbkxlZnQ6MH0sZnVuY3Rpb24oKXtyZXR1cm4gZS5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKS5sZWZ0fSkpKyJweCJ9KSxTLmVhY2goe21hcmdpbjoiIixwYWRkaW5nOiIiLGJvcmRlcjoiV2lkdGgifSxmdW5jdGlvbihpLG8pe1MuY3NzSG9va3NbaStvXT17ZXhwYW5kOmZ1bmN0aW9uKGUpe2Zvcih2YXIgdD0wLG49e30scj0ic3RyaW5nIj09dHlwZW9mIGU/ZS5zcGxpdCgiICIpOltlXTt0PDQ7dCsrKW5baStuZVt0XStvXT1yW3RdfHxyW3QtMl18fHJbMF07cmV0dXJuIG59fSwibWFyZ2luIiE9PWkmJihTLmNzc0hvb2tzW2krb10uc2V0PVllKX0pLFMuZm4uZXh0ZW5kKHtjc3M6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gJCh0aGlzLGZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG89e30sYT0wO2lmKEFycmF5LmlzQXJyYXkodCkpe2ZvcihyPVJlKGUpLGk9dC5sZW5ndGg7YTxpO2ErKylvW3RbYV1dPVMuY3NzKGUsdFthXSwhMSxyKTtyZXR1cm4gb31yZXR1cm4gdm9pZCAwIT09bj9TLnN0eWxlKGUsdCxuKTpTLmNzcyhlLHQpfSxlLHQsMTxhcmd1bWVudHMubGVuZ3RoKX19KSwoKFMuVHdlZW49S2UpLnByb3RvdHlwZT17Y29uc3RydWN0b3I6S2UsaW5pdDpmdW5jdGlvbihlLHQsbixyLGksbyl7dGhpcy5lbGVtPWUsdGhpcy5wcm9wPW4sdGhpcy5lYXNpbmc9aXx8Uy5lYXNpbmcuX2RlZmF1bHQsdGhpcy5vcHRpb25zPXQsdGhpcy5zdGFydD10aGlzLm5vdz10aGlzLmN1cigpLHRoaXMuZW5kPXIsdGhpcy51bml0PW98fChTLmNzc051bWJlcltuXT8iIjoicHgiKX0sY3VyOmZ1bmN0aW9uKCl7dmFyIGU9S2UucHJvcEhvb2tzW3RoaXMucHJvcF07cmV0dXJuIGUmJmUuZ2V0P2UuZ2V0KHRoaXMpOktlLnByb3BIb29rcy5fZGVmYXVsdC5nZXQodGhpcyl9LHJ1bjpmdW5jdGlvbihlKXt2YXIgdCxuPUtlLnByb3BIb29rc1t0aGlzLnByb3BdO3JldHVybiB0aGlzLm9wdGlvbnMuZHVyYXRpb24/dGhpcy5wb3M9dD1TLmVhc2luZ1t0aGlzLmVhc2luZ10oZSx0aGlzLm9wdGlvbnMuZHVyYXRpb24qZSwwLDEsdGhpcy5vcHRpb25zLmR1cmF0aW9uKTp0aGlzLnBvcz10PWUsdGhpcy5ub3c9KHRoaXMuZW5kLXRoaXMuc3RhcnQpKnQrdGhpcy5zdGFydCx0aGlzLm9wdGlvbnMuc3RlcCYmdGhpcy5vcHRpb25zLnN0ZXAuY2FsbCh0aGlzLmVsZW0sdGhpcy5ub3csdGhpcyksbiYmbi5zZXQ/bi5zZXQodGhpcyk6S2UucHJvcEhvb2tzLl9kZWZhdWx0LnNldCh0aGlzKSx0aGlzfX0pLmluaXQucHJvdG90eXBlPUtlLnByb3RvdHlwZSwoS2UucHJvcEhvb2tzPXtfZGVmYXVsdDp7Z2V0OmZ1bmN0aW9uKGUpe3ZhciB0O3JldHVybiAxIT09ZS5lbGVtLm5vZGVUeXBlfHxudWxsIT1lLmVsZW1bZS5wcm9wXSYmbnVsbD09ZS5lbGVtLnN0eWxlW2UucHJvcF0/ZS5lbGVtW2UucHJvcF06KHQ9Uy5jc3MoZS5lbGVtLGUucHJvcCwiIikpJiYiYXV0byIhPT10P3Q6MH0sc2V0OmZ1bmN0aW9uKGUpe1MuZnguc3RlcFtlLnByb3BdP1MuZnguc3RlcFtlLnByb3BdKGUpOjEhPT1lLmVsZW0ubm9kZVR5cGV8fCFTLmNzc0hvb2tzW2UucHJvcF0mJm51bGw9PWUuZWxlbS5zdHlsZVt6ZShlLnByb3ApXT9lLmVsZW1bZS5wcm9wXT1lLm5vdzpTLnN0eWxlKGUuZWxlbSxlLnByb3AsZS5ub3crZS51bml0KX19fSkuc2Nyb2xsVG9wPUtlLnByb3BIb29rcy5zY3JvbGxMZWZ0PXtzZXQ6ZnVuY3Rpb24oZSl7ZS5lbGVtLm5vZGVUeXBlJiZlLmVsZW0ucGFyZW50Tm9kZSYmKGUuZWxlbVtlLnByb3BdPWUubm93KX19LFMuZWFzaW5nPXtsaW5lYXI6ZnVuY3Rpb24oZSl7cmV0dXJuIGV9LHN3aW5nOmZ1bmN0aW9uKGUpe3JldHVybi41LU1hdGguY29zKGUqTWF0aC5QSSkvMn0sX2RlZmF1bHQ6InN3aW5nIn0sUy5meD1LZS5wcm90b3R5cGUuaW5pdCxTLmZ4LnN0ZXA9e307dmFyIFplLGV0LHR0LG50LHJ0PS9eKD86dG9nZ2xlfHNob3d8aGlkZSkkLyxpdD0vcXVldWVIb29rcyQvO2Z1bmN0aW9uIG90KCl7ZXQmJighMT09PUUuaGlkZGVuJiZDLnJlcXVlc3RBbmltYXRpb25GcmFtZT9DLnJlcXVlc3RBbmltYXRpb25GcmFtZShvdCk6Qy5zZXRUaW1lb3V0KG90LFMuZnguaW50ZXJ2YWwpLFMuZngudGljaygpKX1mdW5jdGlvbiBhdCgpe3JldHVybiBDLnNldFRpbWVvdXQoZnVuY3Rpb24oKXtaZT12b2lkIDB9KSxaZT1EYXRlLm5vdygpfWZ1bmN0aW9uIHN0KGUsdCl7dmFyIG4scj0wLGk9e2hlaWdodDplfTtmb3IodD10PzE6MDtyPDQ7cis9Mi10KWlbIm1hcmdpbiIrKG49bmVbcl0pXT1pWyJwYWRkaW5nIituXT1lO3JldHVybiB0JiYoaS5vcGFjaXR5PWkud2lkdGg9ZSksaX1mdW5jdGlvbiB1dChlLHQsbil7Zm9yKHZhciByLGk9KGx0LnR3ZWVuZXJzW3RdfHxbXSkuY29uY2F0KGx0LnR3ZWVuZXJzWyIqIl0pLG89MCxhPWkubGVuZ3RoO288YTtvKyspaWYocj1pW29dLmNhbGwobix0LGUpKXJldHVybiByfWZ1bmN0aW9uIGx0KG8sZSx0KXt2YXIgbixhLHI9MCxpPWx0LnByZWZpbHRlcnMubGVuZ3RoLHM9Uy5EZWZlcnJlZCgpLmFsd2F5cyhmdW5jdGlvbigpe2RlbGV0ZSB1LmVsZW19KSx1PWZ1bmN0aW9uKCl7aWYoYSlyZXR1cm4hMTtmb3IodmFyIGU9WmV8fGF0KCksdD1NYXRoLm1heCgwLGwuc3RhcnRUaW1lK2wuZHVyYXRpb24tZSksbj0xLSh0L2wuZHVyYXRpb258fDApLHI9MCxpPWwudHdlZW5zLmxlbmd0aDtyPGk7cisrKWwudHdlZW5zW3JdLnJ1bihuKTtyZXR1cm4gcy5ub3RpZnlXaXRoKG8sW2wsbix0XSksbjwxJiZpP3Q6KGl8fHMubm90aWZ5V2l0aChvLFtsLDEsMF0pLHMucmVzb2x2ZVdpdGgobyxbbF0pLCExKX0sbD1zLnByb21pc2Uoe2VsZW06byxwcm9wczpTLmV4dGVuZCh7fSxlKSxvcHRzOlMuZXh0ZW5kKCEwLHtzcGVjaWFsRWFzaW5nOnt9LGVhc2luZzpTLmVhc2luZy5fZGVmYXVsdH0sdCksb3JpZ2luYWxQcm9wZXJ0aWVzOmUsb3JpZ2luYWxPcHRpb25zOnQsc3RhcnRUaW1lOlplfHxhdCgpLGR1cmF0aW9uOnQuZHVyYXRpb24sdHdlZW5zOltdLGNyZWF0ZVR3ZWVuOmZ1bmN0aW9uKGUsdCl7dmFyIG49Uy5Ud2VlbihvLGwub3B0cyxlLHQsbC5vcHRzLnNwZWNpYWxFYXNpbmdbZV18fGwub3B0cy5lYXNpbmcpO3JldHVybiBsLnR3ZWVucy5wdXNoKG4pLG59LHN0b3A6ZnVuY3Rpb24oZSl7dmFyIHQ9MCxuPWU/bC50d2VlbnMubGVuZ3RoOjA7aWYoYSlyZXR1cm4gdGhpcztmb3IoYT0hMDt0PG47dCsrKWwudHdlZW5zW3RdLnJ1bigxKTtyZXR1cm4gZT8ocy5ub3RpZnlXaXRoKG8sW2wsMSwwXSkscy5yZXNvbHZlV2l0aChvLFtsLGVdKSk6cy5yZWplY3RXaXRoKG8sW2wsZV0pLHRoaXN9fSksYz1sLnByb3BzO2ZvcighZnVuY3Rpb24oZSx0KXt2YXIgbixyLGksbyxhO2ZvcihuIGluIGUpaWYoaT10W3I9WChuKV0sbz1lW25dLEFycmF5LmlzQXJyYXkobykmJihpPW9bMV0sbz1lW25dPW9bMF0pLG4hPT1yJiYoZVtyXT1vLGRlbGV0ZSBlW25dKSwoYT1TLmNzc0hvb2tzW3JdKSYmImV4cGFuZCJpbiBhKWZvcihuIGluIG89YS5leHBhbmQobyksZGVsZXRlIGVbcl0sbyluIGluIGV8fChlW25dPW9bbl0sdFtuXT1pKTtlbHNlIHRbcl09aX0oYyxsLm9wdHMuc3BlY2lhbEVhc2luZyk7cjxpO3IrKylpZihuPWx0LnByZWZpbHRlcnNbcl0uY2FsbChsLG8sYyxsLm9wdHMpKXJldHVybiBtKG4uc3RvcCkmJihTLl9xdWV1ZUhvb2tzKGwuZWxlbSxsLm9wdHMucXVldWUpLnN0b3A9bi5zdG9wLmJpbmQobikpLG47cmV0dXJuIFMubWFwKGMsdXQsbCksbShsLm9wdHMuc3RhcnQpJiZsLm9wdHMuc3RhcnQuY2FsbChvLGwpLGwucHJvZ3Jlc3MobC5vcHRzLnByb2dyZXNzKS5kb25lKGwub3B0cy5kb25lLGwub3B0cy5jb21wbGV0ZSkuZmFpbChsLm9wdHMuZmFpbCkuYWx3YXlzKGwub3B0cy5hbHdheXMpLFMuZngudGltZXIoUy5leHRlbmQodSx7ZWxlbTpvLGFuaW06bCxxdWV1ZTpsLm9wdHMucXVldWV9KSksbH1TLkFuaW1hdGlvbj1TLmV4dGVuZChsdCx7dHdlZW5lcnM6eyIqIjpbZnVuY3Rpb24oZSx0KXt2YXIgbj10aGlzLmNyZWF0ZVR3ZWVuKGUsdCk7cmV0dXJuIHNlKG4uZWxlbSxlLHRlLmV4ZWModCksbiksbn1dfSx0d2VlbmVyOmZ1bmN0aW9uKGUsdCl7bShlKT8odD1lLGU9WyIqIl0pOmU9ZS5tYXRjaChQKTtmb3IodmFyIG4scj0wLGk9ZS5sZW5ndGg7cjxpO3IrKyluPWVbcl0sbHQudHdlZW5lcnNbbl09bHQudHdlZW5lcnNbbl18fFtdLGx0LnR3ZWVuZXJzW25dLnVuc2hpZnQodCl9LHByZWZpbHRlcnM6W2Z1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG8sYSxzLHUsbCxjLGY9IndpZHRoImluIHR8fCJoZWlnaHQiaW4gdCxwPXRoaXMsZD17fSxoPWUuc3R5bGUsZz1lLm5vZGVUeXBlJiZhZShlKSx2PVkuZ2V0KGUsImZ4c2hvdyIpO2ZvcihyIGluIG4ucXVldWV8fChudWxsPT0oYT1TLl9xdWV1ZUhvb2tzKGUsImZ4IikpLnVucXVldWVkJiYoYS51bnF1ZXVlZD0wLHM9YS5lbXB0eS5maXJlLGEuZW1wdHkuZmlyZT1mdW5jdGlvbigpe2EudW5xdWV1ZWR8fHMoKX0pLGEudW5xdWV1ZWQrKyxwLmFsd2F5cyhmdW5jdGlvbigpe3AuYWx3YXlzKGZ1bmN0aW9uKCl7YS51bnF1ZXVlZC0tLFMucXVldWUoZSwiZngiKS5sZW5ndGh8fGEuZW1wdHkuZmlyZSgpfSl9KSksdClpZihpPXRbcl0scnQudGVzdChpKSl7aWYoZGVsZXRlIHRbcl0sbz1vfHwidG9nZ2xlIj09PWksaT09PShnPyJoaWRlIjoic2hvdyIpKXtpZigic2hvdyIhPT1pfHwhdnx8dm9pZCAwPT09dltyXSljb250aW51ZTtnPSEwfWRbcl09diYmdltyXXx8Uy5zdHlsZShlLHIpfWlmKCh1PSFTLmlzRW1wdHlPYmplY3QodCkpfHwhUy5pc0VtcHR5T2JqZWN0KGQpKWZvcihyIGluIGYmJjE9PT1lLm5vZGVUeXBlJiYobi5vdmVyZmxvdz1baC5vdmVyZmxvdyxoLm92ZXJmbG93WCxoLm92ZXJmbG93WV0sbnVsbD09KGw9diYmdi5kaXNwbGF5KSYmKGw9WS5nZXQoZSwiZGlzcGxheSIpKSwibm9uZSI9PT0oYz1TLmNzcyhlLCJkaXNwbGF5IikpJiYobD9jPWw6KGxlKFtlXSwhMCksbD1lLnN0eWxlLmRpc3BsYXl8fGwsYz1TLmNzcyhlLCJkaXNwbGF5IiksbGUoW2VdKSkpLCgiaW5saW5lIj09PWN8fCJpbmxpbmUtYmxvY2siPT09YyYmbnVsbCE9bCkmJiJub25lIj09PVMuY3NzKGUsImZsb2F0IikmJih1fHwocC5kb25lKGZ1bmN0aW9uKCl7aC5kaXNwbGF5PWx9KSxudWxsPT1sJiYoYz1oLmRpc3BsYXksbD0ibm9uZSI9PT1jPyIiOmMpKSxoLmRpc3BsYXk9ImlubGluZS1ibG9jayIpKSxuLm92ZXJmbG93JiYoaC5vdmVyZmxvdz0iaGlkZGVuIixwLmFsd2F5cyhmdW5jdGlvbigpe2gub3ZlcmZsb3c9bi5vdmVyZmxvd1swXSxoLm92ZXJmbG93WD1uLm92ZXJmbG93WzFdLGgub3ZlcmZsb3dZPW4ub3ZlcmZsb3dbMl19KSksdT0hMSxkKXV8fCh2PyJoaWRkZW4iaW4gdiYmKGc9di5oaWRkZW4pOnY9WS5hY2Nlc3MoZSwiZnhzaG93Iix7ZGlzcGxheTpsfSksbyYmKHYuaGlkZGVuPSFnKSxnJiZsZShbZV0sITApLHAuZG9uZShmdW5jdGlvbigpe2ZvcihyIGluIGd8fGxlKFtlXSksWS5yZW1vdmUoZSwiZnhzaG93IiksZClTLnN0eWxlKGUscixkW3JdKX0pKSx1PXV0KGc/dltyXTowLHIscCksciBpbiB2fHwodltyXT11LnN0YXJ0LGcmJih1LmVuZD11LnN0YXJ0LHUuc3RhcnQ9MCkpfV0scHJlZmlsdGVyOmZ1bmN0aW9uKGUsdCl7dD9sdC5wcmVmaWx0ZXJzLnVuc2hpZnQoZSk6bHQucHJlZmlsdGVycy5wdXNoKGUpfX0pLFMuc3BlZWQ9ZnVuY3Rpb24oZSx0LG4pe3ZhciByPWUmJiJvYmplY3QiPT10eXBlb2YgZT9TLmV4dGVuZCh7fSxlKTp7Y29tcGxldGU6bnx8IW4mJnR8fG0oZSkmJmUsZHVyYXRpb246ZSxlYXNpbmc6biYmdHx8dCYmIW0odCkmJnR9O3JldHVybiBTLmZ4Lm9mZj9yLmR1cmF0aW9uPTA6Im51bWJlciIhPXR5cGVvZiByLmR1cmF0aW9uJiYoci5kdXJhdGlvbiBpbiBTLmZ4LnNwZWVkcz9yLmR1cmF0aW9uPVMuZnguc3BlZWRzW3IuZHVyYXRpb25dOnIuZHVyYXRpb249Uy5meC5zcGVlZHMuX2RlZmF1bHQpLG51bGwhPXIucXVldWUmJiEwIT09ci5xdWV1ZXx8KHIucXVldWU9ImZ4Iiksci5vbGQ9ci5jb21wbGV0ZSxyLmNvbXBsZXRlPWZ1bmN0aW9uKCl7bShyLm9sZCkmJnIub2xkLmNhbGwodGhpcyksci5xdWV1ZSYmUy5kZXF1ZXVlKHRoaXMsci5xdWV1ZSl9LHJ9LFMuZm4uZXh0ZW5kKHtmYWRlVG86ZnVuY3Rpb24oZSx0LG4scil7cmV0dXJuIHRoaXMuZmlsdGVyKGFlKS5jc3MoIm9wYWNpdHkiLDApLnNob3coKS5lbmQoKS5hbmltYXRlKHtvcGFjaXR5OnR9LGUsbixyKX0sYW5pbWF0ZTpmdW5jdGlvbih0LGUsbixyKXt2YXIgaT1TLmlzRW1wdHlPYmplY3QodCksbz1TLnNwZWVkKGUsbixyKSxhPWZ1bmN0aW9uKCl7dmFyIGU9bHQodGhpcyxTLmV4dGVuZCh7fSx0KSxvKTsoaXx8WS5nZXQodGhpcywiZmluaXNoIikpJiZlLnN0b3AoITApfTtyZXR1cm4gYS5maW5pc2g9YSxpfHwhMT09PW8ucXVldWU/dGhpcy5lYWNoKGEpOnRoaXMucXVldWUoby5xdWV1ZSxhKX0sc3RvcDpmdW5jdGlvbihpLGUsbyl7dmFyIGE9ZnVuY3Rpb24oZSl7dmFyIHQ9ZS5zdG9wO2RlbGV0ZSBlLnN0b3AsdChvKX07cmV0dXJuInN0cmluZyIhPXR5cGVvZiBpJiYobz1lLGU9aSxpPXZvaWQgMCksZSYmdGhpcy5xdWV1ZShpfHwiZngiLFtdKSx0aGlzLmVhY2goZnVuY3Rpb24oKXt2YXIgZT0hMCx0PW51bGwhPWkmJmkrInF1ZXVlSG9va3MiLG49Uy50aW1lcnMscj1ZLmdldCh0aGlzKTtpZih0KXJbdF0mJnJbdF0uc3RvcCYmYShyW3RdKTtlbHNlIGZvcih0IGluIHIpclt0XSYmclt0XS5zdG9wJiZpdC50ZXN0KHQpJiZhKHJbdF0pO2Zvcih0PW4ubGVuZ3RoO3QtLTspblt0XS5lbGVtIT09dGhpc3x8bnVsbCE9aSYmblt0XS5xdWV1ZSE9PWl8fChuW3RdLmFuaW0uc3RvcChvKSxlPSExLG4uc3BsaWNlKHQsMSkpOyFlJiZvfHxTLmRlcXVldWUodGhpcyxpKX0pfSxmaW5pc2g6ZnVuY3Rpb24oYSl7cmV0dXJuITEhPT1hJiYoYT1hfHwiZngiKSx0aGlzLmVhY2goZnVuY3Rpb24oKXt2YXIgZSx0PVkuZ2V0KHRoaXMpLG49dFthKyJxdWV1ZSJdLHI9dFthKyJxdWV1ZUhvb2tzIl0saT1TLnRpbWVycyxvPW4/bi5sZW5ndGg6MDtmb3IodC5maW5pc2g9ITAsUy5xdWV1ZSh0aGlzLGEsW10pLHImJnIuc3RvcCYmci5zdG9wLmNhbGwodGhpcywhMCksZT1pLmxlbmd0aDtlLS07KWlbZV0uZWxlbT09PXRoaXMmJmlbZV0ucXVldWU9PT1hJiYoaVtlXS5hbmltLnN0b3AoITApLGkuc3BsaWNlKGUsMSkpO2ZvcihlPTA7ZTxvO2UrKyluW2VdJiZuW2VdLmZpbmlzaCYmbltlXS5maW5pc2guY2FsbCh0aGlzKTtkZWxldGUgdC5maW5pc2h9KX19KSxTLmVhY2goWyJ0b2dnbGUiLCJzaG93IiwiaGlkZSJdLGZ1bmN0aW9uKGUscil7dmFyIGk9Uy5mbltyXTtTLmZuW3JdPWZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gbnVsbD09ZXx8ImJvb2xlYW4iPT10eXBlb2YgZT9pLmFwcGx5KHRoaXMsYXJndW1lbnRzKTp0aGlzLmFuaW1hdGUoc3QociwhMCksZSx0LG4pfX0pLFMuZWFjaCh7c2xpZGVEb3duOnN0KCJzaG93Iiksc2xpZGVVcDpzdCgiaGlkZSIpLHNsaWRlVG9nZ2xlOnN0KCJ0b2dnbGUiKSxmYWRlSW46e29wYWNpdHk6InNob3cifSxmYWRlT3V0OntvcGFjaXR5OiJoaWRlIn0sZmFkZVRvZ2dsZTp7b3BhY2l0eToidG9nZ2xlIn19LGZ1bmN0aW9uKGUscil7Uy5mbltlXT1mdW5jdGlvbihlLHQsbil7cmV0dXJuIHRoaXMuYW5pbWF0ZShyLGUsdCxuKX19KSxTLnRpbWVycz1bXSxTLmZ4LnRpY2s9ZnVuY3Rpb24oKXt2YXIgZSx0PTAsbj1TLnRpbWVycztmb3IoWmU9RGF0ZS5ub3coKTt0PG4ubGVuZ3RoO3QrKykoZT1uW3RdKSgpfHxuW3RdIT09ZXx8bi5zcGxpY2UodC0tLDEpO24ubGVuZ3RofHxTLmZ4LnN0b3AoKSxaZT12b2lkIDB9LFMuZngudGltZXI9ZnVuY3Rpb24oZSl7Uy50aW1lcnMucHVzaChlKSxTLmZ4LnN0YXJ0KCl9LFMuZnguaW50ZXJ2YWw9MTMsUy5meC5zdGFydD1mdW5jdGlvbigpe2V0fHwoZXQ9ITAsb3QoKSl9LFMuZnguc3RvcD1mdW5jdGlvbigpe2V0PW51bGx9LFMuZnguc3BlZWRzPXtzbG93OjYwMCxmYXN0OjIwMCxfZGVmYXVsdDo0MDB9LFMuZm4uZGVsYXk9ZnVuY3Rpb24ocixlKXtyZXR1cm4gcj1TLmZ4JiZTLmZ4LnNwZWVkc1tyXXx8cixlPWV8fCJmeCIsdGhpcy5xdWV1ZShlLGZ1bmN0aW9uKGUsdCl7dmFyIG49Qy5zZXRUaW1lb3V0KGUscik7dC5zdG9wPWZ1bmN0aW9uKCl7Qy5jbGVhclRpbWVvdXQobil9fSl9LHR0PUUuY3JlYXRlRWxlbWVudCgiaW5wdXQiKSxudD1FLmNyZWF0ZUVsZW1lbnQoInNlbGVjdCIpLmFwcGVuZENoaWxkKEUuY3JlYXRlRWxlbWVudCgib3B0aW9uIikpLHR0LnR5cGU9ImNoZWNrYm94Iix5LmNoZWNrT249IiIhPT10dC52YWx1ZSx5Lm9wdFNlbGVjdGVkPW50LnNlbGVjdGVkLCh0dD1FLmNyZWF0ZUVsZW1lbnQoImlucHV0IikpLnZhbHVlPSJ0Iix0dC50eXBlPSJyYWRpbyIseS5yYWRpb1ZhbHVlPSJ0Ij09PXR0LnZhbHVlO3ZhciBjdCxmdD1TLmV4cHIuYXR0ckhhbmRsZTtTLmZuLmV4dGVuZCh7YXR0cjpmdW5jdGlvbihlLHQpe3JldHVybiAkKHRoaXMsUy5hdHRyLGUsdCwxPGFyZ3VtZW50cy5sZW5ndGgpfSxyZW1vdmVBdHRyOmZ1bmN0aW9uKGUpe3JldHVybiB0aGlzLmVhY2goZnVuY3Rpb24oKXtTLnJlbW92ZUF0dHIodGhpcyxlKX0pfX0pLFMuZXh0ZW5kKHthdHRyOmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG89ZS5ub2RlVHlwZTtpZigzIT09byYmOCE9PW8mJjIhPT1vKXJldHVybiJ1bmRlZmluZWQiPT10eXBlb2YgZS5nZXRBdHRyaWJ1dGU/Uy5wcm9wKGUsdCxuKTooMT09PW8mJlMuaXNYTUxEb2MoZSl8fChpPVMuYXR0ckhvb2tzW3QudG9Mb3dlckNhc2UoKV18fChTLmV4cHIubWF0Y2guYm9vbC50ZXN0KHQpP2N0OnZvaWQgMCkpLHZvaWQgMCE9PW4/bnVsbD09PW4/dm9pZCBTLnJlbW92ZUF0dHIoZSx0KTppJiYic2V0ImluIGkmJnZvaWQgMCE9PShyPWkuc2V0KGUsbix0KSk/cjooZS5zZXRBdHRyaWJ1dGUodCxuKyIiKSxuKTppJiYiZ2V0ImluIGkmJm51bGwhPT0ocj1pLmdldChlLHQpKT9yOm51bGw9PShyPVMuZmluZC5hdHRyKGUsdCkpP3ZvaWQgMDpyKX0sYXR0ckhvb2tzOnt0eXBlOntzZXQ6ZnVuY3Rpb24oZSx0KXtpZigheS5yYWRpb1ZhbHVlJiYicmFkaW8iPT09dCYmQShlLCJpbnB1dCIpKXt2YXIgbj1lLnZhbHVlO3JldHVybiBlLnNldEF0dHJpYnV0ZSgidHlwZSIsdCksbiYmKGUudmFsdWU9biksdH19fX0scmVtb3ZlQXR0cjpmdW5jdGlvbihlLHQpe3ZhciBuLHI9MCxpPXQmJnQubWF0Y2goUCk7aWYoaSYmMT09PWUubm9kZVR5cGUpd2hpbGUobj1pW3IrK10pZS5yZW1vdmVBdHRyaWJ1dGUobil9fSksY3Q9e3NldDpmdW5jdGlvbihlLHQsbil7cmV0dXJuITE9PT10P1MucmVtb3ZlQXR0cihlLG4pOmUuc2V0QXR0cmlidXRlKG4sbiksbn19LFMuZWFjaChTLmV4cHIubWF0Y2guYm9vbC5zb3VyY2UubWF0Y2goL1x3Ky9nKSxmdW5jdGlvbihlLHQpe3ZhciBhPWZ0W3RdfHxTLmZpbmQuYXR0cjtmdFt0XT1mdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvPXQudG9Mb3dlckNhc2UoKTtyZXR1cm4gbnx8KGk9ZnRbb10sZnRbb109cixyPW51bGwhPWEoZSx0LG4pP286bnVsbCxmdFtvXT1pKSxyfX0pO3ZhciBwdD0vXig/OmlucHV0fHNlbGVjdHx0ZXh0YXJlYXxidXR0b24pJC9pLGR0PS9eKD86YXxhcmVhKSQvaTtmdW5jdGlvbiBodChlKXtyZXR1cm4oZS5tYXRjaChQKXx8W10pLmpvaW4oIiAiKX1mdW5jdGlvbiBndChlKXtyZXR1cm4gZS5nZXRBdHRyaWJ1dGUmJmUuZ2V0QXR0cmlidXRlKCJjbGFzcyIpfHwiIn1mdW5jdGlvbiB2dChlKXtyZXR1cm4gQXJyYXkuaXNBcnJheShlKT9lOiJzdHJpbmciPT10eXBlb2YgZSYmZS5tYXRjaChQKXx8W119Uy5mbi5leHRlbmQoe3Byb3A6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gJCh0aGlzLFMucHJvcCxlLHQsMTxhcmd1bWVudHMubGVuZ3RoKX0scmVtb3ZlUHJvcDpmdW5jdGlvbihlKXtyZXR1cm4gdGhpcy5lYWNoKGZ1bmN0aW9uKCl7ZGVsZXRlIHRoaXNbUy5wcm9wRml4W2VdfHxlXX0pfX0pLFMuZXh0ZW5kKHtwcm9wOmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG89ZS5ub2RlVHlwZTtpZigzIT09byYmOCE9PW8mJjIhPT1vKXJldHVybiAxPT09byYmUy5pc1hNTERvYyhlKXx8KHQ9Uy5wcm9wRml4W3RdfHx0LGk9Uy5wcm9wSG9va3NbdF0pLHZvaWQgMCE9PW4/aSYmInNldCJpbiBpJiZ2b2lkIDAhPT0ocj1pLnNldChlLG4sdCkpP3I6ZVt0XT1uOmkmJiJnZXQiaW4gaSYmbnVsbCE9PShyPWkuZ2V0KGUsdCkpP3I6ZVt0XX0scHJvcEhvb2tzOnt0YWJJbmRleDp7Z2V0OmZ1bmN0aW9uKGUpe3ZhciB0PVMuZmluZC5hdHRyKGUsInRhYmluZGV4Iik7cmV0dXJuIHQ/cGFyc2VJbnQodCwxMCk6cHQudGVzdChlLm5vZGVOYW1lKXx8ZHQudGVzdChlLm5vZGVOYW1lKSYmZS5ocmVmPzA6LTF9fX0scHJvcEZpeDp7ImZvciI6Imh0bWxGb3IiLCJjbGFzcyI6ImNsYXNzTmFtZSJ9fSkseS5vcHRTZWxlY3RlZHx8KFMucHJvcEhvb2tzLnNlbGVjdGVkPXtnZXQ6ZnVuY3Rpb24oZSl7dmFyIHQ9ZS5wYXJlbnROb2RlO3JldHVybiB0JiZ0LnBhcmVudE5vZGUmJnQucGFyZW50Tm9kZS5zZWxlY3RlZEluZGV4LG51bGx9LHNldDpmdW5jdGlvbihlKXt2YXIgdD1lLnBhcmVudE5vZGU7dCYmKHQuc2VsZWN0ZWRJbmRleCx0LnBhcmVudE5vZGUmJnQucGFyZW50Tm9kZS5zZWxlY3RlZEluZGV4KX19KSxTLmVhY2goWyJ0YWJJbmRleCIsInJlYWRPbmx5IiwibWF4TGVuZ3RoIiwiY2VsbFNwYWNpbmciLCJjZWxsUGFkZGluZyIsInJvd1NwYW4iLCJjb2xTcGFuIiwidXNlTWFwIiwiZnJhbWVCb3JkZXIiLCJjb250ZW50RWRpdGFibGUiXSxmdW5jdGlvbigpe1MucHJvcEZpeFt0aGlzLnRvTG93ZXJDYXNlKCldPXRoaXN9KSxTLmZuLmV4dGVuZCh7YWRkQ2xhc3M6ZnVuY3Rpb24odCl7dmFyIGUsbixyLGksbyxhLHMsdT0wO2lmKG0odCkpcmV0dXJuIHRoaXMuZWFjaChmdW5jdGlvbihlKXtTKHRoaXMpLmFkZENsYXNzKHQuY2FsbCh0aGlzLGUsZ3QodGhpcykpKX0pO2lmKChlPXZ0KHQpKS5sZW5ndGgpd2hpbGUobj10aGlzW3UrK10paWYoaT1ndChuKSxyPTE9PT1uLm5vZGVUeXBlJiYiICIraHQoaSkrIiAiKXthPTA7d2hpbGUobz1lW2ErK10pci5pbmRleE9mKCIgIitvKyIgIik8MCYmKHIrPW8rIiAiKTtpIT09KHM9aHQocikpJiZuLnNldEF0dHJpYnV0ZSgiY2xhc3MiLHMpfXJldHVybiB0aGlzfSxyZW1vdmVDbGFzczpmdW5jdGlvbih0KXt2YXIgZSxuLHIsaSxvLGEscyx1PTA7aWYobSh0KSlyZXR1cm4gdGhpcy5lYWNoKGZ1bmN0aW9uKGUpe1ModGhpcykucmVtb3ZlQ2xhc3ModC5jYWxsKHRoaXMsZSxndCh0aGlzKSkpfSk7aWYoIWFyZ3VtZW50cy5sZW5ndGgpcmV0dXJuIHRoaXMuYXR0cigiY2xhc3MiLCIiKTtpZigoZT12dCh0KSkubGVuZ3RoKXdoaWxlKG49dGhpc1t1KytdKWlmKGk9Z3Qobikscj0xPT09bi5ub2RlVHlwZSYmIiAiK2h0KGkpKyIgIil7YT0wO3doaWxlKG89ZVthKytdKXdoaWxlKC0xPHIuaW5kZXhPZigiICIrbysiICIpKXI9ci5yZXBsYWNlKCIgIitvKyIgIiwiICIpO2khPT0ocz1odChyKSkmJm4uc2V0QXR0cmlidXRlKCJjbGFzcyIscyl9cmV0dXJuIHRoaXN9LHRvZ2dsZUNsYXNzOmZ1bmN0aW9uKGksdCl7dmFyIG89dHlwZW9mIGksYT0ic3RyaW5nIj09PW98fEFycmF5LmlzQXJyYXkoaSk7cmV0dXJuImJvb2xlYW4iPT10eXBlb2YgdCYmYT90P3RoaXMuYWRkQ2xhc3MoaSk6dGhpcy5yZW1vdmVDbGFzcyhpKTptKGkpP3RoaXMuZWFjaChmdW5jdGlvbihlKXtTKHRoaXMpLnRvZ2dsZUNsYXNzKGkuY2FsbCh0aGlzLGUsZ3QodGhpcyksdCksdCl9KTp0aGlzLmVhY2goZnVuY3Rpb24oKXt2YXIgZSx0LG4scjtpZihhKXt0PTAsbj1TKHRoaXMpLHI9dnQoaSk7d2hpbGUoZT1yW3QrK10pbi5oYXNDbGFzcyhlKT9uLnJlbW92ZUNsYXNzKGUpOm4uYWRkQ2xhc3MoZSl9ZWxzZSB2b2lkIDAhPT1pJiYiYm9vbGVhbiIhPT1vfHwoKGU9Z3QodGhpcykpJiZZLnNldCh0aGlzLCJfX2NsYXNzTmFtZV9fIixlKSx0aGlzLnNldEF0dHJpYnV0ZSYmdGhpcy5zZXRBdHRyaWJ1dGUoImNsYXNzIixlfHwhMT09PWk/IiI6WS5nZXQodGhpcywiX19jbGFzc05hbWVfXyIpfHwiIikpfSl9LGhhc0NsYXNzOmZ1bmN0aW9uKGUpe3ZhciB0LG4scj0wO3Q9IiAiK2UrIiAiO3doaWxlKG49dGhpc1tyKytdKWlmKDE9PT1uLm5vZGVUeXBlJiYtMTwoIiAiK2h0KGd0KG4pKSsiICIpLmluZGV4T2YodCkpcmV0dXJuITA7cmV0dXJuITF9fSk7dmFyIHl0PS9cci9nO1MuZm4uZXh0ZW5kKHt2YWw6ZnVuY3Rpb24obil7dmFyIHIsZSxpLHQ9dGhpc1swXTtyZXR1cm4gYXJndW1lbnRzLmxlbmd0aD8oaT1tKG4pLHRoaXMuZWFjaChmdW5jdGlvbihlKXt2YXIgdDsxPT09dGhpcy5ub2RlVHlwZSYmKG51bGw9PSh0PWk/bi5jYWxsKHRoaXMsZSxTKHRoaXMpLnZhbCgpKTpuKT90PSIiOiJudW1iZXIiPT10eXBlb2YgdD90Kz0iIjpBcnJheS5pc0FycmF5KHQpJiYodD1TLm1hcCh0LGZ1bmN0aW9uKGUpe3JldHVybiBudWxsPT1lPyIiOmUrIiJ9KSksKHI9Uy52YWxIb29rc1t0aGlzLnR5cGVdfHxTLnZhbEhvb2tzW3RoaXMubm9kZU5hbWUudG9Mb3dlckNhc2UoKV0pJiYic2V0ImluIHImJnZvaWQgMCE9PXIuc2V0KHRoaXMsdCwidmFsdWUiKXx8KHRoaXMudmFsdWU9dCkpfSkpOnQ/KHI9Uy52YWxIb29rc1t0LnR5cGVdfHxTLnZhbEhvb2tzW3Qubm9kZU5hbWUudG9Mb3dlckNhc2UoKV0pJiYiZ2V0ImluIHImJnZvaWQgMCE9PShlPXIuZ2V0KHQsInZhbHVlIikpP2U6InN0cmluZyI9PXR5cGVvZihlPXQudmFsdWUpP2UucmVwbGFjZSh5dCwiIik6bnVsbD09ZT8iIjplOnZvaWQgMH19KSxTLmV4dGVuZCh7dmFsSG9va3M6e29wdGlvbjp7Z2V0OmZ1bmN0aW9uKGUpe3ZhciB0PVMuZmluZC5hdHRyKGUsInZhbHVlIik7cmV0dXJuIG51bGwhPXQ/dDpodChTLnRleHQoZSkpfX0sc2VsZWN0OntnZXQ6ZnVuY3Rpb24oZSl7dmFyIHQsbixyLGk9ZS5vcHRpb25zLG89ZS5zZWxlY3RlZEluZGV4LGE9InNlbGVjdC1vbmUiPT09ZS50eXBlLHM9YT9udWxsOltdLHU9YT9vKzE6aS5sZW5ndGg7Zm9yKHI9bzwwP3U6YT9vOjA7cjx1O3IrKylpZigoKG49aVtyXSkuc2VsZWN0ZWR8fHI9PT1vKSYmIW4uZGlzYWJsZWQmJighbi5wYXJlbnROb2RlLmRpc2FibGVkfHwhQShuLnBhcmVudE5vZGUsIm9wdGdyb3VwIikpKXtpZih0PVMobikudmFsKCksYSlyZXR1cm4gdDtzLnB1c2godCl9cmV0dXJuIHN9LHNldDpmdW5jdGlvbihlLHQpe3ZhciBuLHIsaT1lLm9wdGlvbnMsbz1TLm1ha2VBcnJheSh0KSxhPWkubGVuZ3RoO3doaWxlKGEtLSkoKHI9aVthXSkuc2VsZWN0ZWQ9LTE8Uy5pbkFycmF5KFMudmFsSG9va3Mub3B0aW9uLmdldChyKSxvKSkmJihuPSEwKTtyZXR1cm4gbnx8KGUuc2VsZWN0ZWRJbmRleD0tMSksb319fX0pLFMuZWFjaChbInJhZGlvIiwiY2hlY2tib3giXSxmdW5jdGlvbigpe1MudmFsSG9va3NbdGhpc109e3NldDpmdW5jdGlvbihlLHQpe2lmKEFycmF5LmlzQXJyYXkodCkpcmV0dXJuIGUuY2hlY2tlZD0tMTxTLmluQXJyYXkoUyhlKS52YWwoKSx0KX19LHkuY2hlY2tPbnx8KFMudmFsSG9va3NbdGhpc10uZ2V0PWZ1bmN0aW9uKGUpe3JldHVybiBudWxsPT09ZS5nZXRBdHRyaWJ1dGUoInZhbHVlIik/Im9uIjplLnZhbHVlfSl9KSx5LmZvY3VzaW49Im9uZm9jdXNpbiJpbiBDO3ZhciBtdD0vXig/OmZvY3VzaW5mb2N1c3xmb2N1c291dGJsdXIpJC8seHQ9ZnVuY3Rpb24oZSl7ZS5zdG9wUHJvcGFnYXRpb24oKX07Uy5leHRlbmQoUy5ldmVudCx7dHJpZ2dlcjpmdW5jdGlvbihlLHQsbixyKXt2YXIgaSxvLGEscyx1LGwsYyxmLHA9W258fEVdLGQ9di5jYWxsKGUsInR5cGUiKT9lLnR5cGU6ZSxoPXYuY2FsbChlLCJuYW1lc3BhY2UiKT9lLm5hbWVzcGFjZS5zcGxpdCgiLiIpOltdO2lmKG89Zj1hPW49bnx8RSwzIT09bi5ub2RlVHlwZSYmOCE9PW4ubm9kZVR5cGUmJiFtdC50ZXN0KGQrUy5ldmVudC50cmlnZ2VyZWQpJiYoLTE8ZC5pbmRleE9mKCIuIikmJihkPShoPWQuc3BsaXQoIi4iKSkuc2hpZnQoKSxoLnNvcnQoKSksdT1kLmluZGV4T2YoIjoiKTwwJiYib24iK2QsKGU9ZVtTLmV4cGFuZG9dP2U6bmV3IFMuRXZlbnQoZCwib2JqZWN0Ij09dHlwZW9mIGUmJmUpKS5pc1RyaWdnZXI9cj8yOjMsZS5uYW1lc3BhY2U9aC5qb2luKCIuIiksZS5ybmFtZXNwYWNlPWUubmFtZXNwYWNlP25ldyBSZWdFeHAoIihefFxcLikiK2guam9pbigiXFwuKD86LipcXC58KSIpKyIoXFwufCQpIik6bnVsbCxlLnJlc3VsdD12b2lkIDAsZS50YXJnZXR8fChlLnRhcmdldD1uKSx0PW51bGw9PXQ/W2VdOlMubWFrZUFycmF5KHQsW2VdKSxjPVMuZXZlbnQuc3BlY2lhbFtkXXx8e30scnx8IWMudHJpZ2dlcnx8ITEhPT1jLnRyaWdnZXIuYXBwbHkobix0KSkpe2lmKCFyJiYhYy5ub0J1YmJsZSYmIXgobikpe2ZvcihzPWMuZGVsZWdhdGVUeXBlfHxkLG10LnRlc3QocytkKXx8KG89by5wYXJlbnROb2RlKTtvO289by5wYXJlbnROb2RlKXAucHVzaChvKSxhPW87YT09PShuLm93bmVyRG9jdW1lbnR8fEUpJiZwLnB1c2goYS5kZWZhdWx0Vmlld3x8YS5wYXJlbnRXaW5kb3d8fEMpfWk9MDt3aGlsZSgobz1wW2krK10pJiYhZS5pc1Byb3BhZ2F0aW9uU3RvcHBlZCgpKWY9byxlLnR5cGU9MTxpP3M6Yy5iaW5kVHlwZXx8ZCwobD0oWS5nZXQobywiZXZlbnRzIil8fE9iamVjdC5jcmVhdGUobnVsbCkpW2UudHlwZV0mJlkuZ2V0KG8sImhhbmRsZSIpKSYmbC5hcHBseShvLHQpLChsPXUmJm9bdV0pJiZsLmFwcGx5JiZWKG8pJiYoZS5yZXN1bHQ9bC5hcHBseShvLHQpLCExPT09ZS5yZXN1bHQmJmUucHJldmVudERlZmF1bHQoKSk7cmV0dXJuIGUudHlwZT1kLHJ8fGUuaXNEZWZhdWx0UHJldmVudGVkKCl8fGMuX2RlZmF1bHQmJiExIT09Yy5fZGVmYXVsdC5hcHBseShwLnBvcCgpLHQpfHwhVihuKXx8dSYmbShuW2RdKSYmIXgobikmJigoYT1uW3VdKSYmKG5bdV09bnVsbCksUy5ldmVudC50cmlnZ2VyZWQ9ZCxlLmlzUHJvcGFnYXRpb25TdG9wcGVkKCkmJmYuYWRkRXZlbnRMaXN0ZW5lcihkLHh0KSxuW2RdKCksZS5pc1Byb3BhZ2F0aW9uU3RvcHBlZCgpJiZmLnJlbW92ZUV2ZW50TGlzdGVuZXIoZCx4dCksUy5ldmVudC50cmlnZ2VyZWQ9dm9pZCAwLGEmJihuW3VdPWEpKSxlLnJlc3VsdH19LHNpbXVsYXRlOmZ1bmN0aW9uKGUsdCxuKXt2YXIgcj1TLmV4dGVuZChuZXcgUy5FdmVudCxuLHt0eXBlOmUsaXNTaW11bGF0ZWQ6ITB9KTtTLmV2ZW50LnRyaWdnZXIocixudWxsLHQpfX0pLFMuZm4uZXh0ZW5kKHt0cmlnZ2VyOmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHRoaXMuZWFjaChmdW5jdGlvbigpe1MuZXZlbnQudHJpZ2dlcihlLHQsdGhpcyl9KX0sdHJpZ2dlckhhbmRsZXI6ZnVuY3Rpb24oZSx0KXt2YXIgbj10aGlzWzBdO2lmKG4pcmV0dXJuIFMuZXZlbnQudHJpZ2dlcihlLHQsbiwhMCl9fSkseS5mb2N1c2lufHxTLmVhY2goe2ZvY3VzOiJmb2N1c2luIixibHVyOiJmb2N1c291dCJ9LGZ1bmN0aW9uKG4scil7dmFyIGk9ZnVuY3Rpb24oZSl7Uy5ldmVudC5zaW11bGF0ZShyLGUudGFyZ2V0LFMuZXZlbnQuZml4KGUpKX07Uy5ldmVudC5zcGVjaWFsW3JdPXtzZXR1cDpmdW5jdGlvbigpe3ZhciBlPXRoaXMub3duZXJEb2N1bWVudHx8dGhpcy5kb2N1bWVudHx8dGhpcyx0PVkuYWNjZXNzKGUscik7dHx8ZS5hZGRFdmVudExpc3RlbmVyKG4saSwhMCksWS5hY2Nlc3MoZSxyLCh0fHwwKSsxKX0sdGVhcmRvd246ZnVuY3Rpb24oKXt2YXIgZT10aGlzLm93bmVyRG9jdW1lbnR8fHRoaXMuZG9jdW1lbnR8fHRoaXMsdD1ZLmFjY2VzcyhlLHIpLTE7dD9ZLmFjY2VzcyhlLHIsdCk6KGUucmVtb3ZlRXZlbnRMaXN0ZW5lcihuLGksITApLFkucmVtb3ZlKGUscikpfX19KTt2YXIgYnQ9Qy5sb2NhdGlvbix3dD17Z3VpZDpEYXRlLm5vdygpfSxUdD0vXD8vO1MucGFyc2VYTUw9ZnVuY3Rpb24oZSl7dmFyIHQsbjtpZighZXx8InN0cmluZyIhPXR5cGVvZiBlKXJldHVybiBudWxsO3RyeXt0PShuZXcgQy5ET01QYXJzZXIpLnBhcnNlRnJvbVN0cmluZyhlLCJ0ZXh0L3htbCIpfWNhdGNoKGUpe31yZXR1cm4gbj10JiZ0LmdldEVsZW1lbnRzQnlUYWdOYW1lKCJwYXJzZXJlcnJvciIpWzBdLHQmJiFufHxTLmVycm9yKCJJbnZhbGlkIFhNTDogIisobj9TLm1hcChuLmNoaWxkTm9kZXMsZnVuY3Rpb24oZSl7cmV0dXJuIGUudGV4dENvbnRlbnR9KS5qb2luKCJcbiIpOmUpKSx0fTt2YXIgQ3Q9L1xbXF0kLyxFdD0vXHI/XG4vZyxTdD0vXig/OnN1Ym1pdHxidXR0b258aW1hZ2V8cmVzZXR8ZmlsZSkkL2ksa3Q9L14oPzppbnB1dHxzZWxlY3R8dGV4dGFyZWF8a2V5Z2VuKS9pO2Z1bmN0aW9uIEF0KG4sZSxyLGkpe3ZhciB0O2lmKEFycmF5LmlzQXJyYXkoZSkpUy5lYWNoKGUsZnVuY3Rpb24oZSx0KXtyfHxDdC50ZXN0KG4pP2kobix0KTpBdChuKyJbIisoIm9iamVjdCI9PXR5cGVvZiB0JiZudWxsIT10P2U6IiIpKyJdIix0LHIsaSl9KTtlbHNlIGlmKHJ8fCJvYmplY3QiIT09dyhlKSlpKG4sZSk7ZWxzZSBmb3IodCBpbiBlKUF0KG4rIlsiK3QrIl0iLGVbdF0scixpKX1TLnBhcmFtPWZ1bmN0aW9uKGUsdCl7dmFyIG4scj1bXSxpPWZ1bmN0aW9uKGUsdCl7dmFyIG49bSh0KT90KCk6dDtyW3IubGVuZ3RoXT1lbmNvZGVVUklDb21wb25lbnQoZSkrIj0iK2VuY29kZVVSSUNvbXBvbmVudChudWxsPT1uPyIiOm4pfTtpZihudWxsPT1lKXJldHVybiIiO2lmKEFycmF5LmlzQXJyYXkoZSl8fGUuanF1ZXJ5JiYhUy5pc1BsYWluT2JqZWN0KGUpKVMuZWFjaChlLGZ1bmN0aW9uKCl7aSh0aGlzLm5hbWUsdGhpcy52YWx1ZSl9KTtlbHNlIGZvcihuIGluIGUpQXQobixlW25dLHQsaSk7cmV0dXJuIHIuam9pbigiJiIpfSxTLmZuLmV4dGVuZCh7c2VyaWFsaXplOmZ1bmN0aW9uKCl7cmV0dXJuIFMucGFyYW0odGhpcy5zZXJpYWxpemVBcnJheSgpKX0sc2VyaWFsaXplQXJyYXk6ZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5tYXAoZnVuY3Rpb24oKXt2YXIgZT1TLnByb3AodGhpcywiZWxlbWVudHMiKTtyZXR1cm4gZT9TLm1ha2VBcnJheShlKTp0aGlzfSkuZmlsdGVyKGZ1bmN0aW9uKCl7dmFyIGU9dGhpcy50eXBlO3JldHVybiB0aGlzLm5hbWUmJiFTKHRoaXMpLmlzKCI6ZGlzYWJsZWQiKSYma3QudGVzdCh0aGlzLm5vZGVOYW1lKSYmIVN0LnRlc3QoZSkmJih0aGlzLmNoZWNrZWR8fCFwZS50ZXN0KGUpKX0pLm1hcChmdW5jdGlvbihlLHQpe3ZhciBuPVModGhpcykudmFsKCk7cmV0dXJuIG51bGw9PW4/bnVsbDpBcnJheS5pc0FycmF5KG4pP1MubWFwKG4sZnVuY3Rpb24oZSl7cmV0dXJue25hbWU6dC5uYW1lLHZhbHVlOmUucmVwbGFjZShFdCwiXHJcbiIpfX0pOntuYW1lOnQubmFtZSx2YWx1ZTpuLnJlcGxhY2UoRXQsIlxyXG4iKX19KS5nZXQoKX19KTt2YXIgTnQ9LyUyMC9nLGp0PS8jLiokLyxEdD0vKFs/Jl0pXz1bXiZdKi8scXQ9L14oLio/KTpbIFx0XSooW15cclxuXSopJC9nbSxMdD0vXig/OkdFVHxIRUFEKSQvLEh0PS9eXC9cLy8sT3Q9e30sUHQ9e30sUnQ9IiovIi5jb25jYXQoIioiKSxNdD1FLmNyZWF0ZUVsZW1lbnQoImEiKTtmdW5jdGlvbiBJdChvKXtyZXR1cm4gZnVuY3Rpb24oZSx0KXsic3RyaW5nIiE9dHlwZW9mIGUmJih0PWUsZT0iKiIpO3ZhciBuLHI9MCxpPWUudG9Mb3dlckNhc2UoKS5tYXRjaChQKXx8W107aWYobSh0KSl3aGlsZShuPWlbcisrXSkiKyI9PT1uWzBdPyhuPW4uc2xpY2UoMSl8fCIqIiwob1tuXT1vW25dfHxbXSkudW5zaGlmdCh0KSk6KG9bbl09b1tuXXx8W10pLnB1c2godCl9fWZ1bmN0aW9uIFd0KHQsaSxvLGEpe3ZhciBzPXt9LHU9dD09PVB0O2Z1bmN0aW9uIGwoZSl7dmFyIHI7cmV0dXJuIHNbZV09ITAsUy5lYWNoKHRbZV18fFtdLGZ1bmN0aW9uKGUsdCl7dmFyIG49dChpLG8sYSk7cmV0dXJuInN0cmluZyIhPXR5cGVvZiBufHx1fHxzW25dP3U/IShyPW4pOnZvaWQgMDooaS5kYXRhVHlwZXMudW5zaGlmdChuKSxsKG4pLCExKX0pLHJ9cmV0dXJuIGwoaS5kYXRhVHlwZXNbMF0pfHwhc1siKiJdJiZsKCIqIil9ZnVuY3Rpb24gRnQoZSx0KXt2YXIgbixyLGk9Uy5hamF4U2V0dGluZ3MuZmxhdE9wdGlvbnN8fHt9O2ZvcihuIGluIHQpdm9pZCAwIT09dFtuXSYmKChpW25dP2U6cnx8KHI9e30pKVtuXT10W25dKTtyZXR1cm4gciYmUy5leHRlbmQoITAsZSxyKSxlfU10LmhyZWY9YnQuaHJlZixTLmV4dGVuZCh7YWN0aXZlOjAsbGFzdE1vZGlmaWVkOnt9LGV0YWc6e30sYWpheFNldHRpbmdzOnt1cmw6YnQuaHJlZix0eXBlOiJHRVQiLGlzTG9jYWw6L14oPzphYm91dHxhcHB8YXBwLXN0b3JhZ2V8ListZXh0ZW5zaW9ufGZpbGV8cmVzfHdpZGdldCk6JC8udGVzdChidC5wcm90b2NvbCksZ2xvYmFsOiEwLHByb2Nlc3NEYXRhOiEwLGFzeW5jOiEwLGNvbnRlbnRUeXBlOiJhcHBsaWNhdGlvbi94LXd3dy1mb3JtLXVybGVuY29kZWQ7IGNoYXJzZXQ9VVRGLTgiLGFjY2VwdHM6eyIqIjpSdCx0ZXh0OiJ0ZXh0L3BsYWluIixodG1sOiJ0ZXh0L2h0bWwiLHhtbDoiYXBwbGljYXRpb24veG1sLCB0ZXh0L3htbCIsanNvbjoiYXBwbGljYXRpb24vanNvbiwgdGV4dC9qYXZhc2NyaXB0In0sY29udGVudHM6e3htbDovXGJ4bWxcYi8saHRtbDovXGJodG1sLyxqc29uOi9cYmpzb25cYi99LHJlc3BvbnNlRmllbGRzOnt4bWw6InJlc3BvbnNlWE1MIix0ZXh0OiJyZXNwb25zZVRleHQiLGpzb246InJlc3BvbnNlSlNPTiJ9LGNvbnZlcnRlcnM6eyIqIHRleHQiOlN0cmluZywidGV4dCBodG1sIjohMCwidGV4dCBqc29uIjpKU09OLnBhcnNlLCJ0ZXh0IHhtbCI6Uy5wYXJzZVhNTH0sZmxhdE9wdGlvbnM6e3VybDohMCxjb250ZXh0OiEwfX0sYWpheFNldHVwOmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHQ/RnQoRnQoZSxTLmFqYXhTZXR0aW5ncyksdCk6RnQoUy5hamF4U2V0dGluZ3MsZSl9LGFqYXhQcmVmaWx0ZXI6SXQoT3QpLGFqYXhUcmFuc3BvcnQ6SXQoUHQpLGFqYXg6ZnVuY3Rpb24oZSx0KXsib2JqZWN0Ij09dHlwZW9mIGUmJih0PWUsZT12b2lkIDApLHQ9dHx8e307dmFyIGMsZixwLG4sZCxyLGgsZyxpLG8sdj1TLmFqYXhTZXR1cCh7fSx0KSx5PXYuY29udGV4dHx8dixtPXYuY29udGV4dCYmKHkubm9kZVR5cGV8fHkuanF1ZXJ5KT9TKHkpOlMuZXZlbnQseD1TLkRlZmVycmVkKCksYj1TLkNhbGxiYWNrcygib25jZSBtZW1vcnkiKSx3PXYuc3RhdHVzQ29kZXx8e30sYT17fSxzPXt9LHU9ImNhbmNlbGVkIixUPXtyZWFkeVN0YXRlOjAsZ2V0UmVzcG9uc2VIZWFkZXI6ZnVuY3Rpb24oZSl7dmFyIHQ7aWYoaCl7aWYoIW4pe249e307d2hpbGUodD1xdC5leGVjKHApKW5bdFsxXS50b0xvd2VyQ2FzZSgpKyIgIl09KG5bdFsxXS50b0xvd2VyQ2FzZSgpKyIgIl18fFtdKS5jb25jYXQodFsyXSl9dD1uW2UudG9Mb3dlckNhc2UoKSsiICJdfXJldHVybiBudWxsPT10P251bGw6dC5qb2luKCIsICIpfSxnZXRBbGxSZXNwb25zZUhlYWRlcnM6ZnVuY3Rpb24oKXtyZXR1cm4gaD9wOm51bGx9LHNldFJlcXVlc3RIZWFkZXI6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gbnVsbD09aCYmKGU9c1tlLnRvTG93ZXJDYXNlKCldPXNbZS50b0xvd2VyQ2FzZSgpXXx8ZSxhW2VdPXQpLHRoaXN9LG92ZXJyaWRlTWltZVR5cGU6ZnVuY3Rpb24oZSl7cmV0dXJuIG51bGw9PWgmJih2Lm1pbWVUeXBlPWUpLHRoaXN9LHN0YXR1c0NvZGU6ZnVuY3Rpb24oZSl7dmFyIHQ7aWYoZSlpZihoKVQuYWx3YXlzKGVbVC5zdGF0dXNdKTtlbHNlIGZvcih0IGluIGUpd1t0XT1bd1t0XSxlW3RdXTtyZXR1cm4gdGhpc30sYWJvcnQ6ZnVuY3Rpb24oZSl7dmFyIHQ9ZXx8dTtyZXR1cm4gYyYmYy5hYm9ydCh0KSxsKDAsdCksdGhpc319O2lmKHgucHJvbWlzZShUKSx2LnVybD0oKGV8fHYudXJsfHxidC5ocmVmKSsiIikucmVwbGFjZShIdCxidC5wcm90b2NvbCsiLy8iKSx2LnR5cGU9dC5tZXRob2R8fHQudHlwZXx8di5tZXRob2R8fHYudHlwZSx2LmRhdGFUeXBlcz0odi5kYXRhVHlwZXx8IioiKS50b0xvd2VyQ2FzZSgpLm1hdGNoKFApfHxbIiJdLG51bGw9PXYuY3Jvc3NEb21haW4pe3I9RS5jcmVhdGVFbGVtZW50KCJhIik7dHJ5e3IuaHJlZj12LnVybCxyLmhyZWY9ci5ocmVmLHYuY3Jvc3NEb21haW49TXQucHJvdG9jb2wrIi8vIitNdC5ob3N0IT1yLnByb3RvY29sKyIvLyIrci5ob3N0fWNhdGNoKGUpe3YuY3Jvc3NEb21haW49ITB9fWlmKHYuZGF0YSYmdi5wcm9jZXNzRGF0YSYmInN0cmluZyIhPXR5cGVvZiB2LmRhdGEmJih2LmRhdGE9Uy5wYXJhbSh2LmRhdGEsdi50cmFkaXRpb25hbCkpLFd0KE90LHYsdCxUKSxoKXJldHVybiBUO2ZvcihpIGluKGc9Uy5ldmVudCYmdi5nbG9iYWwpJiYwPT1TLmFjdGl2ZSsrJiZTLmV2ZW50LnRyaWdnZXIoImFqYXhTdGFydCIpLHYudHlwZT12LnR5cGUudG9VcHBlckNhc2UoKSx2Lmhhc0NvbnRlbnQ9IUx0LnRlc3Qodi50eXBlKSxmPXYudXJsLnJlcGxhY2UoanQsIiIpLHYuaGFzQ29udGVudD92LmRhdGEmJnYucHJvY2Vzc0RhdGEmJjA9PT0odi5jb250ZW50VHlwZXx8IiIpLmluZGV4T2YoImFwcGxpY2F0aW9uL3gtd3d3LWZvcm0tdXJsZW5jb2RlZCIpJiYodi5kYXRhPXYuZGF0YS5yZXBsYWNlKE50LCIrIikpOihvPXYudXJsLnNsaWNlKGYubGVuZ3RoKSx2LmRhdGEmJih2LnByb2Nlc3NEYXRhfHwic3RyaW5nIj09dHlwZW9mIHYuZGF0YSkmJihmKz0oVHQudGVzdChmKT8iJiI6Ij8iKSt2LmRhdGEsZGVsZXRlIHYuZGF0YSksITE9PT12LmNhY2hlJiYoZj1mLnJlcGxhY2UoRHQsIiQxIiksbz0oVHQudGVzdChmKT8iJiI6Ij8iKSsiXz0iK3d0Lmd1aWQrKytvKSx2LnVybD1mK28pLHYuaWZNb2RpZmllZCYmKFMubGFzdE1vZGlmaWVkW2ZdJiZULnNldFJlcXVlc3RIZWFkZXIoIklmLU1vZGlmaWVkLVNpbmNlIixTLmxhc3RNb2RpZmllZFtmXSksUy5ldGFnW2ZdJiZULnNldFJlcXVlc3RIZWFkZXIoIklmLU5vbmUtTWF0Y2giLFMuZXRhZ1tmXSkpLCh2LmRhdGEmJnYuaGFzQ29udGVudCYmITEhPT12LmNvbnRlbnRUeXBlfHx0LmNvbnRlbnRUeXBlKSYmVC5zZXRSZXF1ZXN0SGVhZGVyKCJDb250ZW50LVR5cGUiLHYuY29udGVudFR5cGUpLFQuc2V0UmVxdWVzdEhlYWRlcigiQWNjZXB0Iix2LmRhdGFUeXBlc1swXSYmdi5hY2NlcHRzW3YuZGF0YVR5cGVzWzBdXT92LmFjY2VwdHNbdi5kYXRhVHlwZXNbMF1dKygiKiIhPT12LmRhdGFUeXBlc1swXT8iLCAiK1J0KyI7IHE9MC4wMSI6IiIpOnYuYWNjZXB0c1siKiJdKSx2LmhlYWRlcnMpVC5zZXRSZXF1ZXN0SGVhZGVyKGksdi5oZWFkZXJzW2ldKTtpZih2LmJlZm9yZVNlbmQmJighMT09PXYuYmVmb3JlU2VuZC5jYWxsKHksVCx2KXx8aCkpcmV0dXJuIFQuYWJvcnQoKTtpZih1PSJhYm9ydCIsYi5hZGQodi5jb21wbGV0ZSksVC5kb25lKHYuc3VjY2VzcyksVC5mYWlsKHYuZXJyb3IpLGM9V3QoUHQsdix0LFQpKXtpZihULnJlYWR5U3RhdGU9MSxnJiZtLnRyaWdnZXIoImFqYXhTZW5kIixbVCx2XSksaClyZXR1cm4gVDt2LmFzeW5jJiYwPHYudGltZW91dCYmKGQ9Qy5zZXRUaW1lb3V0KGZ1bmN0aW9uKCl7VC5hYm9ydCgidGltZW91dCIpfSx2LnRpbWVvdXQpKTt0cnl7aD0hMSxjLnNlbmQoYSxsKX1jYXRjaChlKXtpZihoKXRocm93IGU7bCgtMSxlKX19ZWxzZSBsKC0xLCJObyBUcmFuc3BvcnQiKTtmdW5jdGlvbiBsKGUsdCxuLHIpe3ZhciBpLG8sYSxzLHUsbD10O2h8fChoPSEwLGQmJkMuY2xlYXJUaW1lb3V0KGQpLGM9dm9pZCAwLHA9cnx8IiIsVC5yZWFkeVN0YXRlPTA8ZT80OjAsaT0yMDA8PWUmJmU8MzAwfHwzMDQ9PT1lLG4mJihzPWZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG8sYSxzPWUuY29udGVudHMsdT1lLmRhdGFUeXBlczt3aGlsZSgiKiI9PT11WzBdKXUuc2hpZnQoKSx2b2lkIDA9PT1yJiYocj1lLm1pbWVUeXBlfHx0LmdldFJlc3BvbnNlSGVhZGVyKCJDb250ZW50LVR5cGUiKSk7aWYocilmb3IoaSBpbiBzKWlmKHNbaV0mJnNbaV0udGVzdChyKSl7dS51bnNoaWZ0KGkpO2JyZWFrfWlmKHVbMF1pbiBuKW89dVswXTtlbHNle2ZvcihpIGluIG4pe2lmKCF1WzBdfHxlLmNvbnZlcnRlcnNbaSsiICIrdVswXV0pe289aTticmVha31hfHwoYT1pKX1vPW98fGF9aWYobylyZXR1cm4gbyE9PXVbMF0mJnUudW5zaGlmdChvKSxuW29dfSh2LFQsbikpLCFpJiYtMTxTLmluQXJyYXkoInNjcmlwdCIsdi5kYXRhVHlwZXMpJiZTLmluQXJyYXkoImpzb24iLHYuZGF0YVR5cGVzKTwwJiYodi5jb252ZXJ0ZXJzWyJ0ZXh0IHNjcmlwdCJdPWZ1bmN0aW9uKCl7fSkscz1mdW5jdGlvbihlLHQsbixyKXt2YXIgaSxvLGEscyx1LGw9e30sYz1lLmRhdGFUeXBlcy5zbGljZSgpO2lmKGNbMV0pZm9yKGEgaW4gZS5jb252ZXJ0ZXJzKWxbYS50b0xvd2VyQ2FzZSgpXT1lLmNvbnZlcnRlcnNbYV07bz1jLnNoaWZ0KCk7d2hpbGUobylpZihlLnJlc3BvbnNlRmllbGRzW29dJiYobltlLnJlc3BvbnNlRmllbGRzW29dXT10KSwhdSYmciYmZS5kYXRhRmlsdGVyJiYodD1lLmRhdGFGaWx0ZXIodCxlLmRhdGFUeXBlKSksdT1vLG89Yy5zaGlmdCgpKWlmKCIqIj09PW8pbz11O2Vsc2UgaWYoIioiIT09dSYmdSE9PW8pe2lmKCEoYT1sW3UrIiAiK29dfHxsWyIqICIrb10pKWZvcihpIGluIGwpaWYoKHM9aS5zcGxpdCgiICIpKVsxXT09PW8mJihhPWxbdSsiICIrc1swXV18fGxbIiogIitzWzBdXSkpeyEwPT09YT9hPWxbaV06ITAhPT1sW2ldJiYobz1zWzBdLGMudW5zaGlmdChzWzFdKSk7YnJlYWt9aWYoITAhPT1hKWlmKGEmJmVbInRocm93cyJdKXQ9YSh0KTtlbHNlIHRyeXt0PWEodCl9Y2F0Y2goZSl7cmV0dXJue3N0YXRlOiJwYXJzZXJlcnJvciIsZXJyb3I6YT9lOiJObyBjb252ZXJzaW9uIGZyb20gIit1KyIgdG8gIitvfX19cmV0dXJue3N0YXRlOiJzdWNjZXNzIixkYXRhOnR9fSh2LHMsVCxpKSxpPyh2LmlmTW9kaWZpZWQmJigodT1ULmdldFJlc3BvbnNlSGVhZGVyKCJMYXN0LU1vZGlmaWVkIikpJiYoUy5sYXN0TW9kaWZpZWRbZl09dSksKHU9VC5nZXRSZXNwb25zZUhlYWRlcigiZXRhZyIpKSYmKFMuZXRhZ1tmXT11KSksMjA0PT09ZXx8IkhFQUQiPT09di50eXBlP2w9Im5vY29udGVudCI6MzA0PT09ZT9sPSJub3Rtb2RpZmllZCI6KGw9cy5zdGF0ZSxvPXMuZGF0YSxpPSEoYT1zLmVycm9yKSkpOihhPWwsIWUmJmx8fChsPSJlcnJvciIsZTwwJiYoZT0wKSkpLFQuc3RhdHVzPWUsVC5zdGF0dXNUZXh0PSh0fHxsKSsiIixpP3gucmVzb2x2ZVdpdGgoeSxbbyxsLFRdKTp4LnJlamVjdFdpdGgoeSxbVCxsLGFdKSxULnN0YXR1c0NvZGUodyksdz12b2lkIDAsZyYmbS50cmlnZ2VyKGk/ImFqYXhTdWNjZXNzIjoiYWpheEVycm9yIixbVCx2LGk/bzphXSksYi5maXJlV2l0aCh5LFtULGxdKSxnJiYobS50cmlnZ2VyKCJhamF4Q29tcGxldGUiLFtULHZdKSwtLVMuYWN0aXZlfHxTLmV2ZW50LnRyaWdnZXIoImFqYXhTdG9wIikpKX1yZXR1cm4gVH0sZ2V0SlNPTjpmdW5jdGlvbihlLHQsbil7cmV0dXJuIFMuZ2V0KGUsdCxuLCJqc29uIil9LGdldFNjcmlwdDpmdW5jdGlvbihlLHQpe3JldHVybiBTLmdldChlLHZvaWQgMCx0LCJzY3JpcHQiKX19KSxTLmVhY2goWyJnZXQiLCJwb3N0Il0sZnVuY3Rpb24oZSxpKXtTW2ldPWZ1bmN0aW9uKGUsdCxuLHIpe3JldHVybiBtKHQpJiYocj1yfHxuLG49dCx0PXZvaWQgMCksUy5hamF4KFMuZXh0ZW5kKHt1cmw6ZSx0eXBlOmksZGF0YVR5cGU6cixkYXRhOnQsc3VjY2VzczpufSxTLmlzUGxhaW5PYmplY3QoZSkmJmUpKX19KSxTLmFqYXhQcmVmaWx0ZXIoZnVuY3Rpb24oZSl7dmFyIHQ7Zm9yKHQgaW4gZS5oZWFkZXJzKSJjb250ZW50LXR5cGUiPT09dC50b0xvd2VyQ2FzZSgpJiYoZS5jb250ZW50VHlwZT1lLmhlYWRlcnNbdF18fCIiKX0pLFMuX2V2YWxVcmw9ZnVuY3Rpb24oZSx0LG4pe3JldHVybiBTLmFqYXgoe3VybDplLHR5cGU6IkdFVCIsZGF0YVR5cGU6InNjcmlwdCIsY2FjaGU6ITAsYXN5bmM6ITEsZ2xvYmFsOiExLGNvbnZlcnRlcnM6eyJ0ZXh0IHNjcmlwdCI6ZnVuY3Rpb24oKXt9fSxkYXRhRmlsdGVyOmZ1bmN0aW9uKGUpe1MuZ2xvYmFsRXZhbChlLHQsbil9fSl9LFMuZm4uZXh0ZW5kKHt3cmFwQWxsOmZ1bmN0aW9uKGUpe3ZhciB0O3JldHVybiB0aGlzWzBdJiYobShlKSYmKGU9ZS5jYWxsKHRoaXNbMF0pKSx0PVMoZSx0aGlzWzBdLm93bmVyRG9jdW1lbnQpLmVxKDApLmNsb25lKCEwKSx0aGlzWzBdLnBhcmVudE5vZGUmJnQuaW5zZXJ0QmVmb3JlKHRoaXNbMF0pLHQubWFwKGZ1bmN0aW9uKCl7dmFyIGU9dGhpczt3aGlsZShlLmZpcnN0RWxlbWVudENoaWxkKWU9ZS5maXJzdEVsZW1lbnRDaGlsZDtyZXR1cm4gZX0pLmFwcGVuZCh0aGlzKSksdGhpc30sd3JhcElubmVyOmZ1bmN0aW9uKG4pe3JldHVybiBtKG4pP3RoaXMuZWFjaChmdW5jdGlvbihlKXtTKHRoaXMpLndyYXBJbm5lcihuLmNhbGwodGhpcyxlKSl9KTp0aGlzLmVhY2goZnVuY3Rpb24oKXt2YXIgZT1TKHRoaXMpLHQ9ZS5jb250ZW50cygpO3QubGVuZ3RoP3Qud3JhcEFsbChuKTplLmFwcGVuZChuKX0pfSx3cmFwOmZ1bmN0aW9uKHQpe3ZhciBuPW0odCk7cmV0dXJuIHRoaXMuZWFjaChmdW5jdGlvbihlKXtTKHRoaXMpLndyYXBBbGwobj90LmNhbGwodGhpcyxlKTp0KX0pfSx1bndyYXA6ZnVuY3Rpb24oZSl7cmV0dXJuIHRoaXMucGFyZW50KGUpLm5vdCgiYm9keSIpLmVhY2goZnVuY3Rpb24oKXtTKHRoaXMpLnJlcGxhY2VXaXRoKHRoaXMuY2hpbGROb2Rlcyl9KSx0aGlzfX0pLFMuZXhwci5wc2V1ZG9zLmhpZGRlbj1mdW5jdGlvbihlKXtyZXR1cm4hUy5leHByLnBzZXVkb3MudmlzaWJsZShlKX0sUy5leHByLnBzZXVkb3MudmlzaWJsZT1mdW5jdGlvbihlKXtyZXR1cm4hIShlLm9mZnNldFdpZHRofHxlLm9mZnNldEhlaWdodHx8ZS5nZXRDbGllbnRSZWN0cygpLmxlbmd0aCl9LFMuYWpheFNldHRpbmdzLnhocj1mdW5jdGlvbigpe3RyeXtyZXR1cm4gbmV3IEMuWE1MSHR0cFJlcXVlc3R9Y2F0Y2goZSl7fX07dmFyIEJ0PXswOjIwMCwxMjIzOjIwNH0sJHQ9Uy5hamF4U2V0dGluZ3MueGhyKCk7eS5jb3JzPSEhJHQmJiJ3aXRoQ3JlZGVudGlhbHMiaW4gJHQseS5hamF4PSR0PSEhJHQsUy5hamF4VHJhbnNwb3J0KGZ1bmN0aW9uKGkpe3ZhciBvLGE7aWYoeS5jb3JzfHwkdCYmIWkuY3Jvc3NEb21haW4pcmV0dXJue3NlbmQ6ZnVuY3Rpb24oZSx0KXt2YXIgbixyPWkueGhyKCk7aWYoci5vcGVuKGkudHlwZSxpLnVybCxpLmFzeW5jLGkudXNlcm5hbWUsaS5wYXNzd29yZCksaS54aHJGaWVsZHMpZm9yKG4gaW4gaS54aHJGaWVsZHMpcltuXT1pLnhockZpZWxkc1tuXTtmb3IobiBpbiBpLm1pbWVUeXBlJiZyLm92ZXJyaWRlTWltZVR5cGUmJnIub3ZlcnJpZGVNaW1lVHlwZShpLm1pbWVUeXBlKSxpLmNyb3NzRG9tYWlufHxlWyJYLVJlcXVlc3RlZC1XaXRoIl18fChlWyJYLVJlcXVlc3RlZC1XaXRoIl09IlhNTEh0dHBSZXF1ZXN0IiksZSlyLnNldFJlcXVlc3RIZWFkZXIobixlW25dKTtvPWZ1bmN0aW9uKGUpe3JldHVybiBmdW5jdGlvbigpe28mJihvPWE9ci5vbmxvYWQ9ci5vbmVycm9yPXIub25hYm9ydD1yLm9udGltZW91dD1yLm9ucmVhZHlzdGF0ZWNoYW5nZT1udWxsLCJhYm9ydCI9PT1lP3IuYWJvcnQoKToiZXJyb3IiPT09ZT8ibnVtYmVyIiE9dHlwZW9mIHIuc3RhdHVzP3QoMCwiZXJyb3IiKTp0KHIuc3RhdHVzLHIuc3RhdHVzVGV4dCk6dChCdFtyLnN0YXR1c118fHIuc3RhdHVzLHIuc3RhdHVzVGV4dCwidGV4dCIhPT0oci5yZXNwb25zZVR5cGV8fCJ0ZXh0Iil8fCJzdHJpbmciIT10eXBlb2Ygci5yZXNwb25zZVRleHQ/e2JpbmFyeTpyLnJlc3BvbnNlfTp7dGV4dDpyLnJlc3BvbnNlVGV4dH0sci5nZXRBbGxSZXNwb25zZUhlYWRlcnMoKSkpfX0sci5vbmxvYWQ9bygpLGE9ci5vbmVycm9yPXIub250aW1lb3V0PW8oImVycm9yIiksdm9pZCAwIT09ci5vbmFib3J0P3Iub25hYm9ydD1hOnIub25yZWFkeXN0YXRlY2hhbmdlPWZ1bmN0aW9uKCl7ND09PXIucmVhZHlTdGF0ZSYmQy5zZXRUaW1lb3V0KGZ1bmN0aW9uKCl7byYmYSgpfSl9LG89bygiYWJvcnQiKTt0cnl7ci5zZW5kKGkuaGFzQ29udGVudCYmaS5kYXRhfHxudWxsKX1jYXRjaChlKXtpZihvKXRocm93IGV9fSxhYm9ydDpmdW5jdGlvbigpe28mJm8oKX19fSksUy5hamF4UHJlZmlsdGVyKGZ1bmN0aW9uKGUpe2UuY3Jvc3NEb21haW4mJihlLmNvbnRlbnRzLnNjcmlwdD0hMSl9KSxTLmFqYXhTZXR1cCh7YWNjZXB0czp7c2NyaXB0OiJ0ZXh0L2phdmFzY3JpcHQsIGFwcGxpY2F0aW9uL2phdmFzY3JpcHQsIGFwcGxpY2F0aW9uL2VjbWFzY3JpcHQsIGFwcGxpY2F0aW9uL3gtZWNtYXNjcmlwdCJ9LGNvbnRlbnRzOntzY3JpcHQ6L1xiKD86amF2YXxlY21hKXNjcmlwdFxiL30sY29udmVydGVyczp7InRleHQgc2NyaXB0IjpmdW5jdGlvbihlKXtyZXR1cm4gUy5nbG9iYWxFdmFsKGUpLGV9fX0pLFMuYWpheFByZWZpbHRlcigic2NyaXB0IixmdW5jdGlvbihlKXt2b2lkIDA9PT1lLmNhY2hlJiYoZS5jYWNoZT0hMSksZS5jcm9zc0RvbWFpbiYmKGUudHlwZT0iR0VUIil9KSxTLmFqYXhUcmFuc3BvcnQoInNjcmlwdCIsZnVuY3Rpb24obil7dmFyIHIsaTtpZihuLmNyb3NzRG9tYWlufHxuLnNjcmlwdEF0dHJzKXJldHVybntzZW5kOmZ1bmN0aW9uKGUsdCl7cj1TKCI8c2NyaXB0PiIpLmF0dHIobi5zY3JpcHRBdHRyc3x8e30pLnByb3Aoe2NoYXJzZXQ6bi5zY3JpcHRDaGFyc2V0LHNyYzpuLnVybH0pLm9uKCJsb2FkIGVycm9yIixpPWZ1bmN0aW9uKGUpe3IucmVtb3ZlKCksaT1udWxsLGUmJnQoImVycm9yIj09PWUudHlwZT80MDQ6MjAwLGUudHlwZSl9KSxFLmhlYWQuYXBwZW5kQ2hpbGQoclswXSl9LGFib3J0OmZ1bmN0aW9uKCl7aSYmaSgpfX19KTt2YXIgX3QsenQ9W10sVXQ9Lyg9KVw/KD89JnwkKXxcP1w/LztTLmFqYXhTZXR1cCh7anNvbnA6ImNhbGxiYWNrIixqc29ucENhbGxiYWNrOmZ1bmN0aW9uKCl7dmFyIGU9enQucG9wKCl8fFMuZXhwYW5kbysiXyIrd3QuZ3VpZCsrO3JldHVybiB0aGlzW2VdPSEwLGV9fSksUy5hamF4UHJlZmlsdGVyKCJqc29uIGpzb25wIixmdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvLGE9ITEhPT1lLmpzb25wJiYoVXQudGVzdChlLnVybCk/InVybCI6InN0cmluZyI9PXR5cGVvZiBlLmRhdGEmJjA9PT0oZS5jb250ZW50VHlwZXx8IiIpLmluZGV4T2YoImFwcGxpY2F0aW9uL3gtd3d3LWZvcm0tdXJsZW5jb2RlZCIpJiZVdC50ZXN0KGUuZGF0YSkmJiJkYXRhIik7aWYoYXx8Impzb25wIj09PWUuZGF0YVR5cGVzWzBdKXJldHVybiByPWUuanNvbnBDYWxsYmFjaz1tKGUuanNvbnBDYWxsYmFjayk/ZS5qc29ucENhbGxiYWNrKCk6ZS5qc29ucENhbGxiYWNrLGE/ZVthXT1lW2FdLnJlcGxhY2UoVXQsIiQxIityKTohMSE9PWUuanNvbnAmJihlLnVybCs9KFR0LnRlc3QoZS51cmwpPyImIjoiPyIpK2UuanNvbnArIj0iK3IpLGUuY29udmVydGVyc1sic2NyaXB0IGpzb24iXT1mdW5jdGlvbigpe3JldHVybiBvfHxTLmVycm9yKHIrIiB3YXMgbm90IGNhbGxlZCIpLG9bMF19LGUuZGF0YVR5cGVzWzBdPSJqc29uIixpPUNbcl0sQ1tyXT1mdW5jdGlvbigpe289YXJndW1lbnRzfSxuLmFsd2F5cyhmdW5jdGlvbigpe3ZvaWQgMD09PWk/UyhDKS5yZW1vdmVQcm9wKHIpOkNbcl09aSxlW3JdJiYoZS5qc29ucENhbGxiYWNrPXQuanNvbnBDYWxsYmFjayx6dC5wdXNoKHIpKSxvJiZtKGkpJiZpKG9bMF0pLG89aT12b2lkIDB9KSwic2NyaXB0In0pLHkuY3JlYXRlSFRNTERvY3VtZW50PSgoX3Q9RS5pbXBsZW1lbnRhdGlvbi5jcmVhdGVIVE1MRG9jdW1lbnQoIiIpLmJvZHkpLmlubmVySFRNTD0iPGZvcm0+PC9mb3JtPjxmb3JtPjwvZm9ybT4iLDI9PT1fdC5jaGlsZE5vZGVzLmxlbmd0aCksUy5wYXJzZUhUTUw9ZnVuY3Rpb24oZSx0LG4pe3JldHVybiJzdHJpbmciIT10eXBlb2YgZT9bXTooImJvb2xlYW4iPT10eXBlb2YgdCYmKG49dCx0PSExKSx0fHwoeS5jcmVhdGVIVE1MRG9jdW1lbnQ/KChyPSh0PUUuaW1wbGVtZW50YXRpb24uY3JlYXRlSFRNTERvY3VtZW50KCIiKSkuY3JlYXRlRWxlbWVudCgiYmFzZSIpKS5ocmVmPUUubG9jYXRpb24uaHJlZix0LmhlYWQuYXBwZW5kQ2hpbGQocikpOnQ9RSksbz0hbiYmW10sKGk9Ti5leGVjKGUpKT9bdC5jcmVhdGVFbGVtZW50KGlbMV0pXTooaT14ZShbZV0sdCxvKSxvJiZvLmxlbmd0aCYmUyhvKS5yZW1vdmUoKSxTLm1lcmdlKFtdLGkuY2hpbGROb2RlcykpKTt2YXIgcixpLG99LFMuZm4ubG9hZD1mdW5jdGlvbihlLHQsbil7dmFyIHIsaSxvLGE9dGhpcyxzPWUuaW5kZXhPZigiICIpO3JldHVybi0xPHMmJihyPWh0KGUuc2xpY2UocykpLGU9ZS5zbGljZSgwLHMpKSxtKHQpPyhuPXQsdD12b2lkIDApOnQmJiJvYmplY3QiPT10eXBlb2YgdCYmKGk9IlBPU1QiKSwwPGEubGVuZ3RoJiZTLmFqYXgoe3VybDplLHR5cGU6aXx8IkdFVCIsZGF0YVR5cGU6Imh0bWwiLGRhdGE6dH0pLmRvbmUoZnVuY3Rpb24oZSl7bz1hcmd1bWVudHMsYS5odG1sKHI/UygiPGRpdj4iKS5hcHBlbmQoUy5wYXJzZUhUTUwoZSkpLmZpbmQocik6ZSl9KS5hbHdheXMobiYmZnVuY3Rpb24oZSx0KXthLmVhY2goZnVuY3Rpb24oKXtuLmFwcGx5KHRoaXMsb3x8W2UucmVzcG9uc2VUZXh0LHQsZV0pfSl9KSx0aGlzfSxTLmV4cHIucHNldWRvcy5hbmltYXRlZD1mdW5jdGlvbih0KXtyZXR1cm4gUy5ncmVwKFMudGltZXJzLGZ1bmN0aW9uKGUpe3JldHVybiB0PT09ZS5lbGVtfSkubGVuZ3RofSxTLm9mZnNldD17c2V0T2Zmc2V0OmZ1bmN0aW9uKGUsdCxuKXt2YXIgcixpLG8sYSxzLHUsbD1TLmNzcyhlLCJwb3NpdGlvbiIpLGM9UyhlKSxmPXt9OyJzdGF0aWMiPT09bCYmKGUuc3R5bGUucG9zaXRpb249InJlbGF0aXZlIikscz1jLm9mZnNldCgpLG89Uy5jc3MoZSwidG9wIiksdT1TLmNzcyhlLCJsZWZ0IiksKCJhYnNvbHV0ZSI9PT1sfHwiZml4ZWQiPT09bCkmJi0xPChvK3UpLmluZGV4T2YoImF1dG8iKT8oYT0ocj1jLnBvc2l0aW9uKCkpLnRvcCxpPXIubGVmdCk6KGE9cGFyc2VGbG9hdChvKXx8MCxpPXBhcnNlRmxvYXQodSl8fDApLG0odCkmJih0PXQuY2FsbChlLG4sUy5leHRlbmQoe30scykpKSxudWxsIT10LnRvcCYmKGYudG9wPXQudG9wLXMudG9wK2EpLG51bGwhPXQubGVmdCYmKGYubGVmdD10LmxlZnQtcy5sZWZ0K2kpLCJ1c2luZyJpbiB0P3QudXNpbmcuY2FsbChlLGYpOmMuY3NzKGYpfX0sUy5mbi5leHRlbmQoe29mZnNldDpmdW5jdGlvbih0KXtpZihhcmd1bWVudHMubGVuZ3RoKXJldHVybiB2b2lkIDA9PT10P3RoaXM6dGhpcy5lYWNoKGZ1bmN0aW9uKGUpe1Mub2Zmc2V0LnNldE9mZnNldCh0aGlzLHQsZSl9KTt2YXIgZSxuLHI9dGhpc1swXTtyZXR1cm4gcj9yLmdldENsaWVudFJlY3RzKCkubGVuZ3RoPyhlPXIuZ2V0Qm91bmRpbmdDbGllbnRSZWN0KCksbj1yLm93bmVyRG9jdW1lbnQuZGVmYXVsdFZpZXcse3RvcDplLnRvcCtuLnBhZ2VZT2Zmc2V0LGxlZnQ6ZS5sZWZ0K24ucGFnZVhPZmZzZXR9KTp7dG9wOjAsbGVmdDowfTp2b2lkIDB9LHBvc2l0aW9uOmZ1bmN0aW9uKCl7aWYodGhpc1swXSl7dmFyIGUsdCxuLHI9dGhpc1swXSxpPXt0b3A6MCxsZWZ0OjB9O2lmKCJmaXhlZCI9PT1TLmNzcyhyLCJwb3NpdGlvbiIpKXQ9ci5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKTtlbHNle3Q9dGhpcy5vZmZzZXQoKSxuPXIub3duZXJEb2N1bWVudCxlPXIub2Zmc2V0UGFyZW50fHxuLmRvY3VtZW50RWxlbWVudDt3aGlsZShlJiYoZT09PW4uYm9keXx8ZT09PW4uZG9jdW1lbnRFbGVtZW50KSYmInN0YXRpYyI9PT1TLmNzcyhlLCJwb3NpdGlvbiIpKWU9ZS5wYXJlbnROb2RlO2UmJmUhPT1yJiYxPT09ZS5ub2RlVHlwZSYmKChpPVMoZSkub2Zmc2V0KCkpLnRvcCs9Uy5jc3MoZSwiYm9yZGVyVG9wV2lkdGgiLCEwKSxpLmxlZnQrPVMuY3NzKGUsImJvcmRlckxlZnRXaWR0aCIsITApKX1yZXR1cm57dG9wOnQudG9wLWkudG9wLVMuY3NzKHIsIm1hcmdpblRvcCIsITApLGxlZnQ6dC5sZWZ0LWkubGVmdC1TLmNzcyhyLCJtYXJnaW5MZWZ0IiwhMCl9fX0sb2Zmc2V0UGFyZW50OmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMubWFwKGZ1bmN0aW9uKCl7dmFyIGU9dGhpcy5vZmZzZXRQYXJlbnQ7d2hpbGUoZSYmInN0YXRpYyI9PT1TLmNzcyhlLCJwb3NpdGlvbiIpKWU9ZS5vZmZzZXRQYXJlbnQ7cmV0dXJuIGV8fHJlfSl9fSksUy5lYWNoKHtzY3JvbGxMZWZ0OiJwYWdlWE9mZnNldCIsc2Nyb2xsVG9wOiJwYWdlWU9mZnNldCJ9LGZ1bmN0aW9uKHQsaSl7dmFyIG89InBhZ2VZT2Zmc2V0Ij09PWk7Uy5mblt0XT1mdW5jdGlvbihlKXtyZXR1cm4gJCh0aGlzLGZ1bmN0aW9uKGUsdCxuKXt2YXIgcjtpZih4KGUpP3I9ZTo5PT09ZS5ub2RlVHlwZSYmKHI9ZS5kZWZhdWx0Vmlldyksdm9pZCAwPT09bilyZXR1cm4gcj9yW2ldOmVbdF07cj9yLnNjcm9sbFRvKG8/ci5wYWdlWE9mZnNldDpuLG8/bjpyLnBhZ2VZT2Zmc2V0KTplW3RdPW59LHQsZSxhcmd1bWVudHMubGVuZ3RoKX19KSxTLmVhY2goWyJ0b3AiLCJsZWZ0Il0sZnVuY3Rpb24oZSxuKXtTLmNzc0hvb2tzW25dPUZlKHkucGl4ZWxQb3NpdGlvbixmdW5jdGlvbihlLHQpe2lmKHQpcmV0dXJuIHQ9V2UoZSxuKSxQZS50ZXN0KHQpP1MoZSkucG9zaXRpb24oKVtuXSsicHgiOnR9KX0pLFMuZWFjaCh7SGVpZ2h0OiJoZWlnaHQiLFdpZHRoOiJ3aWR0aCJ9LGZ1bmN0aW9uKGEscyl7Uy5lYWNoKHtwYWRkaW5nOiJpbm5lciIrYSxjb250ZW50OnMsIiI6Im91dGVyIithfSxmdW5jdGlvbihyLG8pe1MuZm5bb109ZnVuY3Rpb24oZSx0KXt2YXIgbj1hcmd1bWVudHMubGVuZ3RoJiYocnx8ImJvb2xlYW4iIT10eXBlb2YgZSksaT1yfHwoITA9PT1lfHwhMD09PXQ/Im1hcmdpbiI6ImJvcmRlciIpO3JldHVybiAkKHRoaXMsZnVuY3Rpb24oZSx0LG4pe3ZhciByO3JldHVybiB4KGUpPzA9PT1vLmluZGV4T2YoIm91dGVyIik/ZVsiaW5uZXIiK2FdOmUuZG9jdW1lbnQuZG9jdW1lbnRFbGVtZW50WyJjbGllbnQiK2FdOjk9PT1lLm5vZGVUeXBlPyhyPWUuZG9jdW1lbnRFbGVtZW50LE1hdGgubWF4KGUuYm9keVsic2Nyb2xsIithXSxyWyJzY3JvbGwiK2FdLGUuYm9keVsib2Zmc2V0IithXSxyWyJvZmZzZXQiK2FdLHJbImNsaWVudCIrYV0pKTp2b2lkIDA9PT1uP1MuY3NzKGUsdCxpKTpTLnN0eWxlKGUsdCxuLGkpfSxzLG4/ZTp2b2lkIDAsbil9fSl9KSxTLmVhY2goWyJhamF4U3RhcnQiLCJhamF4U3RvcCIsImFqYXhDb21wbGV0ZSIsImFqYXhFcnJvciIsImFqYXhTdWNjZXNzIiwiYWpheFNlbmQiXSxmdW5jdGlvbihlLHQpe1MuZm5bdF09ZnVuY3Rpb24oZSl7cmV0dXJuIHRoaXMub24odCxlKX19KSxTLmZuLmV4dGVuZCh7YmluZDpmdW5jdGlvbihlLHQsbil7cmV0dXJuIHRoaXMub24oZSxudWxsLHQsbil9LHVuYmluZDpmdW5jdGlvbihlLHQpe3JldHVybiB0aGlzLm9mZihlLG51bGwsdCl9LGRlbGVnYXRlOmZ1bmN0aW9uKGUsdCxuLHIpe3JldHVybiB0aGlzLm9uKHQsZSxuLHIpfSx1bmRlbGVnYXRlOmZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gMT09PWFyZ3VtZW50cy5sZW5ndGg/dGhpcy5vZmYoZSwiKioiKTp0aGlzLm9mZih0LGV8fCIqKiIsbil9LGhvdmVyOmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHRoaXMubW91c2VlbnRlcihlKS5tb3VzZWxlYXZlKHR8fGUpfX0pLFMuZWFjaCgiYmx1ciBmb2N1cyBmb2N1c2luIGZvY3Vzb3V0IHJlc2l6ZSBzY3JvbGwgY2xpY2sgZGJsY2xpY2sgbW91c2Vkb3duIG1vdXNldXAgbW91c2Vtb3ZlIG1vdXNlb3ZlciBtb3VzZW91dCBtb3VzZWVudGVyIG1vdXNlbGVhdmUgY2hhbmdlIHNlbGVjdCBzdWJtaXQga2V5ZG93biBrZXlwcmVzcyBrZXl1cCBjb250ZXh0bWVudSIuc3BsaXQoIiAiKSxmdW5jdGlvbihlLG4pe1MuZm5bbl09ZnVuY3Rpb24oZSx0KXtyZXR1cm4gMDxhcmd1bWVudHMubGVuZ3RoP3RoaXMub24obixudWxsLGUsdCk6dGhpcy50cmlnZ2VyKG4pfX0pO3ZhciBYdD0vXltcc1x1RkVGRlx4QTBdK3xbXHNcdUZFRkZceEEwXSskL2c7Uy5wcm94eT1mdW5jdGlvbihlLHQpe3ZhciBuLHIsaTtpZigic3RyaW5nIj09dHlwZW9mIHQmJihuPWVbdF0sdD1lLGU9biksbShlKSlyZXR1cm4gcj1zLmNhbGwoYXJndW1lbnRzLDIpLChpPWZ1bmN0aW9uKCl7cmV0dXJuIGUuYXBwbHkodHx8dGhpcyxyLmNvbmNhdChzLmNhbGwoYXJndW1lbnRzKSkpfSkuZ3VpZD1lLmd1aWQ9ZS5ndWlkfHxTLmd1aWQrKyxpfSxTLmhvbGRSZWFkeT1mdW5jdGlvbihlKXtlP1MucmVhZHlXYWl0Kys6Uy5yZWFkeSghMCl9LFMuaXNBcnJheT1BcnJheS5pc0FycmF5LFMucGFyc2VKU09OPUpTT04ucGFyc2UsUy5ub2RlTmFtZT1BLFMuaXNGdW5jdGlvbj1tLFMuaXNXaW5kb3c9eCxTLmNhbWVsQ2FzZT1YLFMudHlwZT13LFMubm93PURhdGUubm93LFMuaXNOdW1lcmljPWZ1bmN0aW9uKGUpe3ZhciB0PVMudHlwZShlKTtyZXR1cm4oIm51bWJlciI9PT10fHwic3RyaW5nIj09PXQpJiYhaXNOYU4oZS1wYXJzZUZsb2F0KGUpKX0sUy50cmltPWZ1bmN0aW9uKGUpe3JldHVybiBudWxsPT1lPyIiOihlKyIiKS5yZXBsYWNlKFh0LCIiKX0sImZ1bmN0aW9uIj09dHlwZW9mIGRlZmluZSYmZGVmaW5lLmFtZCYmZGVmaW5lKCJqcXVlcnkiLFtdLGZ1bmN0aW9uKCl7cmV0dXJuIFN9KTt2YXIgVnQ9Qy5qUXVlcnksR3Q9Qy4kO3JldHVybiBTLm5vQ29uZmxpY3Q9ZnVuY3Rpb24oZSl7cmV0dXJuIEMuJD09PVMmJihDLiQ9R3QpLGUmJkMualF1ZXJ5PT09UyYmKEMualF1ZXJ5PVZ0KSxTfSwidW5kZWZpbmVkIj09dHlwZW9mIGUmJihDLmpRdWVyeT1DLiQ9UyksU30pOwo=\"></script>\n",
       "<script title=\"dt-core\" src=\"data:application/javascript;base64,LyohIERhdGFUYWJsZXMgMS4xMy40CiAqIMKpMjAwOC0yMDIzIFNwcnlNZWRpYSBMdGQgLSBkYXRhdGFibGVzLm5ldC9saWNlbnNlCiAqLwohZnVuY3Rpb24obil7InVzZSBzdHJpY3QiO3ZhciBhOyJmdW5jdGlvbiI9PXR5cGVvZiBkZWZpbmUmJmRlZmluZS5hbWQ/ZGVmaW5lKFsianF1ZXJ5Il0sZnVuY3Rpb24odCl7cmV0dXJuIG4odCx3aW5kb3csZG9jdW1lbnQpfSk6Im9iamVjdCI9PXR5cGVvZiBleHBvcnRzPyhhPXJlcXVpcmUoImpxdWVyeSIpLCJ1bmRlZmluZWQiIT10eXBlb2Ygd2luZG93P21vZHVsZS5leHBvcnRzPWZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQ9dHx8d2luZG93LGU9ZXx8YSh0KSxuKGUsdCx0LmRvY3VtZW50KX06bihhLHdpbmRvdyx3aW5kb3cuZG9jdW1lbnQpKTp3aW5kb3cuRGF0YVRhYmxlPW4oalF1ZXJ5LHdpbmRvdyxkb2N1bWVudCl9KGZ1bmN0aW9uKFAsaix5LE4peyJ1c2Ugc3RyaWN0IjtmdW5jdGlvbiBkKHQpe3ZhciBlPXBhcnNlSW50KHQsMTApO3JldHVybiFpc05hTihlKSYmaXNGaW5pdGUodCk/ZTpudWxsfWZ1bmN0aW9uIGwodCxlLG4pe3ZhciBhPXR5cGVvZiB0LHI9InN0cmluZyI9PWE7cmV0dXJuIm51bWJlciI9PWF8fCJiaWdpbnQiPT1hfHwhIWgodCl8fChlJiZyJiYodD1HKHQsZSkpLG4mJnImJih0PXQucmVwbGFjZShxLCIiKSksIWlzTmFOKHBhcnNlRmxvYXQodCkpJiZpc0Zpbml0ZSh0KSl9ZnVuY3Rpb24gYSh0LGUsbil7dmFyIGE7cmV0dXJuISFoKHQpfHwoaChhPXQpfHwic3RyaW5nIj09dHlwZW9mIGEpJiYhIWwodC5yZXBsYWNlKFYsIiIpLGUsbil8fG51bGx9ZnVuY3Rpb24gbSh0LGUsbixhKXt2YXIgcj1bXSxvPTAsaT1lLmxlbmd0aDtpZihhIT09Tilmb3IoO288aTtvKyspdFtlW29dXVtuXSYmci5wdXNoKHRbZVtvXV1bbl1bYV0pO2Vsc2UgZm9yKDtvPGk7bysrKXIucHVzaCh0W2Vbb11dW25dKTtyZXR1cm4gcn1mdW5jdGlvbiBmKHQsZSl7dmFyIG4sYT1bXTtlPT09Tj8oZT0wLG49dCk6KG49ZSxlPXQpO2Zvcih2YXIgcj1lO3I8bjtyKyspYS5wdXNoKHIpO3JldHVybiBhfWZ1bmN0aW9uIF8odCl7Zm9yKHZhciBlPVtdLG49MCxhPXQubGVuZ3RoO248YTtuKyspdFtuXSYmZS5wdXNoKHRbbl0pO3JldHVybiBlfWZ1bmN0aW9uIHModCxlKXtyZXR1cm4tMSE9PXRoaXMuaW5kZXhPZih0LGU9ZT09PU4/MDplKX12YXIgcCxlLHQsdz1mdW5jdGlvbih0LHYpe2lmKHcuZmFjdG9yeSh0LHYpKXJldHVybiB3O2lmKHRoaXMgaW5zdGFuY2VvZiB3KXJldHVybiBQKHQpLkRhdGFUYWJsZSh2KTt2PXQsdGhpcy4kPWZ1bmN0aW9uKHQsZSl7cmV0dXJuIHRoaXMuYXBpKCEwKS4kKHQsZSl9LHRoaXMuXz1mdW5jdGlvbih0LGUpe3JldHVybiB0aGlzLmFwaSghMCkucm93cyh0LGUpLmRhdGEoKX0sdGhpcy5hcGk9ZnVuY3Rpb24odCl7cmV0dXJuIG5ldyBCKHQ/Z2UodGhpc1twLmlBcGlJbmRleF0pOnRoaXMpfSx0aGlzLmZuQWRkRGF0YT1mdW5jdGlvbih0LGUpe3ZhciBuPXRoaXMuYXBpKCEwKSx0PShBcnJheS5pc0FycmF5KHQpJiYoQXJyYXkuaXNBcnJheSh0WzBdKXx8UC5pc1BsYWluT2JqZWN0KHRbMF0pKT9uLnJvd3M6bi5yb3cpLmFkZCh0KTtyZXR1cm4gZSE9PU4mJiFlfHxuLmRyYXcoKSx0LmZsYXR0ZW4oKS50b0FycmF5KCl9LHRoaXMuZm5BZGp1c3RDb2x1bW5TaXppbmc9ZnVuY3Rpb24odCl7dmFyIGU9dGhpcy5hcGkoITApLmNvbHVtbnMuYWRqdXN0KCksbj1lLnNldHRpbmdzKClbMF0sYT1uLm9TY3JvbGw7dD09PU58fHQ/ZS5kcmF3KCExKToiIj09PWEuc1gmJiIiPT09YS5zWXx8UXQobil9LHRoaXMuZm5DbGVhclRhYmxlPWZ1bmN0aW9uKHQpe3ZhciBlPXRoaXMuYXBpKCEwKS5jbGVhcigpO3QhPT1OJiYhdHx8ZS5kcmF3KCl9LHRoaXMuZm5DbG9zZT1mdW5jdGlvbih0KXt0aGlzLmFwaSghMCkucm93KHQpLmNoaWxkLmhpZGUoKX0sdGhpcy5mbkRlbGV0ZVJvdz1mdW5jdGlvbih0LGUsbil7dmFyIGE9dGhpcy5hcGkoITApLHQ9YS5yb3dzKHQpLHI9dC5zZXR0aW5ncygpWzBdLG89ci5hb0RhdGFbdFswXVswXV07cmV0dXJuIHQucmVtb3ZlKCksZSYmZS5jYWxsKHRoaXMscixvKSxuIT09TiYmIW58fGEuZHJhdygpLG99LHRoaXMuZm5EZXN0cm95PWZ1bmN0aW9uKHQpe3RoaXMuYXBpKCEwKS5kZXN0cm95KHQpfSx0aGlzLmZuRHJhdz1mdW5jdGlvbih0KXt0aGlzLmFwaSghMCkuZHJhdyh0KX0sdGhpcy5mbkZpbHRlcj1mdW5jdGlvbih0LGUsbixhLHIsbyl7dmFyIGk9dGhpcy5hcGkoITApOyhudWxsPT09ZXx8ZT09PU4/aTppLmNvbHVtbihlKSkuc2VhcmNoKHQsbixhLG8pLGkuZHJhdygpfSx0aGlzLmZuR2V0RGF0YT1mdW5jdGlvbih0LGUpe3ZhciBuLGE9dGhpcy5hcGkoITApO3JldHVybiB0IT09Tj8obj10Lm5vZGVOYW1lP3Qubm9kZU5hbWUudG9Mb3dlckNhc2UoKToiIixlIT09Tnx8InRkIj09bnx8InRoIj09bj9hLmNlbGwodCxlKS5kYXRhKCk6YS5yb3codCkuZGF0YSgpfHxudWxsKTphLmRhdGEoKS50b0FycmF5KCl9LHRoaXMuZm5HZXROb2Rlcz1mdW5jdGlvbih0KXt2YXIgZT10aGlzLmFwaSghMCk7cmV0dXJuIHQhPT1OP2Uucm93KHQpLm5vZGUoKTplLnJvd3MoKS5ub2RlcygpLmZsYXR0ZW4oKS50b0FycmF5KCl9LHRoaXMuZm5HZXRQb3NpdGlvbj1mdW5jdGlvbih0KXt2YXIgZT10aGlzLmFwaSghMCksbj10Lm5vZGVOYW1lLnRvVXBwZXJDYXNlKCk7cmV0dXJuIlRSIj09bj9lLnJvdyh0KS5pbmRleCgpOiJURCI9PW58fCJUSCI9PW4/WyhuPWUuY2VsbCh0KS5pbmRleCgpKS5yb3csbi5jb2x1bW5WaXNpYmxlLG4uY29sdW1uXTpudWxsfSx0aGlzLmZuSXNPcGVuPWZ1bmN0aW9uKHQpe3JldHVybiB0aGlzLmFwaSghMCkucm93KHQpLmNoaWxkLmlzU2hvd24oKX0sdGhpcy5mbk9wZW49ZnVuY3Rpb24odCxlLG4pe3JldHVybiB0aGlzLmFwaSghMCkucm93KHQpLmNoaWxkKGUsbikuc2hvdygpLmNoaWxkKClbMF19LHRoaXMuZm5QYWdlQ2hhbmdlPWZ1bmN0aW9uKHQsZSl7dD10aGlzLmFwaSghMCkucGFnZSh0KTtlIT09TiYmIWV8fHQuZHJhdyghMSl9LHRoaXMuZm5TZXRDb2x1bW5WaXM9ZnVuY3Rpb24odCxlLG4pe3Q9dGhpcy5hcGkoITApLmNvbHVtbih0KS52aXNpYmxlKGUpO24hPT1OJiYhbnx8dC5jb2x1bW5zLmFkanVzdCgpLmRyYXcoKX0sdGhpcy5mblNldHRpbmdzPWZ1bmN0aW9uKCl7cmV0dXJuIGdlKHRoaXNbcC5pQXBpSW5kZXhdKX0sdGhpcy5mblNvcnQ9ZnVuY3Rpb24odCl7dGhpcy5hcGkoITApLm9yZGVyKHQpLmRyYXcoKX0sdGhpcy5mblNvcnRMaXN0ZW5lcj1mdW5jdGlvbih0LGUsbil7dGhpcy5hcGkoITApLm9yZGVyLmxpc3RlbmVyKHQsZSxuKX0sdGhpcy5mblVwZGF0ZT1mdW5jdGlvbih0LGUsbixhLHIpe3ZhciBvPXRoaXMuYXBpKCEwKTtyZXR1cm4obj09PU58fG51bGw9PT1uP28ucm93KGUpOm8uY2VsbChlLG4pKS5kYXRhKHQpLHIhPT1OJiYhcnx8by5jb2x1bW5zLmFkanVzdCgpLGEhPT1OJiYhYXx8by5kcmF3KCksMH0sdGhpcy5mblZlcnNpb25DaGVjaz1wLmZuVmVyc2lvbkNoZWNrO3ZhciBlLHk9dGhpcyxEPXY9PT1OLF89dGhpcy5sZW5ndGg7Zm9yKGUgaW4gRCYmKHY9e30pLHRoaXMub0FwaT10aGlzLmludGVybmFsPXAuaW50ZXJuYWwsdy5leHQuaW50ZXJuYWwpZSYmKHRoaXNbZV09R2UoZSkpO3JldHVybiB0aGlzLmVhY2goZnVuY3Rpb24oKXt2YXIgcj0xPF8/YmUoe30sdiwhMCk6dixvPTAsdD10aGlzLmdldEF0dHJpYnV0ZSgiaWQiKSxpPSExLGU9dy5kZWZhdWx0cyxsPVAodGhpcyk7aWYoInRhYmxlIiE9dGhpcy5ub2RlTmFtZS50b0xvd2VyQ2FzZSgpKVcobnVsbCwwLCJOb24tdGFibGUgbm9kZSBpbml0aWFsaXNhdGlvbiAoIit0aGlzLm5vZGVOYW1lKyIpIiwyKTtlbHNle0soZSksUShlLmNvbHVtbiksQyhlLGUsITApLEMoZS5jb2x1bW4sZS5jb2x1bW4sITApLEMoZSxQLmV4dGVuZChyLGwuZGF0YSgpKSwhMCk7Zm9yKHZhciBuPXcuc2V0dGluZ3Msbz0wLHM9bi5sZW5ndGg7bzxzO28rKyl7dmFyIGE9bltvXTtpZihhLm5UYWJsZT09dGhpc3x8YS5uVEhlYWQmJmEublRIZWFkLnBhcmVudE5vZGU9PXRoaXN8fGEublRGb290JiZhLm5URm9vdC5wYXJlbnROb2RlPT10aGlzKXt2YXIgdT0oci5iUmV0cmlldmUhPT1OP3I6ZSkuYlJldHJpZXZlLGM9KHIuYkRlc3Ryb3khPT1OP3I6ZSkuYkRlc3Ryb3k7aWYoRHx8dSlyZXR1cm4gYS5vSW5zdGFuY2U7aWYoYyl7YS5vSW5zdGFuY2UuZm5EZXN0cm95KCk7YnJlYWt9cmV0dXJuIHZvaWQgVyhhLDAsIkNhbm5vdCByZWluaXRpYWxpc2UgRGF0YVRhYmxlIiwzKX1pZihhLnNUYWJsZUlkPT10aGlzLmlkKXtuLnNwbGljZShvLDEpO2JyZWFrfX1udWxsIT09dCYmIiIhPT10fHwodD0iRGF0YVRhYmxlc19UYWJsZV8iK3cuZXh0Ll91bmlxdWUrKyx0aGlzLmlkPXQpO3ZhciBmLGQsaD1QLmV4dGVuZCghMCx7fSx3Lm1vZGVscy5vU2V0dGluZ3Mse3NEZXN0cm95V2lkdGg6bFswXS5zdHlsZS53aWR0aCxzSW5zdGFuY2U6dCxzVGFibGVJZDp0fSkscD0oaC5uVGFibGU9dGhpcyxoLm9BcGk9eS5pbnRlcm5hbCxoLm9Jbml0PXIsbi5wdXNoKGgpLGgub0luc3RhbmNlPTE9PT15Lmxlbmd0aD95OmwuZGF0YVRhYmxlKCksSyhyKSxaKHIub0xhbmd1YWdlKSxyLmFMZW5ndGhNZW51JiYhci5pRGlzcGxheUxlbmd0aCYmKHIuaURpc3BsYXlMZW5ndGg9KEFycmF5LmlzQXJyYXkoci5hTGVuZ3RoTWVudVswXSk/ci5hTGVuZ3RoTWVudVswXTpyLmFMZW5ndGhNZW51KVswXSkscj1iZShQLmV4dGVuZCghMCx7fSxlKSxyKSxGKGgub0ZlYXR1cmVzLHIsWyJiUGFnaW5hdGUiLCJiTGVuZ3RoQ2hhbmdlIiwiYkZpbHRlciIsImJTb3J0IiwiYlNvcnRNdWx0aSIsImJJbmZvIiwiYlByb2Nlc3NpbmciLCJiQXV0b1dpZHRoIiwiYlNvcnRDbGFzc2VzIiwiYlNlcnZlclNpZGUiLCJiRGVmZXJSZW5kZXIiXSksRihoLHIsWyJhc1N0cmlwZUNsYXNzZXMiLCJhamF4IiwiZm5TZXJ2ZXJEYXRhIiwiZm5Gb3JtYXROdW1iZXIiLCJzU2VydmVyTWV0aG9kIiwiYWFTb3J0aW5nIiwiYWFTb3J0aW5nRml4ZWQiLCJhTGVuZ3RoTWVudSIsInNQYWdpbmF0aW9uVHlwZSIsInNBamF4U291cmNlIiwic0FqYXhEYXRhUHJvcCIsImlTdGF0ZUR1cmF0aW9uIiwic0RvbSIsImJTb3J0Q2VsbHNUb3AiLCJpVGFiSW5kZXgiLCJmblN0YXRlTG9hZENhbGxiYWNrIiwiZm5TdGF0ZVNhdmVDYWxsYmFjayIsInJlbmRlcmVyIiwic2VhcmNoRGVsYXkiLCJyb3dJZCIsWyJpQ29va2llRHVyYXRpb24iLCJpU3RhdGVEdXJhdGlvbiJdLFsib1NlYXJjaCIsIm9QcmV2aW91c1NlYXJjaCJdLFsiYW9TZWFyY2hDb2xzIiwiYW9QcmVTZWFyY2hDb2xzIl0sWyJpRGlzcGxheUxlbmd0aCIsIl9pRGlzcGxheUxlbmd0aCJdXSksRihoLm9TY3JvbGwscixbWyJzU2Nyb2xsWCIsInNYIl0sWyJzU2Nyb2xsWElubmVyIiwic1hJbm5lciJdLFsic1Njcm9sbFkiLCJzWSJdLFsiYlNjcm9sbENvbGxhcHNlIiwiYkNvbGxhcHNlIl1dKSxGKGgub0xhbmd1YWdlLHIsImZuSW5mb0NhbGxiYWNrIiksTChoLCJhb0RyYXdDYWxsYmFjayIsci5mbkRyYXdDYWxsYmFjaywidXNlciIpLEwoaCwiYW9TZXJ2ZXJQYXJhbXMiLHIuZm5TZXJ2ZXJQYXJhbXMsInVzZXIiKSxMKGgsImFvU3RhdGVTYXZlUGFyYW1zIixyLmZuU3RhdGVTYXZlUGFyYW1zLCJ1c2VyIiksTChoLCJhb1N0YXRlTG9hZFBhcmFtcyIsci5mblN0YXRlTG9hZFBhcmFtcywidXNlciIpLEwoaCwiYW9TdGF0ZUxvYWRlZCIsci5mblN0YXRlTG9hZGVkLCJ1c2VyIiksTChoLCJhb1Jvd0NhbGxiYWNrIixyLmZuUm93Q2FsbGJhY2ssInVzZXIiKSxMKGgsImFvUm93Q3JlYXRlZENhbGxiYWNrIixyLmZuQ3JlYXRlZFJvdywidXNlciIpLEwoaCwiYW9IZWFkZXJDYWxsYmFjayIsci5mbkhlYWRlckNhbGxiYWNrLCJ1c2VyIiksTChoLCJhb0Zvb3RlckNhbGxiYWNrIixyLmZuRm9vdGVyQ2FsbGJhY2ssInVzZXIiKSxMKGgsImFvSW5pdENvbXBsZXRlIixyLmZuSW5pdENvbXBsZXRlLCJ1c2VyIiksTChoLCJhb1ByZURyYXdDYWxsYmFjayIsci5mblByZURyYXdDYWxsYmFjaywidXNlciIpLGgucm93SWRGbj1BKHIucm93SWQpLHR0KGgpLGgub0NsYXNzZXMpLGc9KFAuZXh0ZW5kKHAsdy5leHQuY2xhc3NlcyxyLm9DbGFzc2VzKSxsLmFkZENsYXNzKHAuc1RhYmxlKSxoLmlJbml0RGlzcGxheVN0YXJ0PT09TiYmKGguaUluaXREaXNwbGF5U3RhcnQ9ci5pRGlzcGxheVN0YXJ0LGguX2lEaXNwbGF5U3RhcnQ9ci5pRGlzcGxheVN0YXJ0KSxudWxsIT09ci5pRGVmZXJMb2FkaW5nJiYoaC5iRGVmZXJMb2FkaW5nPSEwLHQ9QXJyYXkuaXNBcnJheShyLmlEZWZlckxvYWRpbmcpLGguX2lSZWNvcmRzRGlzcGxheT10P3IuaURlZmVyTG9hZGluZ1swXTpyLmlEZWZlckxvYWRpbmcsaC5faVJlY29yZHNUb3RhbD10P3IuaURlZmVyTG9hZGluZ1sxXTpyLmlEZWZlckxvYWRpbmcpLGgub0xhbmd1YWdlKSx0PShQLmV4dGVuZCghMCxnLHIub0xhbmd1YWdlKSxnLnNVcmw/KFAuYWpheCh7ZGF0YVR5cGU6Impzb24iLHVybDpnLnNVcmwsc3VjY2VzczpmdW5jdGlvbih0KXtDKGUub0xhbmd1YWdlLHQpLFoodCksUC5leHRlbmQoITAsZyx0LGgub0luaXQub0xhbmd1YWdlKSxSKGgsbnVsbCwiaTE4biIsW2hdKSxKdChoKX0sZXJyb3I6ZnVuY3Rpb24oKXtKdChoKX19KSxpPSEwKTpSKGgsbnVsbCwiaTE4biIsW2hdKSxudWxsPT09ci5hc1N0cmlwZUNsYXNzZXMmJihoLmFzU3RyaXBlQ2xhc3Nlcz1bcC5zU3RyaXBlT2RkLHAuc1N0cmlwZUV2ZW5dKSxoLmFzU3RyaXBlQ2xhc3NlcyksYj1sLmNoaWxkcmVuKCJ0Ym9keSIpLmZpbmQoInRyIikuZXEoMCksbT0oLTEhPT1QLmluQXJyYXkoITAsUC5tYXAodCxmdW5jdGlvbih0LGUpe3JldHVybiBiLmhhc0NsYXNzKHQpfSkpJiYoUCgidGJvZHkgdHIiLHRoaXMpLnJlbW92ZUNsYXNzKHQuam9pbigiICIpKSxoLmFzRGVzdHJveVN0cmlwZXM9dC5zbGljZSgpKSxbXSksdD10aGlzLmdldEVsZW1lbnRzQnlUYWdOYW1lKCJ0aGVhZCIpO2lmKDAhPT10Lmxlbmd0aCYmKHd0KGguYW9IZWFkZXIsdFswXSksbT1DdChoKSksbnVsbD09PXIuYW9Db2x1bW5zKWZvcihmPVtdLG89MCxzPW0ubGVuZ3RoO288cztvKyspZi5wdXNoKG51bGwpO2Vsc2UgZj1yLmFvQ29sdW1ucztmb3Iobz0wLHM9Zi5sZW5ndGg7bzxzO28rKyludChoLG0/bVtvXTpudWxsKTtzdChoLHIuYW9Db2x1bW5EZWZzLGYsZnVuY3Rpb24odCxlKXthdChoLHQsZSl9KSxiLmxlbmd0aCYmKGQ9ZnVuY3Rpb24odCxlKXtyZXR1cm4gbnVsbCE9PXQuZ2V0QXR0cmlidXRlKCJkYXRhLSIrZSk/ZTpudWxsfSxQKGJbMF0pLmNoaWxkcmVuKCJ0aCwgdGQiKS5lYWNoKGZ1bmN0aW9uKHQsZSl7dmFyIG4sYT1oLmFvQ29sdW1uc1t0XTthfHxXKGgsMCwiSW5jb3JyZWN0IGNvbHVtbiBjb3VudCIsMTgpLGEubURhdGE9PT10JiYobj1kKGUsInNvcnQiKXx8ZChlLCJvcmRlciIpLGU9ZChlLCJmaWx0ZXIiKXx8ZChlLCJzZWFyY2giKSxudWxsPT09biYmbnVsbD09PWV8fChhLm1EYXRhPXtfOnQrIi5kaXNwbGF5Iixzb3J0Om51bGwhPT1uP3QrIi5AZGF0YS0iK246Tix0eXBlOm51bGwhPT1uP3QrIi5AZGF0YS0iK246TixmaWx0ZXI6bnVsbCE9PWU/dCsiLkBkYXRhLSIrZTpOfSxhLl9pc0FycmF5SG9zdD0hMCxhdChoLHQpKSl9KSk7dmFyIFM9aC5vRmVhdHVyZXMsdD1mdW5jdGlvbigpe2lmKHIuYWFTb3J0aW5nPT09Til7dmFyIHQ9aC5hYVNvcnRpbmc7Zm9yKG89MCxzPXQubGVuZ3RoO288cztvKyspdFtvXVsxXT1oLmFvQ29sdW1uc1tvXS5hc1NvcnRpbmdbMF19Y2UoaCksUy5iU29ydCYmTChoLCJhb0RyYXdDYWxsYmFjayIsZnVuY3Rpb24oKXt2YXIgdCxuO2guYlNvcnRlZCYmKHQ9SShoKSxuPXt9LFAuZWFjaCh0LGZ1bmN0aW9uKHQsZSl7bltlLnNyY109ZS5kaXJ9KSxSKGgsbnVsbCwib3JkZXIiLFtoLHQsbl0pLGxlKGgpKX0pLEwoaCwiYW9EcmF3Q2FsbGJhY2siLGZ1bmN0aW9uKCl7KGguYlNvcnRlZHx8InNzcCI9PT1FKGgpfHxTLmJEZWZlclJlbmRlcikmJmNlKGgpfSwic2MiKTt2YXIgZT1sLmNoaWxkcmVuKCJjYXB0aW9uIikuZWFjaChmdW5jdGlvbigpe3RoaXMuX2NhcHRpb25TaWRlPVAodGhpcykuY3NzKCJjYXB0aW9uLXNpZGUiKX0pLG49bC5jaGlsZHJlbigidGhlYWQiKSxhPSgwPT09bi5sZW5ndGgmJihuPVAoIjx0aGVhZC8+IikuYXBwZW5kVG8obCkpLGgublRIZWFkPW5bMF0sbC5jaGlsZHJlbigidGJvZHkiKSksbj0oMD09PWEubGVuZ3RoJiYoYT1QKCI8dGJvZHkvPiIpLmluc2VydEFmdGVyKG4pKSxoLm5UQm9keT1hWzBdLGwuY2hpbGRyZW4oInRmb290IikpO2lmKDA9PT0obj0wPT09bi5sZW5ndGgmJjA8ZS5sZW5ndGgmJigiIiE9PWgub1Njcm9sbC5zWHx8IiIhPT1oLm9TY3JvbGwuc1kpP1AoIjx0Zm9vdC8+IikuYXBwZW5kVG8obCk6bikubGVuZ3RofHwwPT09bi5jaGlsZHJlbigpLmxlbmd0aD9sLmFkZENsYXNzKHAuc05vRm9vdGVyKTowPG4ubGVuZ3RoJiYoaC5uVEZvb3Q9blswXSx3dChoLmFvRm9vdGVyLGgublRGb290KSksci5hYURhdGEpZm9yKG89MDtvPHIuYWFEYXRhLmxlbmd0aDtvKyspeChoLHIuYWFEYXRhW29dKTtlbHNlIWguYkRlZmVyTG9hZGluZyYmImRvbSIhPUUoaCl8fHV0KGgsUChoLm5UQm9keSkuY2hpbGRyZW4oInRyIikpO2guYWlEaXNwbGF5PWguYWlEaXNwbGF5TWFzdGVyLnNsaWNlKCksIShoLmJJbml0aWFsaXNlZD0hMCk9PT1pJiZKdChoKX07TChoLCJhb0RyYXdDYWxsYmFjayIsZGUsInN0YXRlX3NhdmUiKSxyLmJTdGF0ZVNhdmU/KFMuYlN0YXRlU2F2ZT0hMCxoZShoLDAsdCkpOnQoKX19KSx5PW51bGwsdGhpc30sYz17fSxVPS9bXHJcblx1MjAyOF0vZyxWPS88Lio/Pi9nLFg9L15cZHsyLDR9W1wuXC9cLV1cZHsxLDJ9W1wuXC9cLV1cZHsxLDJ9KFtUIF17MX1cZHsxLDJ9WzpcLl1cZHsyfShbXC46XVxkezJ9KT8pPyQvLEo9bmV3IFJlZ0V4cCgiKFxcIitbIi8iLCIuIiwiKiIsIisiLCI/IiwifCIsIigiLCIpIiwiWyIsIl0iLCJ7IiwifSIsIlxcIiwiJCIsIl4iLCItIl0uam9pbigifFxcIikrIikiLCJnIikscT0vWydcdTAwQTAsJMKj4oKswqUlXHUyMDA5XHUyMDJGXHUyMEJEXHUyMGE5XHUyMEJBcmZryYPOnl0vZ2ksaD1mdW5jdGlvbih0KXtyZXR1cm4hdHx8ITA9PT10fHwiLSI9PT10fSxHPWZ1bmN0aW9uKHQsZSl7cmV0dXJuIGNbZV18fChjW2VdPW5ldyBSZWdFeHAoT3QoZSksImciKSksInN0cmluZyI9PXR5cGVvZiB0JiYiLiIhPT1lP3QucmVwbGFjZSgvXC4vZywiIikucmVwbGFjZShjW2VdLCIuIik6dH0sSD1mdW5jdGlvbih0LGUsbil7dmFyIGE9W10scj0wLG89dC5sZW5ndGg7aWYobiE9PU4pZm9yKDtyPG87cisrKXRbcl0mJnRbcl1bZV0mJmEucHVzaCh0W3JdW2VdW25dKTtlbHNlIGZvcig7cjxvO3IrKyl0W3JdJiZhLnB1c2godFtyXVtlXSk7cmV0dXJuIGF9LCQ9ZnVuY3Rpb24odCl7aWYoISh0Lmxlbmd0aDwyKSlmb3IodmFyIGU9dC5zbGljZSgpLnNvcnQoKSxuPWVbMF0sYT0xLHI9ZS5sZW5ndGg7YTxyO2ErKyl7aWYoZVthXT09PW4pcmV0dXJuITE7bj1lW2FdfXJldHVybiEwfSx6PWZ1bmN0aW9uKHQpe2lmKCQodCkpcmV0dXJuIHQuc2xpY2UoKTt2YXIgZSxuLGEscj1bXSxvPXQubGVuZ3RoLGk9MDt0OmZvcihuPTA7bjxvO24rKyl7Zm9yKGU9dFtuXSxhPTA7YTxpO2ErKylpZihyW2FdPT09ZSljb250aW51ZSB0O3IucHVzaChlKSxpKyt9cmV0dXJuIHJ9LFk9ZnVuY3Rpb24odCxlKXtpZihBcnJheS5pc0FycmF5KGUpKWZvcih2YXIgbj0wO248ZS5sZW5ndGg7bisrKVkodCxlW25dKTtlbHNlIHQucHVzaChlKTtyZXR1cm4gdH07ZnVuY3Rpb24gaShuKXt2YXIgYSxyLG89e307UC5lYWNoKG4sZnVuY3Rpb24odCxlKXsoYT10Lm1hdGNoKC9eKFteQS1aXSs/KShbQS1aXSkvKSkmJi0xIT09ImEgYWEgYWkgYW8gYXMgYiBmbiBpIG0gbyBzICIuaW5kZXhPZihhWzFdKyIgIikmJihyPXQucmVwbGFjZShhWzBdLGFbMl0udG9Mb3dlckNhc2UoKSksb1tyXT10LCJvIj09PWFbMV0pJiZpKG5bdF0pfSksbi5faHVuZ2FyaWFuTWFwPW99ZnVuY3Rpb24gQyhuLGEscil7dmFyIG87bi5faHVuZ2FyaWFuTWFwfHxpKG4pLFAuZWFjaChhLGZ1bmN0aW9uKHQsZSl7KG89bi5faHVuZ2FyaWFuTWFwW3RdKT09PU58fCFyJiZhW29dIT09Tnx8KCJvIj09PW8uY2hhckF0KDApPyhhW29dfHwoYVtvXT17fSksUC5leHRlbmQoITAsYVtvXSxhW3RdKSxDKG5bb10sYVtvXSxyKSk6YVtvXT1hW3RdKX0pfWZ1bmN0aW9uIFoodCl7dmFyIGUsbj13LmRlZmF1bHRzLm9MYW5ndWFnZSxhPW4uc0RlY2ltYWw7YSYmTWUoYSksdCYmKGU9dC5zWmVyb1JlY29yZHMsIXQuc0VtcHR5VGFibGUmJmUmJiJObyBkYXRhIGF2YWlsYWJsZSBpbiB0YWJsZSI9PT1uLnNFbXB0eVRhYmxlJiZGKHQsdCwic1plcm9SZWNvcmRzIiwic0VtcHR5VGFibGUiKSwhdC5zTG9hZGluZ1JlY29yZHMmJmUmJiJMb2FkaW5nLi4uIj09PW4uc0xvYWRpbmdSZWNvcmRzJiZGKHQsdCwic1plcm9SZWNvcmRzIiwic0xvYWRpbmdSZWNvcmRzIiksdC5zSW5mb1Rob3VzYW5kcyYmKHQuc1Rob3VzYW5kcz10LnNJbmZvVGhvdXNhbmRzKSxlPXQuc0RlY2ltYWwpJiZhIT09ZSYmTWUoZSl9QXJyYXkuaXNBcnJheXx8KEFycmF5LmlzQXJyYXk9ZnVuY3Rpb24odCl7cmV0dXJuIltvYmplY3QgQXJyYXldIj09PU9iamVjdC5wcm90b3R5cGUudG9TdHJpbmcuY2FsbCh0KX0pLEFycmF5LnByb3RvdHlwZS5pbmNsdWRlc3x8KEFycmF5LnByb3RvdHlwZS5pbmNsdWRlcz1zKSxTdHJpbmcucHJvdG90eXBlLnRyaW18fChTdHJpbmcucHJvdG90eXBlLnRyaW09ZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5yZXBsYWNlKC9eW1xzXHVGRUZGXHhBMF0rfFtcc1x1RkVGRlx4QTBdKyQvZywiIil9KSxTdHJpbmcucHJvdG90eXBlLmluY2x1ZGVzfHwoU3RyaW5nLnByb3RvdHlwZS5pbmNsdWRlcz1zKSx3LnV0aWw9e3Rocm90dGxlOmZ1bmN0aW9uKGEsdCl7dmFyIHIsbyxpPXQhPT1OP3Q6MjAwO3JldHVybiBmdW5jdGlvbigpe3ZhciB0PXRoaXMsZT0rbmV3IERhdGUsbj1hcmd1bWVudHM7ciYmZTxyK2k/KGNsZWFyVGltZW91dChvKSxvPXNldFRpbWVvdXQoZnVuY3Rpb24oKXtyPU4sYS5hcHBseSh0LG4pfSxpKSk6KHI9ZSxhLmFwcGx5KHQsbikpfX0sZXNjYXBlUmVnZXg6ZnVuY3Rpb24odCl7cmV0dXJuIHQucmVwbGFjZShKLCJcXCQxIil9LHNldDpmdW5jdGlvbihhKXt2YXIgZDtyZXR1cm4gUC5pc1BsYWluT2JqZWN0KGEpP3cudXRpbC5zZXQoYS5fKTpudWxsPT09YT9mdW5jdGlvbigpe306ImZ1bmN0aW9uIj09dHlwZW9mIGE/ZnVuY3Rpb24odCxlLG4pe2EodCwic2V0IixlLG4pfToic3RyaW5nIiE9dHlwZW9mIGF8fC0xPT09YS5pbmRleE9mKCIuIikmJi0xPT09YS5pbmRleE9mKCJbIikmJi0xPT09YS5pbmRleE9mKCIoIik/ZnVuY3Rpb24odCxlKXt0W2FdPWV9OihkPWZ1bmN0aW9uKHQsZSxuKXtmb3IodmFyIGEscixvLGksbD1kdChuKSxuPWxbbC5sZW5ndGgtMV0scz0wLHU9bC5sZW5ndGgtMTtzPHU7cysrKXtpZigiX19wcm90b19fIj09PWxbc118fCJjb25zdHJ1Y3RvciI9PT1sW3NdKXRocm93IG5ldyBFcnJvcigiQ2Fubm90IHNldCBwcm90b3R5cGUgdmFsdWVzIik7aWYoYT1sW3NdLm1hdGNoKGZ0KSxyPWxbc10ubWF0Y2goZyksYSl7aWYobFtzXT1sW3NdLnJlcGxhY2UoZnQsIiIpLHRbbFtzXV09W10sKGE9bC5zbGljZSgpKS5zcGxpY2UoMCxzKzEpLGk9YS5qb2luKCIuIiksQXJyYXkuaXNBcnJheShlKSlmb3IodmFyIGM9MCxmPWUubGVuZ3RoO2M8ZjtjKyspZChvPXt9LGVbY10saSksdFtsW3NdXS5wdXNoKG8pO2Vsc2UgdFtsW3NdXT1lO3JldHVybn1yJiYobFtzXT1sW3NdLnJlcGxhY2UoZywiIiksdD10W2xbc11dKGUpKSxudWxsIT09dFtsW3NdXSYmdFtsW3NdXSE9PU58fCh0W2xbc11dPXt9KSx0PXRbbFtzXV19bi5tYXRjaChnKT90W24ucmVwbGFjZShnLCIiKV0oZSk6dFtuLnJlcGxhY2UoZnQsIiIpXT1lfSxmdW5jdGlvbih0LGUpe3JldHVybiBkKHQsZSxhKX0pfSxnZXQ6ZnVuY3Rpb24ocil7dmFyIG8sZDtyZXR1cm4gUC5pc1BsYWluT2JqZWN0KHIpPyhvPXt9LFAuZWFjaChyLGZ1bmN0aW9uKHQsZSl7ZSYmKG9bdF09dy51dGlsLmdldChlKSl9KSxmdW5jdGlvbih0LGUsbixhKXt2YXIgcj1vW2VdfHxvLl87cmV0dXJuIHIhPT1OP3IodCxlLG4sYSk6dH0pOm51bGw9PT1yP2Z1bmN0aW9uKHQpe3JldHVybiB0fToiZnVuY3Rpb24iPT10eXBlb2Ygcj9mdW5jdGlvbih0LGUsbixhKXtyZXR1cm4gcih0LGUsbixhKX06InN0cmluZyIhPXR5cGVvZiByfHwtMT09PXIuaW5kZXhPZigiLiIpJiYtMT09PXIuaW5kZXhPZigiWyIpJiYtMT09PXIuaW5kZXhPZigiKCIpP2Z1bmN0aW9uKHQsZSl7cmV0dXJuIHRbcl19OihkPWZ1bmN0aW9uKHQsZSxuKXt2YXIgYSxyLG87aWYoIiIhPT1uKWZvcih2YXIgaT1kdChuKSxsPTAscz1pLmxlbmd0aDtsPHM7bCsrKXtpZihmPWlbbF0ubWF0Y2goZnQpLGE9aVtsXS5tYXRjaChnKSxmKXtpZihpW2xdPWlbbF0ucmVwbGFjZShmdCwiIiksIiIhPT1pW2xdJiYodD10W2lbbF1dKSxyPVtdLGkuc3BsaWNlKDAsbCsxKSxvPWkuam9pbigiLiIpLEFycmF5LmlzQXJyYXkodCkpZm9yKHZhciB1PTAsYz10Lmxlbmd0aDt1PGM7dSsrKXIucHVzaChkKHRbdV0sZSxvKSk7dmFyIGY9ZlswXS5zdWJzdHJpbmcoMSxmWzBdLmxlbmd0aC0xKTt0PSIiPT09Zj9yOnIuam9pbihmKTticmVha31pZihhKWlbbF09aVtsXS5yZXBsYWNlKGcsIiIpLHQ9dFtpW2xdXSgpO2Vsc2V7aWYobnVsbD09PXR8fHRbaVtsXV09PT1OKXJldHVybiBOO3Q9dFtpW2xdXX19cmV0dXJuIHR9LGZ1bmN0aW9uKHQsZSl7cmV0dXJuIGQodCxlLHIpfSl9fTt2YXIgcj1mdW5jdGlvbih0LGUsbil7dFtlXSE9PU4mJih0W25dPXRbZV0pfTtmdW5jdGlvbiBLKHQpe3IodCwib3JkZXJpbmciLCJiU29ydCIpLHIodCwib3JkZXJNdWx0aSIsImJTb3J0TXVsdGkiKSxyKHQsIm9yZGVyQ2xhc3NlcyIsImJTb3J0Q2xhc3NlcyIpLHIodCwib3JkZXJDZWxsc1RvcCIsImJTb3J0Q2VsbHNUb3AiKSxyKHQsIm9yZGVyIiwiYWFTb3J0aW5nIikscih0LCJvcmRlckZpeGVkIiwiYWFTb3J0aW5nRml4ZWQiKSxyKHQsInBhZ2luZyIsImJQYWdpbmF0ZSIpLHIodCwicGFnaW5nVHlwZSIsInNQYWdpbmF0aW9uVHlwZSIpLHIodCwicGFnZUxlbmd0aCIsImlEaXNwbGF5TGVuZ3RoIikscih0LCJzZWFyY2hpbmciLCJiRmlsdGVyIiksImJvb2xlYW4iPT10eXBlb2YgdC5zU2Nyb2xsWCYmKHQuc1Njcm9sbFg9dC5zU2Nyb2xsWD8iMTAwJSI6IiIpLCJib29sZWFuIj09dHlwZW9mIHQuc2Nyb2xsWCYmKHQuc2Nyb2xsWD10LnNjcm9sbFg/IjEwMCUiOiIiKTt2YXIgZT10LmFvU2VhcmNoQ29scztpZihlKWZvcih2YXIgbj0wLGE9ZS5sZW5ndGg7bjxhO24rKyllW25dJiZDKHcubW9kZWxzLm9TZWFyY2gsZVtuXSl9ZnVuY3Rpb24gUSh0KXtyKHQsIm9yZGVyYWJsZSIsImJTb3J0YWJsZSIpLHIodCwib3JkZXJEYXRhIiwiYURhdGFTb3J0Iikscih0LCJvcmRlclNlcXVlbmNlIiwiYXNTb3J0aW5nIikscih0LCJvcmRlckRhdGFUeXBlIiwic29ydERhdGFUeXBlIik7dmFyIGU9dC5hRGF0YVNvcnQ7Im51bWJlciIhPXR5cGVvZiBlfHxBcnJheS5pc0FycmF5KGUpfHwodC5hRGF0YVNvcnQ9W2VdKX1mdW5jdGlvbiB0dCh0KXt2YXIgZSxuLGEscjt3Ll9fYnJvd3Nlcnx8KHcuX19icm93c2VyPWU9e30scj0oYT0obj1QKCI8ZGl2Lz4iKS5jc3Moe3Bvc2l0aW9uOiJmaXhlZCIsdG9wOjAsbGVmdDotMSpQKGopLnNjcm9sbExlZnQoKSxoZWlnaHQ6MSx3aWR0aDoxLG92ZXJmbG93OiJoaWRkZW4ifSkuYXBwZW5kKFAoIjxkaXYvPiIpLmNzcyh7cG9zaXRpb246ImFic29sdXRlIix0b3A6MSxsZWZ0OjEsd2lkdGg6MTAwLG92ZXJmbG93OiJzY3JvbGwifSkuYXBwZW5kKFAoIjxkaXYvPiIpLmNzcyh7d2lkdGg6IjEwMCUiLGhlaWdodDoxMH0pKSkuYXBwZW5kVG8oImJvZHkiKSkuY2hpbGRyZW4oKSkuY2hpbGRyZW4oKSxlLmJhcldpZHRoPWFbMF0ub2Zmc2V0V2lkdGgtYVswXS5jbGllbnRXaWR0aCxlLmJTY3JvbGxPdmVyc2l6ZT0xMDA9PT1yWzBdLm9mZnNldFdpZHRoJiYxMDAhPT1hWzBdLmNsaWVudFdpZHRoLGUuYlNjcm9sbGJhckxlZnQ9MSE9PU1hdGgucm91bmQoci5vZmZzZXQoKS5sZWZ0KSxlLmJCb3VuZGluZz0hIW5bMF0uZ2V0Qm91bmRpbmdDbGllbnRSZWN0KCkud2lkdGgsbi5yZW1vdmUoKSksUC5leHRlbmQodC5vQnJvd3Nlcix3Ll9fYnJvd3NlciksdC5vU2Nyb2xsLmlCYXJXaWR0aD13Ll9fYnJvd3Nlci5iYXJXaWR0aH1mdW5jdGlvbiBldCh0LGUsbixhLHIsbyl7dmFyIGksbD1hLHM9ITE7Zm9yKG4hPT1OJiYoaT1uLHM9ITApO2whPT1yOyl0Lmhhc093blByb3BlcnR5KGwpJiYoaT1zP2UoaSx0W2xdLGwsdCk6dFtsXSxzPSEwLGwrPW8pO3JldHVybiBpfWZ1bmN0aW9uIG50KHQsZSl7dmFyIG49dy5kZWZhdWx0cy5jb2x1bW4sYT10LmFvQ29sdW1ucy5sZW5ndGgsbj1QLmV4dGVuZCh7fSx3Lm1vZGVscy5vQ29sdW1uLG4se25UaDplfHx5LmNyZWF0ZUVsZW1lbnQoInRoIiksc1RpdGxlOm4uc1RpdGxlfHwoZT9lLmlubmVySFRNTDoiIiksYURhdGFTb3J0Om4uYURhdGFTb3J0fHxbYV0sbURhdGE6bi5tRGF0YXx8YSxpZHg6YX0pLG49KHQuYW9Db2x1bW5zLnB1c2gobiksdC5hb1ByZVNlYXJjaENvbHMpO25bYV09UC5leHRlbmQoe30sdy5tb2RlbHMub1NlYXJjaCxuW2FdKSxhdCh0LGEsUChlKS5kYXRhKCkpfWZ1bmN0aW9uIGF0KHQsZSxuKXtmdW5jdGlvbiBhKHQpe3JldHVybiJzdHJpbmciPT10eXBlb2YgdCYmLTEhPT10LmluZGV4T2YoIkAiKX12YXIgZT10LmFvQ29sdW1uc1tlXSxyPXQub0NsYXNzZXMsbz1QKGUublRoKSxpPSghZS5zV2lkdGhPcmlnJiYoZS5zV2lkdGhPcmlnPW8uYXR0cigid2lkdGgiKXx8bnVsbCx1PShvLmF0dHIoInN0eWxlIil8fCIiKS5tYXRjaCgvd2lkdGg6XHMqKFxkK1tweGVtJV0rKS8pKSYmKGUuc1dpZHRoT3JpZz11WzFdKSxuIT09TiYmbnVsbCE9PW4mJihRKG4pLEMody5kZWZhdWx0cy5jb2x1bW4sbiwhMCksbi5tRGF0YVByb3A9PT1OfHxuLm1EYXRhfHwobi5tRGF0YT1uLm1EYXRhUHJvcCksbi5zVHlwZSYmKGUuX3NNYW51YWxUeXBlPW4uc1R5cGUpLG4uY2xhc3NOYW1lJiYhbi5zQ2xhc3MmJihuLnNDbGFzcz1uLmNsYXNzTmFtZSksbi5zQ2xhc3MmJm8uYWRkQ2xhc3Mobi5zQ2xhc3MpLHU9ZS5zQ2xhc3MsUC5leHRlbmQoZSxuKSxGKGUsbiwic1dpZHRoIiwic1dpZHRoT3JpZyIpLHUhPT1lLnNDbGFzcyYmKGUuc0NsYXNzPXUrIiAiK2Uuc0NsYXNzKSxuLmlEYXRhU29ydCE9PU4mJihlLmFEYXRhU29ydD1bbi5pRGF0YVNvcnRdKSxGKGUsbiwiYURhdGFTb3J0IikpLGUubURhdGEpLGw9QShpKSxzPWUubVJlbmRlcj9BKGUubVJlbmRlcik6bnVsbCx1PShlLl9iQXR0clNyYz1QLmlzUGxhaW5PYmplY3QoaSkmJihhKGkuc29ydCl8fGEoaS50eXBlKXx8YShpLmZpbHRlcikpLGUuX3NldHRlcj1udWxsLGUuZm5HZXREYXRhPWZ1bmN0aW9uKHQsZSxuKXt2YXIgYT1sKHQsZSxOLG4pO3JldHVybiBzJiZlP3MoYSxlLHQsbik6YX0sZS5mblNldERhdGE9ZnVuY3Rpb24odCxlLG4pe3JldHVybiBiKGkpKHQsZSxuKX0sIm51bWJlciI9PXR5cGVvZiBpfHxlLl9pc0FycmF5SG9zdHx8KHQuX3Jvd1JlYWRPYmplY3Q9ITApLHQub0ZlYXR1cmVzLmJTb3J0fHwoZS5iU29ydGFibGU9ITEsby5hZGRDbGFzcyhyLnNTb3J0YWJsZU5vbmUpKSwtMSE9PVAuaW5BcnJheSgiYXNjIixlLmFzU29ydGluZykpLG49LTEhPT1QLmluQXJyYXkoImRlc2MiLGUuYXNTb3J0aW5nKTtlLmJTb3J0YWJsZSYmKHV8fG4pP3UmJiFuPyhlLnNTb3J0aW5nQ2xhc3M9ci5zU29ydGFibGVBc2MsZS5zU29ydGluZ0NsYXNzSlVJPXIuc1NvcnRKVUlBc2NBbGxvd2VkKTohdSYmbj8oZS5zU29ydGluZ0NsYXNzPXIuc1NvcnRhYmxlRGVzYyxlLnNTb3J0aW5nQ2xhc3NKVUk9ci5zU29ydEpVSURlc2NBbGxvd2VkKTooZS5zU29ydGluZ0NsYXNzPXIuc1NvcnRhYmxlLGUuc1NvcnRpbmdDbGFzc0pVST1yLnNTb3J0SlVJKTooZS5zU29ydGluZ0NsYXNzPXIuc1NvcnRhYmxlTm9uZSxlLnNTb3J0aW5nQ2xhc3NKVUk9IiIpfWZ1bmN0aW9uIE8odCl7aWYoITEhPT10Lm9GZWF0dXJlcy5iQXV0b1dpZHRoKXt2YXIgZT10LmFvQ29sdW1ucztlZSh0KTtmb3IodmFyIG49MCxhPWUubGVuZ3RoO248YTtuKyspZVtuXS5uVGguc3R5bGUud2lkdGg9ZVtuXS5zV2lkdGh9dmFyIHI9dC5vU2Nyb2xsOyIiPT09ci5zWSYmIiI9PT1yLnNYfHxRdCh0KSxSKHQsbnVsbCwiY29sdW1uLXNpemluZyIsW3RdKX1mdW5jdGlvbiBydCh0LGUpe3Q9aXQodCwiYlZpc2libGUiKTtyZXR1cm4ibnVtYmVyIj09dHlwZW9mIHRbZV0/dFtlXTpudWxsfWZ1bmN0aW9uIG90KHQsZSl7dD1pdCh0LCJiVmlzaWJsZSIpLGU9UC5pbkFycmF5KGUsdCk7cmV0dXJuLTEhPT1lP2U6bnVsbH1mdW5jdGlvbiBUKHQpe3ZhciBuPTA7cmV0dXJuIFAuZWFjaCh0LmFvQ29sdW1ucyxmdW5jdGlvbih0LGUpe2UuYlZpc2libGUmJiJub25lIiE9PVAoZS5uVGgpLmNzcygiZGlzcGxheSIpJiZuKyt9KSxufWZ1bmN0aW9uIGl0KHQsbil7dmFyIGE9W107cmV0dXJuIFAubWFwKHQuYW9Db2x1bW5zLGZ1bmN0aW9uKHQsZSl7dFtuXSYmYS5wdXNoKGUpfSksYX1mdW5jdGlvbiBsdCh0KXtmb3IodmFyIGUsbixhLHIsbyxpLGwscz10LmFvQ29sdW1ucyx1PXQuYW9EYXRhLGM9dy5leHQudHlwZS5kZXRlY3QsZj0wLGQ9cy5sZW5ndGg7ZjxkO2YrKylpZihsPVtdLCEobz1zW2ZdKS5zVHlwZSYmby5fc01hbnVhbFR5cGUpby5zVHlwZT1vLl9zTWFudWFsVHlwZTtlbHNlIGlmKCFvLnNUeXBlKXtmb3IoZT0wLG49Yy5sZW5ndGg7ZTxuO2UrKyl7Zm9yKGE9MCxyPXUubGVuZ3RoO2E8ciYmKGxbYV09PT1OJiYobFthXT1TKHQsYSxmLCJ0eXBlIikpLChpPWNbZV0obFthXSx0KSl8fGU9PT1jLmxlbmd0aC0xKSYmKCJodG1sIiE9PWl8fGgobFthXSkpO2ErKyk7aWYoaSl7by5zVHlwZT1pO2JyZWFrfX1vLnNUeXBlfHwoby5zVHlwZT0ic3RyaW5nIil9fWZ1bmN0aW9uIHN0KHQsZSxuLGEpe3ZhciByLG8saSxsLHM9dC5hb0NvbHVtbnM7aWYoZSlmb3Iocj1lLmxlbmd0aC0xOzA8PXI7ci0tKWZvcih2YXIgdSxjPSh1PWVbcl0pLnRhcmdldCE9PU4/dS50YXJnZXQ6dS50YXJnZXRzIT09Tj91LnRhcmdldHM6dS5hVGFyZ2V0cyxmPTAsZD0oYz1BcnJheS5pc0FycmF5KGMpP2M6W2NdKS5sZW5ndGg7ZjxkO2YrKylpZigibnVtYmVyIj09dHlwZW9mIGNbZl0mJjA8PWNbZl0pe2Zvcig7cy5sZW5ndGg8PWNbZl07KW50KHQpO2EoY1tmXSx1KX1lbHNlIGlmKCJudW1iZXIiPT10eXBlb2YgY1tmXSYmY1tmXTwwKWEocy5sZW5ndGgrY1tmXSx1KTtlbHNlIGlmKCJzdHJpbmciPT10eXBlb2YgY1tmXSlmb3IoaT0wLGw9cy5sZW5ndGg7aTxsO2krKykiX2FsbCIhPWNbZl0mJiFQKHNbaV0ublRoKS5oYXNDbGFzcyhjW2ZdKXx8YShpLHUpO2lmKG4pZm9yKHI9MCxvPW4ubGVuZ3RoO3I8bztyKyspYShyLG5bcl0pfWZ1bmN0aW9uIHgodCxlLG4sYSl7Zm9yKHZhciByPXQuYW9EYXRhLmxlbmd0aCxvPVAuZXh0ZW5kKCEwLHt9LHcubW9kZWxzLm9Sb3cse3NyYzpuPyJkb20iOiJkYXRhIixpZHg6cn0pLGk9KG8uX2FEYXRhPWUsdC5hb0RhdGEucHVzaChvKSx0LmFvQ29sdW1ucyksbD0wLHM9aS5sZW5ndGg7bDxzO2wrKylpW2xdLnNUeXBlPW51bGw7dC5haURpc3BsYXlNYXN0ZXIucHVzaChyKTtlPXQucm93SWRGbihlKTtyZXR1cm4gZSE9PU4mJih0LmFJZHNbZV09byksIW4mJnQub0ZlYXR1cmVzLmJEZWZlclJlbmRlcnx8U3QodCxyLG4sYSkscn1mdW5jdGlvbiB1dChuLHQpe3ZhciBhO3JldHVybih0PXQgaW5zdGFuY2VvZiBQP3Q6UCh0KSkubWFwKGZ1bmN0aW9uKHQsZSl7cmV0dXJuIGE9bXQobixlKSx4KG4sYS5kYXRhLGUsYS5jZWxscyl9KX1mdW5jdGlvbiBTKHQsZSxuLGEpeyJzZWFyY2giPT09YT9hPSJmaWx0ZXIiOiJvcmRlciI9PT1hJiYoYT0ic29ydCIpO3ZhciByPXQuaURyYXcsbz10LmFvQ29sdW1uc1tuXSxpPXQuYW9EYXRhW2VdLl9hRGF0YSxsPW8uc0RlZmF1bHRDb250ZW50LHM9by5mbkdldERhdGEoaSxhLHtzZXR0aW5nczp0LHJvdzplLGNvbDpufSk7aWYocz09PU4pcmV0dXJuIHQuaURyYXdFcnJvciE9ciYmbnVsbD09PWwmJihXKHQsMCwiUmVxdWVzdGVkIHVua25vd24gcGFyYW1ldGVyICIrKCJmdW5jdGlvbiI9PXR5cGVvZiBvLm1EYXRhPyJ7ZnVuY3Rpb259IjoiJyIrby5tRGF0YSsiJyIpKyIgZm9yIHJvdyAiK2UrIiwgY29sdW1uICIrbiw0KSx0LmlEcmF3RXJyb3I9ciksbDtpZihzIT09aSYmbnVsbCE9PXN8fG51bGw9PT1sfHxhPT09Til7aWYoImZ1bmN0aW9uIj09dHlwZW9mIHMpcmV0dXJuIHMuY2FsbChpKX1lbHNlIHM9bDtyZXR1cm4gbnVsbD09PXMmJiJkaXNwbGF5Ij09PWE/IiI6ImZpbHRlciI9PT1hJiYoZT13LmV4dC50eXBlLnNlYXJjaClbby5zVHlwZV0/ZVtvLnNUeXBlXShzKTpzfWZ1bmN0aW9uIGN0KHQsZSxuLGEpe3ZhciByPXQuYW9Db2x1bW5zW25dLG89dC5hb0RhdGFbZV0uX2FEYXRhO3IuZm5TZXREYXRhKG8sYSx7c2V0dGluZ3M6dCxyb3c6ZSxjb2w6bn0pfXZhciBmdD0vXFsuKj9cXSQvLGc9L1woXCkkLztmdW5jdGlvbiBkdCh0KXtyZXR1cm4gUC5tYXAodC5tYXRjaCgvKFxcLnxbXlwuXSkrL2cpfHxbIiJdLGZ1bmN0aW9uKHQpe3JldHVybiB0LnJlcGxhY2UoL1xcXC4vZywiLiIpfSl9dmFyIEE9dy51dGlsLmdldCxiPXcudXRpbC5zZXQ7ZnVuY3Rpb24gaHQodCl7cmV0dXJuIEgodC5hb0RhdGEsIl9hRGF0YSIpfWZ1bmN0aW9uIHB0KHQpe3QuYW9EYXRhLmxlbmd0aD0wLHQuYWlEaXNwbGF5TWFzdGVyLmxlbmd0aD0wLHQuYWlEaXNwbGF5Lmxlbmd0aD0wLHQuYUlkcz17fX1mdW5jdGlvbiBndCh0LGUsbil7Zm9yKHZhciBhPS0xLHI9MCxvPXQubGVuZ3RoO3I8bztyKyspdFtyXT09ZT9hPXI6dFtyXT5lJiZ0W3JdLS07LTEhPWEmJm49PT1OJiZ0LnNwbGljZShhLDEpfWZ1bmN0aW9uIGJ0KG4sYSx0LGUpe2Z1bmN0aW9uIHIodCxlKXtmb3IoO3QuY2hpbGROb2Rlcy5sZW5ndGg7KXQucmVtb3ZlQ2hpbGQodC5maXJzdENoaWxkKTt0LmlubmVySFRNTD1TKG4sYSxlLCJkaXNwbGF5Iil9dmFyIG8saSxsPW4uYW9EYXRhW2FdO2lmKCJkb20iIT09dCYmKHQmJiJhdXRvIiE9PXR8fCJkb20iIT09bC5zcmMpKXt2YXIgcz1sLmFuQ2VsbHM7aWYocylpZihlIT09TilyKHNbZV0sZSk7ZWxzZSBmb3Iobz0wLGk9cy5sZW5ndGg7bzxpO28rKylyKHNbb10sbyl9ZWxzZSBsLl9hRGF0YT1tdChuLGwsZSxlPT09Tj9OOmwuX2FEYXRhKS5kYXRhO2wuX2FTb3J0RGF0YT1udWxsLGwuX2FGaWx0ZXJEYXRhPW51bGw7dmFyIHU9bi5hb0NvbHVtbnM7aWYoZSE9PU4pdVtlXS5zVHlwZT1udWxsO2Vsc2V7Zm9yKG89MCxpPXUubGVuZ3RoO288aTtvKyspdVtvXS5zVHlwZT1udWxsO3Z0KG4sbCl9fWZ1bmN0aW9uIG10KHQsZSxuLGEpe2Z1bmN0aW9uIHIodCxlKXt2YXIgbjsic3RyaW5nIj09dHlwZW9mIHQmJi0xIT09KG49dC5pbmRleE9mKCJAIikpJiYobj10LnN1YnN0cmluZyhuKzEpLGIodCkoYSxlLmdldEF0dHJpYnV0ZShuKSkpfWZ1bmN0aW9uIG8odCl7biE9PU4mJm4hPT1mfHwobD1kW2ZdLHM9dC5pbm5lckhUTUwudHJpbSgpLGwmJmwuX2JBdHRyU3JjPyhiKGwubURhdGEuXykoYSxzKSxyKGwubURhdGEuc29ydCx0KSxyKGwubURhdGEudHlwZSx0KSxyKGwubURhdGEuZmlsdGVyLHQpKTpoPyhsLl9zZXR0ZXJ8fChsLl9zZXR0ZXI9YihsLm1EYXRhKSksbC5fc2V0dGVyKGEscykpOmFbZl09cyksZisrfXZhciBpLGwscyx1PVtdLGM9ZS5maXJzdENoaWxkLGY9MCxkPXQuYW9Db2x1bW5zLGg9dC5fcm93UmVhZE9iamVjdDthPWEhPT1OP2E6aD97fTpbXTtpZihjKWZvcig7YzspIlREIiE9KGk9Yy5ub2RlTmFtZS50b1VwcGVyQ2FzZSgpKSYmIlRIIiE9aXx8KG8oYyksdS5wdXNoKGMpKSxjPWMubmV4dFNpYmxpbmc7ZWxzZSBmb3IodmFyIHA9MCxnPSh1PWUuYW5DZWxscykubGVuZ3RoO3A8ZztwKyspbyh1W3BdKTt2YXIgZT1lLmZpcnN0Q2hpbGQ/ZTplLm5UcjtyZXR1cm4gZSYmKGU9ZS5nZXRBdHRyaWJ1dGUoImlkIikpJiZiKHQucm93SWQpKGEsZSkse2RhdGE6YSxjZWxsczp1fX1mdW5jdGlvbiBTdCh0LGUsbixhKXt2YXIgcixvLGksbCxzLHUsYz10LmFvRGF0YVtlXSxmPWMuX2FEYXRhLGQ9W107aWYobnVsbD09PWMublRyKXtmb3Iocj1ufHx5LmNyZWF0ZUVsZW1lbnQoInRyIiksYy5uVHI9cixjLmFuQ2VsbHM9ZCxyLl9EVF9Sb3dJbmRleD1lLHZ0KHQsYyksbD0wLHM9dC5hb0NvbHVtbnMubGVuZ3RoO2w8cztsKyspaT10LmFvQ29sdW1uc1tsXSwobz0odT0hbik/eS5jcmVhdGVFbGVtZW50KGkuc0NlbGxUeXBlKTphW2xdKXx8Vyh0LDAsIkluY29ycmVjdCBjb2x1bW4gY291bnQiLDE4KSxvLl9EVF9DZWxsSW5kZXg9e3JvdzplLGNvbHVtbjpsfSxkLnB1c2gobyksIXUmJighaS5tUmVuZGVyJiZpLm1EYXRhPT09bHx8UC5pc1BsYWluT2JqZWN0KGkubURhdGEpJiZpLm1EYXRhLl89PT1sKyIuZGlzcGxheSIpfHwoby5pbm5lckhUTUw9Uyh0LGUsbCwiZGlzcGxheSIpKSxpLnNDbGFzcyYmKG8uY2xhc3NOYW1lKz0iICIraS5zQ2xhc3MpLGkuYlZpc2libGUmJiFuP3IuYXBwZW5kQ2hpbGQobyk6IWkuYlZpc2libGUmJm4mJm8ucGFyZW50Tm9kZS5yZW1vdmVDaGlsZChvKSxpLmZuQ3JlYXRlZENlbGwmJmkuZm5DcmVhdGVkQ2VsbC5jYWxsKHQub0luc3RhbmNlLG8sUyh0LGUsbCksZixlLGwpO1IodCwiYW9Sb3dDcmVhdGVkQ2FsbGJhY2siLG51bGwsW3IsZixlLGRdKX19ZnVuY3Rpb24gdnQodCxlKXt2YXIgbj1lLm5UcixhPWUuX2FEYXRhO24mJigodD10LnJvd0lkRm4oYSkpJiYobi5pZD10KSxhLkRUX1Jvd0NsYXNzJiYodD1hLkRUX1Jvd0NsYXNzLnNwbGl0KCIgIiksZS5fX3Jvd2M9ZS5fX3Jvd2M/eihlLl9fcm93Yy5jb25jYXQodCkpOnQsUChuKS5yZW1vdmVDbGFzcyhlLl9fcm93Yy5qb2luKCIgIikpLmFkZENsYXNzKGEuRFRfUm93Q2xhc3MpKSxhLkRUX1Jvd0F0dHImJlAobikuYXR0cihhLkRUX1Jvd0F0dHIpLGEuRFRfUm93RGF0YSkmJlAobikuZGF0YShhLkRUX1Jvd0RhdGEpfWZ1bmN0aW9uIHl0KHQpe3ZhciBlLG4sYSxyPXQublRIZWFkLG89dC5uVEZvb3QsaT0wPT09UCgidGgsIHRkIixyKS5sZW5ndGgsbD10Lm9DbGFzc2VzLHM9dC5hb0NvbHVtbnM7Zm9yKGkmJihuPVAoIjx0ci8+IikuYXBwZW5kVG8ocikpLGM9MCxmPXMubGVuZ3RoO2M8ZjtjKyspYT1zW2NdLGU9UChhLm5UaCkuYWRkQ2xhc3MoYS5zQ2xhc3MpLGkmJmUuYXBwZW5kVG8obiksdC5vRmVhdHVyZXMuYlNvcnQmJihlLmFkZENsYXNzKGEuc1NvcnRpbmdDbGFzcyksITEhPT1hLmJTb3J0YWJsZSkmJihlLmF0dHIoInRhYmluZGV4Iix0LmlUYWJJbmRleCkuYXR0cigiYXJpYS1jb250cm9scyIsdC5zVGFibGVJZCksdWUodCxhLm5UaCxjKSksYS5zVGl0bGUhPWVbMF0uaW5uZXJIVE1MJiZlLmh0bWwoYS5zVGl0bGUpLHZlKHQsImhlYWRlciIpKHQsZSxhLGwpO2lmKGkmJnd0KHQuYW9IZWFkZXIsciksUChyKS5jaGlsZHJlbigidHIiKS5jaGlsZHJlbigidGgsIHRkIikuYWRkQ2xhc3MobC5zSGVhZGVyVEgpLFAobykuY2hpbGRyZW4oInRyIikuY2hpbGRyZW4oInRoLCB0ZCIpLmFkZENsYXNzKGwuc0Zvb3RlclRIKSxudWxsIT09bylmb3IodmFyIHU9dC5hb0Zvb3RlclswXSxjPTAsZj11Lmxlbmd0aDtjPGY7YysrKShhPXNbY10pPyhhLm5UZj11W2NdLmNlbGwsYS5zQ2xhc3MmJlAoYS5uVGYpLmFkZENsYXNzKGEuc0NsYXNzKSk6Vyh0LDAsIkluY29ycmVjdCBjb2x1bW4gY291bnQiLDE4KX1mdW5jdGlvbiBEdCh0LGUsbil7dmFyIGEscixvLGksbCxzLHUsYyxmLGQ9W10saD1bXSxwPXQuYW9Db2x1bW5zLmxlbmd0aDtpZihlKXtmb3Iobj09PU4mJihuPSExKSxhPTAscj1lLmxlbmd0aDthPHI7YSsrKXtmb3IoZFthXT1lW2FdLnNsaWNlKCksZFthXS5uVHI9ZVthXS5uVHIsbz1wLTE7MDw9bztvLS0pdC5hb0NvbHVtbnNbb10uYlZpc2libGV8fG58fGRbYV0uc3BsaWNlKG8sMSk7aC5wdXNoKFtdKX1mb3IoYT0wLHI9ZC5sZW5ndGg7YTxyO2ErKyl7aWYodT1kW2FdLm5Ucilmb3IoO3M9dS5maXJzdENoaWxkOyl1LnJlbW92ZUNoaWxkKHMpO2ZvcihvPTAsaT1kW2FdLmxlbmd0aDtvPGk7bysrKWlmKGY9Yz0xLGhbYV1bb109PT1OKXtmb3IodS5hcHBlbmRDaGlsZChkW2FdW29dLmNlbGwpLGhbYV1bb109MTtkW2ErY10hPT1OJiZkW2FdW29dLmNlbGw9PWRbYStjXVtvXS5jZWxsOyloW2ErY11bb109MSxjKys7Zm9yKDtkW2FdW28rZl0hPT1OJiZkW2FdW29dLmNlbGw9PWRbYV1bbytmXS5jZWxsOyl7Zm9yKGw9MDtsPGM7bCsrKWhbYStsXVtvK2ZdPTE7ZisrfVAoZFthXVtvXS5jZWxsKS5hdHRyKCJyb3dzcGFuIixjKS5hdHRyKCJjb2xzcGFuIixmKX19fX1mdW5jdGlvbiB2KHQsZSl7bj0ic3NwIj09RShzPXQpLChsPXMuaUluaXREaXNwbGF5U3RhcnQpIT09TiYmLTEhPT1sJiYocy5faURpc3BsYXlTdGFydD0hbiYmbD49cy5mblJlY29yZHNEaXNwbGF5KCk/MDpsLHMuaUluaXREaXNwbGF5U3RhcnQ9LTEpO3ZhciBuPVIodCwiYW9QcmVEcmF3Q2FsbGJhY2siLCJwcmVEcmF3IixbdF0pO2lmKC0xIT09UC5pbkFycmF5KCExLG4pKUQodCwhMSk7ZWxzZXt2YXIgYT1bXSxyPTAsbz10LmFzU3RyaXBlQ2xhc3NlcyxpPW8ubGVuZ3RoLGw9dC5vTGFuZ3VhZ2Uscz0ic3NwIj09RSh0KSx1PXQuYWlEaXNwbGF5LG49dC5faURpc3BsYXlTdGFydCxjPXQuZm5EaXNwbGF5RW5kKCk7aWYodC5iRHJhd2luZz0hMCx0LmJEZWZlckxvYWRpbmcpdC5iRGVmZXJMb2FkaW5nPSExLHQuaURyYXcrKyxEKHQsITEpO2Vsc2UgaWYocyl7aWYoIXQuYkRlc3Ryb3lpbmcmJiFlKXJldHVybiB2b2lkIHh0KHQpfWVsc2UgdC5pRHJhdysrO2lmKDAhPT11Lmxlbmd0aClmb3IodmFyIGY9cz90LmFvRGF0YS5sZW5ndGg6YyxkPXM/MDpuO2Q8ZjtkKyspe3ZhciBoLHA9dVtkXSxnPXQuYW9EYXRhW3BdLGI9KG51bGw9PT1nLm5UciYmU3QodCxwKSxnLm5Ucik7MCE9PWkmJihoPW9bciVpXSxnLl9zUm93U3RyaXBlIT1oKSYmKFAoYikucmVtb3ZlQ2xhc3MoZy5fc1Jvd1N0cmlwZSkuYWRkQ2xhc3MoaCksZy5fc1Jvd1N0cmlwZT1oKSxSKHQsImFvUm93Q2FsbGJhY2siLG51bGwsW2IsZy5fYURhdGEscixkLHBdKSxhLnB1c2goYikscisrfWVsc2V7ZT1sLnNaZXJvUmVjb3JkczsxPT10LmlEcmF3JiYiYWpheCI9PUUodCk/ZT1sLnNMb2FkaW5nUmVjb3JkczpsLnNFbXB0eVRhYmxlJiYwPT09dC5mblJlY29yZHNUb3RhbCgpJiYoZT1sLnNFbXB0eVRhYmxlKSxhWzBdPVAoIjx0ci8+Iix7Y2xhc3M6aT9vWzBdOiIifSkuYXBwZW5kKFAoIjx0ZCAvPiIse3ZhbGlnbjoidG9wIixjb2xTcGFuOlQodCksY2xhc3M6dC5vQ2xhc3Nlcy5zUm93RW1wdHl9KS5odG1sKGUpKVswXX1SKHQsImFvSGVhZGVyQ2FsbGJhY2siLCJoZWFkZXIiLFtQKHQublRIZWFkKS5jaGlsZHJlbigidHIiKVswXSxodCh0KSxuLGMsdV0pLFIodCwiYW9Gb290ZXJDYWxsYmFjayIsImZvb3RlciIsW1AodC5uVEZvb3QpLmNoaWxkcmVuKCJ0ciIpWzBdLGh0KHQpLG4sYyx1XSk7cz1QKHQublRCb2R5KTtzLmNoaWxkcmVuKCkuZGV0YWNoKCkscy5hcHBlbmQoUChhKSksUih0LCJhb0RyYXdDYWxsYmFjayIsImRyYXciLFt0XSksdC5iU29ydGVkPSExLHQuYkZpbHRlcmVkPSExLHQuYkRyYXdpbmc9ITF9fWZ1bmN0aW9uIHUodCxlKXt2YXIgbj10Lm9GZWF0dXJlcyxhPW4uYlNvcnQsbj1uLmJGaWx0ZXI7YSYmaWUodCksbj9SdCh0LHQub1ByZXZpb3VzU2VhcmNoKTp0LmFpRGlzcGxheT10LmFpRGlzcGxheU1hc3Rlci5zbGljZSgpLCEwIT09ZSYmKHQuX2lEaXNwbGF5U3RhcnQ9MCksdC5fZHJhd0hvbGQ9ZSx2KHQpLHQuX2RyYXdIb2xkPSExfWZ1bmN0aW9uIF90KHQpe2Zvcih2YXIgZSxuLGEscixvLGksbCxzPXQub0NsYXNzZXMsdT1QKHQublRhYmxlKSx1PVAoIjxkaXYvPiIpLmluc2VydEJlZm9yZSh1KSxjPXQub0ZlYXR1cmVzLGY9UCgiPGRpdi8+Iix7aWQ6dC5zVGFibGVJZCsiX3dyYXBwZXIiLGNsYXNzOnMuc1dyYXBwZXIrKHQublRGb290PyIiOiIgIitzLnNOb0Zvb3Rlcil9KSxkPSh0Lm5Ib2xkaW5nPXVbMF0sdC5uVGFibGVXcmFwcGVyPWZbMF0sdC5uVGFibGVSZWluc2VydEJlZm9yZT10Lm5UYWJsZS5uZXh0U2libGluZyx0LnNEb20uc3BsaXQoIiIpKSxoPTA7aDxkLmxlbmd0aDtoKyspe2lmKGU9bnVsbCwiPCI9PShuPWRbaF0pKXtpZihhPVAoIjxkaXYvPiIpWzBdLCInIj09KHI9ZFtoKzFdKXx8JyInPT1yKXtmb3Iobz0iIixpPTI7ZFtoK2ldIT1yOylvKz1kW2graV0saSsrOyJIIj09bz9vPXMuc0pVSUhlYWRlcjoiRiI9PW8mJihvPXMuc0pVSUZvb3RlciksLTEhPW8uaW5kZXhPZigiLiIpPyhsPW8uc3BsaXQoIi4iKSxhLmlkPWxbMF0uc3Vic3RyKDEsbFswXS5sZW5ndGgtMSksYS5jbGFzc05hbWU9bFsxXSk6IiMiPT1vLmNoYXJBdCgwKT9hLmlkPW8uc3Vic3RyKDEsby5sZW5ndGgtMSk6YS5jbGFzc05hbWU9byxoKz1pfWYuYXBwZW5kKGEpLGY9UChhKX1lbHNlIGlmKCI+Ij09bilmPWYucGFyZW50KCk7ZWxzZSBpZigibCI9PW4mJmMuYlBhZ2luYXRlJiZjLmJMZW5ndGhDaGFuZ2UpZT0kdCh0KTtlbHNlIGlmKCJmIj09biYmYy5iRmlsdGVyKWU9THQodCk7ZWxzZSBpZigiciI9PW4mJmMuYlByb2Nlc3NpbmcpZT1adCh0KTtlbHNlIGlmKCJ0Ij09billPUt0KHQpO2Vsc2UgaWYoImkiPT1uJiZjLmJJbmZvKWU9VXQodCk7ZWxzZSBpZigicCI9PW4mJmMuYlBhZ2luYXRlKWU9enQodCk7ZWxzZSBpZigwIT09dy5leHQuZmVhdHVyZS5sZW5ndGgpZm9yKHZhciBwPXcuZXh0LmZlYXR1cmUsZz0wLGI9cC5sZW5ndGg7ZzxiO2crKylpZihuPT1wW2ddLmNGZWF0dXJlKXtlPXBbZ10uZm5Jbml0KHQpO2JyZWFrfWUmJigobD10LmFhbkZlYXR1cmVzKVtuXXx8KGxbbl09W10pLGxbbl0ucHVzaChlKSxmLmFwcGVuZChlKSl9dS5yZXBsYWNlV2l0aChmKSx0Lm5Ib2xkaW5nPW51bGx9ZnVuY3Rpb24gd3QodCxlKXt2YXIgbixhLHIsbyxpLGwscyx1LGMsZixkPVAoZSkuY2hpbGRyZW4oInRyIik7Zm9yKHQuc3BsaWNlKDAsdC5sZW5ndGgpLHI9MCxsPWQubGVuZ3RoO3I8bDtyKyspdC5wdXNoKFtdKTtmb3Iocj0wLGw9ZC5sZW5ndGg7cjxsO3IrKylmb3IoYT0obj1kW3JdKS5maXJzdENoaWxkO2E7KXtpZigiVEQiPT1hLm5vZGVOYW1lLnRvVXBwZXJDYXNlKCl8fCJUSCI9PWEubm9kZU5hbWUudG9VcHBlckNhc2UoKSlmb3IodT0odT0rYS5nZXRBdHRyaWJ1dGUoImNvbHNwYW4iKSkmJjAhPXUmJjEhPXU/dToxLGM9KGM9K2EuZ2V0QXR0cmlidXRlKCJyb3dzcGFuIikpJiYwIT1jJiYxIT1jP2M6MSxzPWZ1bmN0aW9uKHQsZSxuKXtmb3IodmFyIGE9dFtlXTthW25dOyluKys7cmV0dXJuIG59KHQsciwwKSxmPTE9PXUsaT0wO2k8dTtpKyspZm9yKG89MDtvPGM7bysrKXRbcitvXVtzK2ldPXtjZWxsOmEsdW5pcXVlOmZ9LHRbcitvXS5uVHI9bjthPWEubmV4dFNpYmxpbmd9fWZ1bmN0aW9uIEN0KHQsZSxuKXt2YXIgYT1bXTtufHwobj10LmFvSGVhZGVyLGUmJnd0KG49W10sZSkpO2Zvcih2YXIgcj0wLG89bi5sZW5ndGg7cjxvO3IrKylmb3IodmFyIGk9MCxsPW5bcl0ubGVuZ3RoO2k8bDtpKyspIW5bcl1baV0udW5pcXVlfHxhW2ldJiZ0LmJTb3J0Q2VsbHNUb3B8fChhW2ldPW5bcl1baV0uY2VsbCk7cmV0dXJuIGF9ZnVuY3Rpb24gVHQocix0LG4pe2Z1bmN0aW9uIGUodCl7dmFyIGU9ci5qcVhIUj9yLmpxWEhSLnN0YXR1czpudWxsOyhudWxsPT09dHx8Im51bWJlciI9PXR5cGVvZiBlJiYyMDQ9PWUpJiZGdChyLHQ9e30sW10pLChlPXQuZXJyb3J8fHQuc0Vycm9yKSYmVyhyLDAsZSksci5qc29uPXQsUihyLG51bGwsInhociIsW3IsdCxyLmpxWEhSXSksbih0KX1SKHIsImFvU2VydmVyUGFyYW1zIiwic2VydmVyUGFyYW1zIixbdF0pLHQmJkFycmF5LmlzQXJyYXkodCkmJihhPXt9LG89LyguKj8pXFtcXSQvLFAuZWFjaCh0LGZ1bmN0aW9uKHQsZSl7dmFyIG49ZS5uYW1lLm1hdGNoKG8pO24/KG49blswXSxhW25dfHwoYVtuXT1bXSksYVtuXS5wdXNoKGUudmFsdWUpKTphW2UubmFtZV09ZS52YWx1ZX0pLHQ9YSk7dmFyIGEsbyxpLGw9ci5hamF4LHM9ci5vSW5zdGFuY2UsdT0oUC5pc1BsYWluT2JqZWN0KGwpJiZsLmRhdGEmJih1PSJmdW5jdGlvbiI9PXR5cGVvZihpPWwuZGF0YSk/aSh0LHIpOmksdD0iZnVuY3Rpb24iPT10eXBlb2YgaSYmdT91OlAuZXh0ZW5kKCEwLHQsdSksZGVsZXRlIGwuZGF0YSkse2RhdGE6dCxzdWNjZXNzOmUsZGF0YVR5cGU6Impzb24iLGNhY2hlOiExLHR5cGU6ci5zU2VydmVyTWV0aG9kLGVycm9yOmZ1bmN0aW9uKHQsZSxuKXt2YXIgYT1SKHIsbnVsbCwieGhyIixbcixudWxsLHIuanFYSFJdKTstMT09PVAuaW5BcnJheSghMCxhKSYmKCJwYXJzZXJlcnJvciI9PWU/VyhyLDAsIkludmFsaWQgSlNPTiByZXNwb25zZSIsMSk6ND09PXQucmVhZHlTdGF0ZSYmVyhyLDAsIkFqYXggZXJyb3IiLDcpKSxEKHIsITEpfX0pO3Iub0FqYXhEYXRhPXQsUihyLG51bGwsInByZVhociIsW3IsdF0pLHIuZm5TZXJ2ZXJEYXRhP3IuZm5TZXJ2ZXJEYXRhLmNhbGwocyxyLnNBamF4U291cmNlLFAubWFwKHQsZnVuY3Rpb24odCxlKXtyZXR1cm57bmFtZTplLHZhbHVlOnR9fSksZSxyKTpyLnNBamF4U291cmNlfHwic3RyaW5nIj09dHlwZW9mIGw/ci5qcVhIUj1QLmFqYXgoUC5leHRlbmQodSx7dXJsOmx8fHIuc0FqYXhTb3VyY2V9KSk6ImZ1bmN0aW9uIj09dHlwZW9mIGw/ci5qcVhIUj1sLmNhbGwocyx0LGUscik6KHIuanFYSFI9UC5hamF4KFAuZXh0ZW5kKHUsbCkpLGwuZGF0YT1pKX1mdW5jdGlvbiB4dChlKXtlLmlEcmF3KyssRChlLCEwKSxUdChlLEF0KGUpLGZ1bmN0aW9uKHQpe0l0KGUsdCl9KX1mdW5jdGlvbiBBdCh0KXtmb3IodmFyIGUsbixhLHI9dC5hb0NvbHVtbnMsbz1yLmxlbmd0aCxpPXQub0ZlYXR1cmVzLGw9dC5vUHJldmlvdXNTZWFyY2gscz10LmFvUHJlU2VhcmNoQ29scyx1PVtdLGM9SSh0KSxmPXQuX2lEaXNwbGF5U3RhcnQsZD0hMSE9PWkuYlBhZ2luYXRlP3QuX2lEaXNwbGF5TGVuZ3RoOi0xLGg9ZnVuY3Rpb24odCxlKXt1LnB1c2goe25hbWU6dCx2YWx1ZTplfSl9LHA9KGgoInNFY2hvIix0LmlEcmF3KSxoKCJpQ29sdW1ucyIsbyksaCgic0NvbHVtbnMiLEgociwic05hbWUiKS5qb2luKCIsIikpLGgoImlEaXNwbGF5U3RhcnQiLGYpLGgoImlEaXNwbGF5TGVuZ3RoIixkKSx7ZHJhdzp0LmlEcmF3LGNvbHVtbnM6W10sb3JkZXI6W10sc3RhcnQ6ZixsZW5ndGg6ZCxzZWFyY2g6e3ZhbHVlOmwuc1NlYXJjaCxyZWdleDpsLmJSZWdleH19KSxnPTA7ZzxvO2crKyluPXJbZ10sYT1zW2ddLGU9ImZ1bmN0aW9uIj09dHlwZW9mIG4ubURhdGE/ImZ1bmN0aW9uIjpuLm1EYXRhLHAuY29sdW1ucy5wdXNoKHtkYXRhOmUsbmFtZTpuLnNOYW1lLHNlYXJjaGFibGU6bi5iU2VhcmNoYWJsZSxvcmRlcmFibGU6bi5iU29ydGFibGUsc2VhcmNoOnt2YWx1ZTphLnNTZWFyY2gscmVnZXg6YS5iUmVnZXh9fSksaCgibURhdGFQcm9wXyIrZyxlKSxpLmJGaWx0ZXImJihoKCJzU2VhcmNoXyIrZyxhLnNTZWFyY2gpLGgoImJSZWdleF8iK2csYS5iUmVnZXgpLGgoImJTZWFyY2hhYmxlXyIrZyxuLmJTZWFyY2hhYmxlKSksaS5iU29ydCYmaCgiYlNvcnRhYmxlXyIrZyxuLmJTb3J0YWJsZSk7aS5iRmlsdGVyJiYoaCgic1NlYXJjaCIsbC5zU2VhcmNoKSxoKCJiUmVnZXgiLGwuYlJlZ2V4KSksaS5iU29ydCYmKFAuZWFjaChjLGZ1bmN0aW9uKHQsZSl7cC5vcmRlci5wdXNoKHtjb2x1bW46ZS5jb2wsZGlyOmUuZGlyfSksaCgiaVNvcnRDb2xfIit0LGUuY29sKSxoKCJzU29ydERpcl8iK3QsZS5kaXIpfSksaCgiaVNvcnRpbmdDb2xzIixjLmxlbmd0aCkpO2Y9dy5leHQubGVnYWN5LmFqYXg7cmV0dXJuIG51bGw9PT1mP3Quc0FqYXhTb3VyY2U/dTpwOmY/dTpwfWZ1bmN0aW9uIEl0KHQsbil7ZnVuY3Rpb24gZSh0LGUpe3JldHVybiBuW3RdIT09Tj9uW3RdOm5bZV19dmFyIGE9RnQodCxuKSxyPWUoInNFY2hvIiwiZHJhdyIpLG89ZSgiaVRvdGFsUmVjb3JkcyIsInJlY29yZHNUb3RhbCIpLGk9ZSgiaVRvdGFsRGlzcGxheVJlY29yZHMiLCJyZWNvcmRzRmlsdGVyZWQiKTtpZihyIT09Til7aWYoK3I8dC5pRHJhdylyZXR1cm47dC5pRHJhdz0rcn1hPWF8fFtdLHB0KHQpLHQuX2lSZWNvcmRzVG90YWw9cGFyc2VJbnQobywxMCksdC5faVJlY29yZHNEaXNwbGF5PXBhcnNlSW50KGksMTApO2Zvcih2YXIgbD0wLHM9YS5sZW5ndGg7bDxzO2wrKyl4KHQsYVtsXSk7dC5haURpc3BsYXk9dC5haURpc3BsYXlNYXN0ZXIuc2xpY2UoKSx2KHQsITApLHQuX2JJbml0Q29tcGxldGV8fHF0KHQsbiksRCh0LCExKX1mdW5jdGlvbiBGdCh0LGUsbil7dD1QLmlzUGxhaW5PYmplY3QodC5hamF4KSYmdC5hamF4LmRhdGFTcmMhPT1OP3QuYWpheC5kYXRhU3JjOnQuc0FqYXhEYXRhUHJvcDtpZighbilyZXR1cm4iZGF0YSI9PT10P2UuYWFEYXRhfHxlW3RdOiIiIT09dD9BKHQpKGUpOmU7Yih0KShlLG4pfWZ1bmN0aW9uIEx0KG4pe2Z1bmN0aW9uIGUodCl7aS5mO3ZhciBlPXRoaXMudmFsdWV8fCIiO28ucmV0dXJuJiYiRW50ZXIiIT09dC5rZXl8fGUhPW8uc1NlYXJjaCYmKFJ0KG4se3NTZWFyY2g6ZSxiUmVnZXg6by5iUmVnZXgsYlNtYXJ0Om8uYlNtYXJ0LGJDYXNlSW5zZW5zaXRpdmU6by5iQ2FzZUluc2Vuc2l0aXZlLHJldHVybjpvLnJldHVybn0pLG4uX2lEaXNwbGF5U3RhcnQ9MCx2KG4pKX12YXIgdD1uLm9DbGFzc2VzLGE9bi5zVGFibGVJZCxyPW4ub0xhbmd1YWdlLG89bi5vUHJldmlvdXNTZWFyY2gsaT1uLmFhbkZlYXR1cmVzLGw9JzxpbnB1dCB0eXBlPSJzZWFyY2giIGNsYXNzPSInK3Quc0ZpbHRlcklucHV0KyciLz4nLHM9KHM9ci5zU2VhcmNoKS5tYXRjaCgvX0lOUFVUXy8pP3MucmVwbGFjZSgiX0lOUFVUXyIsbCk6cytsLGw9UCgiPGRpdi8+Iix7aWQ6aS5mP251bGw6YSsiX2ZpbHRlciIsY2xhc3M6dC5zRmlsdGVyfSkuYXBwZW5kKFAoIjxsYWJlbC8+IikuYXBwZW5kKHMpKSx0PW51bGwhPT1uLnNlYXJjaERlbGF5P24uc2VhcmNoRGVsYXk6InNzcCI9PT1FKG4pPzQwMDowLHU9UCgiaW5wdXQiLGwpLnZhbChvLnNTZWFyY2gpLmF0dHIoInBsYWNlaG9sZGVyIixyLnNTZWFyY2hQbGFjZWhvbGRlcikub24oImtleXVwLkRUIHNlYXJjaC5EVCBpbnB1dC5EVCBwYXN0ZS5EVCBjdXQuRFQiLHQ/bmUoZSx0KTplKS5vbigibW91c2V1cCIsZnVuY3Rpb24odCl7c2V0VGltZW91dChmdW5jdGlvbigpe2UuY2FsbCh1WzBdLHQpfSwxMCl9KS5vbigia2V5cHJlc3MuRFQiLGZ1bmN0aW9uKHQpe2lmKDEzPT10LmtleUNvZGUpcmV0dXJuITF9KS5hdHRyKCJhcmlhLWNvbnRyb2xzIixhKTtyZXR1cm4gUChuLm5UYWJsZSkub24oInNlYXJjaC5kdC5EVCIsZnVuY3Rpb24odCxlKXtpZihuPT09ZSl0cnl7dVswXSE9PXkuYWN0aXZlRWxlbWVudCYmdS52YWwoby5zU2VhcmNoKX1jYXRjaCh0KXt9fSksbFswXX1mdW5jdGlvbiBSdCh0LGUsbil7ZnVuY3Rpb24gYSh0KXtvLnNTZWFyY2g9dC5zU2VhcmNoLG8uYlJlZ2V4PXQuYlJlZ2V4LG8uYlNtYXJ0PXQuYlNtYXJ0LG8uYkNhc2VJbnNlbnNpdGl2ZT10LmJDYXNlSW5zZW5zaXRpdmUsby5yZXR1cm49dC5yZXR1cm59ZnVuY3Rpb24gcih0KXtyZXR1cm4gdC5iRXNjYXBlUmVnZXghPT1OPyF0LmJFc2NhcGVSZWdleDp0LmJSZWdleH12YXIgbz10Lm9QcmV2aW91c1NlYXJjaCxpPXQuYW9QcmVTZWFyY2hDb2xzO2lmKGx0KHQpLCJzc3AiIT1FKHQpKXtOdCh0LGUuc1NlYXJjaCxuLHIoZSksZS5iU21hcnQsZS5iQ2FzZUluc2Vuc2l0aXZlLGUucmV0dXJuKSxhKGUpO2Zvcih2YXIgbD0wO2w8aS5sZW5ndGg7bCsrKWp0KHQsaVtsXS5zU2VhcmNoLGwscihpW2xdKSxpW2xdLmJTbWFydCxpW2xdLmJDYXNlSW5zZW5zaXRpdmUpO1B0KHQpfWVsc2UgYShlKTt0LmJGaWx0ZXJlZD0hMCxSKHQsbnVsbCwic2VhcmNoIixbdF0pfWZ1bmN0aW9uIFB0KHQpe2Zvcih2YXIgZSxuLGE9dy5leHQuc2VhcmNoLHI9dC5haURpc3BsYXksbz0wLGk9YS5sZW5ndGg7bzxpO28rKyl7Zm9yKHZhciBsPVtdLHM9MCx1PXIubGVuZ3RoO3M8dTtzKyspbj1yW3NdLGU9dC5hb0RhdGFbbl0sYVtvXSh0LGUuX2FGaWx0ZXJEYXRhLG4sZS5fYURhdGEscykmJmwucHVzaChuKTtyLmxlbmd0aD0wLFAubWVyZ2UocixsKX19ZnVuY3Rpb24ganQodCxlLG4sYSxyLG8pe2lmKCIiIT09ZSl7Zm9yKHZhciBpLGw9W10scz10LmFpRGlzcGxheSx1PUh0KGUsYSxyLG8pLGM9MDtjPHMubGVuZ3RoO2MrKylpPXQuYW9EYXRhW3NbY11dLl9hRmlsdGVyRGF0YVtuXSx1LnRlc3QoaSkmJmwucHVzaChzW2NdKTt0LmFpRGlzcGxheT1sfX1mdW5jdGlvbiBOdCh0LGUsbixhLHIsbyl7dmFyIGksbCxzLHU9SHQoZSxhLHIsbykscj10Lm9QcmV2aW91c1NlYXJjaC5zU2VhcmNoLG89dC5haURpc3BsYXlNYXN0ZXIsYz1bXTtpZigwIT09dy5leHQuc2VhcmNoLmxlbmd0aCYmKG49ITApLGw9V3QodCksZS5sZW5ndGg8PTApdC5haURpc3BsYXk9by5zbGljZSgpO2Vsc2V7Zm9yKChsfHxufHxhfHxyLmxlbmd0aD5lLmxlbmd0aHx8MCE9PWUuaW5kZXhPZihyKXx8dC5iU29ydGVkKSYmKHQuYWlEaXNwbGF5PW8uc2xpY2UoKSksaT10LmFpRGlzcGxheSxzPTA7czxpLmxlbmd0aDtzKyspdS50ZXN0KHQuYW9EYXRhW2lbc11dLl9zRmlsdGVyUm93KSYmYy5wdXNoKGlbc10pO3QuYWlEaXNwbGF5PWN9fWZ1bmN0aW9uIEh0KHQsZSxuLGEpe3JldHVybiB0PWU/dDpPdCh0KSxuJiYodD0iXig/PS4qPyIrUC5tYXAodC5tYXRjaCgvIlteIl0rInxbXiBdKy9nKXx8WyIiXSxmdW5jdGlvbih0KXt2YXIgZTtyZXR1cm4odD0nIic9PT10LmNoYXJBdCgwKT8oZT10Lm1hdGNoKC9eIiguKikiJC8pKT9lWzFdOnQ6dCkucmVwbGFjZSgnIicsIiIpfSkuam9pbigiKSg/PS4qPyIpKyIpLiokIiksbmV3IFJlZ0V4cCh0LGE/ImkiOiIiKX12YXIgT3Q9dy51dGlsLmVzY2FwZVJlZ2V4LGt0PVAoIjxkaXY+IilbMF0sTXQ9a3QudGV4dENvbnRlbnQhPT1OO2Z1bmN0aW9uIFd0KHQpe2Zvcih2YXIgZSxuLGEscixvLGk9dC5hb0NvbHVtbnMsbD0hMSxzPTAsdT10LmFvRGF0YS5sZW5ndGg7czx1O3MrKylpZighKG89dC5hb0RhdGFbc10pLl9hRmlsdGVyRGF0YSl7Zm9yKGE9W10sZT0wLG49aS5sZW5ndGg7ZTxuO2UrKylpW2VdLmJTZWFyY2hhYmxlPyJzdHJpbmciIT10eXBlb2Yocj1udWxsPT09KHI9Uyh0LHMsZSwiZmlsdGVyIikpPyIiOnIpJiZyLnRvU3RyaW5nJiYocj1yLnRvU3RyaW5nKCkpOnI9IiIsci5pbmRleE9mJiYtMSE9PXIuaW5kZXhPZigiJiIpJiYoa3QuaW5uZXJIVE1MPXIscj1NdD9rdC50ZXh0Q29udGVudDprdC5pbm5lclRleHQpLHIucmVwbGFjZSYmKHI9ci5yZXBsYWNlKC9bXHJcblx1MjAyOF0vZywiIikpLGEucHVzaChyKTtvLl9hRmlsdGVyRGF0YT1hLG8uX3NGaWx0ZXJSb3c9YS5qb2luKCIgICIpLGw9ITB9cmV0dXJuIGx9ZnVuY3Rpb24gRXQodCl7cmV0dXJue3NlYXJjaDp0LnNTZWFyY2gsc21hcnQ6dC5iU21hcnQscmVnZXg6dC5iUmVnZXgsY2FzZUluc2Vuc2l0aXZlOnQuYkNhc2VJbnNlbnNpdGl2ZX19ZnVuY3Rpb24gQnQodCl7cmV0dXJue3NTZWFyY2g6dC5zZWFyY2gsYlNtYXJ0OnQuc21hcnQsYlJlZ2V4OnQucmVnZXgsYkNhc2VJbnNlbnNpdGl2ZTp0LmNhc2VJbnNlbnNpdGl2ZX19ZnVuY3Rpb24gVXQodCl7dmFyIGU9dC5zVGFibGVJZCxuPXQuYWFuRmVhdHVyZXMuaSxhPVAoIjxkaXYvPiIse2NsYXNzOnQub0NsYXNzZXMuc0luZm8saWQ6bj9udWxsOmUrIl9pbmZvIn0pO3JldHVybiBufHwodC5hb0RyYXdDYWxsYmFjay5wdXNoKHtmbjpWdCxzTmFtZToiaW5mb3JtYXRpb24ifSksYS5hdHRyKCJyb2xlIiwic3RhdHVzIikuYXR0cigiYXJpYS1saXZlIiwicG9saXRlIiksUCh0Lm5UYWJsZSkuYXR0cigiYXJpYS1kZXNjcmliZWRieSIsZSsiX2luZm8iKSksYVswXX1mdW5jdGlvbiBWdCh0KXt2YXIgZSxuLGEscixvLGksbD10LmFhbkZlYXR1cmVzLmk7MCE9PWwubGVuZ3RoJiYoaT10Lm9MYW5ndWFnZSxlPXQuX2lEaXNwbGF5U3RhcnQrMSxuPXQuZm5EaXNwbGF5RW5kKCksYT10LmZuUmVjb3Jkc1RvdGFsKCksbz0ocj10LmZuUmVjb3Jkc0Rpc3BsYXkoKSk/aS5zSW5mbzppLnNJbmZvRW1wdHksciE9PWEmJihvKz0iICIraS5zSW5mb0ZpbHRlcmVkKSxvPVh0KHQsbys9aS5zSW5mb1Bvc3RGaXgpLG51bGwhPT0oaT1pLmZuSW5mb0NhbGxiYWNrKSYmKG89aS5jYWxsKHQub0luc3RhbmNlLHQsZSxuLGEscixvKSksUChsKS5odG1sKG8pKX1mdW5jdGlvbiBYdCh0LGUpe3ZhciBuPXQuZm5Gb3JtYXROdW1iZXIsYT10Ll9pRGlzcGxheVN0YXJ0KzEscj10Ll9pRGlzcGxheUxlbmd0aCxvPXQuZm5SZWNvcmRzRGlzcGxheSgpLGk9LTE9PT1yO3JldHVybiBlLnJlcGxhY2UoL19TVEFSVF8vZyxuLmNhbGwodCxhKSkucmVwbGFjZSgvX0VORF8vZyxuLmNhbGwodCx0LmZuRGlzcGxheUVuZCgpKSkucmVwbGFjZSgvX01BWF8vZyxuLmNhbGwodCx0LmZuUmVjb3Jkc1RvdGFsKCkpKS5yZXBsYWNlKC9fVE9UQUxfL2csbi5jYWxsKHQsbykpLnJlcGxhY2UoL19QQUdFXy9nLG4uY2FsbCh0LGk/MTpNYXRoLmNlaWwoYS9yKSkpLnJlcGxhY2UoL19QQUdFU18vZyxuLmNhbGwodCxpPzE6TWF0aC5jZWlsKG8vcikpKX1mdW5jdGlvbiBKdChuKXt2YXIgYSx0LGUscj1uLmlJbml0RGlzcGxheVN0YXJ0LG89bi5hb0NvbHVtbnMsaT1uLm9GZWF0dXJlcyxsPW4uYkRlZmVyTG9hZGluZztpZihuLmJJbml0aWFsaXNlZCl7Zm9yKF90KG4pLHl0KG4pLER0KG4sbi5hb0hlYWRlciksRHQobixuLmFvRm9vdGVyKSxEKG4sITApLGkuYkF1dG9XaWR0aCYmZWUobiksYT0wLHQ9by5sZW5ndGg7YTx0O2ErKykoZT1vW2FdKS5zV2lkdGgmJihlLm5UaC5zdHlsZS53aWR0aD1NKGUuc1dpZHRoKSk7UihuLG51bGwsInByZUluaXQiLFtuXSksdShuKTtpPUUobik7InNzcCI9PWkmJiFsfHwoImFqYXgiPT1pP1R0KG4sW10sZnVuY3Rpb24odCl7dmFyIGU9RnQobix0KTtmb3IoYT0wO2E8ZS5sZW5ndGg7YSsrKXgobixlW2FdKTtuLmlJbml0RGlzcGxheVN0YXJ0PXIsdShuKSxEKG4sITEpLHF0KG4sdCl9KTooRChuLCExKSxxdChuKSkpfWVsc2Ugc2V0VGltZW91dChmdW5jdGlvbigpe0p0KG4pfSwyMDApfWZ1bmN0aW9uIHF0KHQsZSl7dC5fYkluaXRDb21wbGV0ZT0hMCwoZXx8dC5vSW5pdC5hYURhdGEpJiZPKHQpLFIodCxudWxsLCJwbHVnaW4taW5pdCIsW3QsZV0pLFIodCwiYW9Jbml0Q29tcGxldGUiLCJpbml0IixbdCxlXSl9ZnVuY3Rpb24gR3QodCxlKXtlPXBhcnNlSW50KGUsMTApO3QuX2lEaXNwbGF5TGVuZ3RoPWUsU2UodCksUih0LG51bGwsImxlbmd0aCIsW3QsZV0pfWZ1bmN0aW9uICR0KGEpe2Zvcih2YXIgdD1hLm9DbGFzc2VzLGU9YS5zVGFibGVJZCxuPWEuYUxlbmd0aE1lbnUscj1BcnJheS5pc0FycmF5KG5bMF0pLG89cj9uWzBdOm4saT1yP25bMV06bixsPVAoIjxzZWxlY3QvPiIse25hbWU6ZSsiX2xlbmd0aCIsImFyaWEtY29udHJvbHMiOmUsY2xhc3M6dC5zTGVuZ3RoU2VsZWN0fSkscz0wLHU9by5sZW5ndGg7czx1O3MrKylsWzBdW3NdPW5ldyBPcHRpb24oIm51bWJlciI9PXR5cGVvZiBpW3NdP2EuZm5Gb3JtYXROdW1iZXIoaVtzXSk6aVtzXSxvW3NdKTt2YXIgYz1QKCI8ZGl2PjxsYWJlbC8+PC9kaXY+IikuYWRkQ2xhc3ModC5zTGVuZ3RoKTtyZXR1cm4gYS5hYW5GZWF0dXJlcy5sfHwoY1swXS5pZD1lKyJfbGVuZ3RoIiksYy5jaGlsZHJlbigpLmFwcGVuZChhLm9MYW5ndWFnZS5zTGVuZ3RoTWVudS5yZXBsYWNlKCJfTUVOVV8iLGxbMF0ub3V0ZXJIVE1MKSksUCgic2VsZWN0IixjKS52YWwoYS5faURpc3BsYXlMZW5ndGgpLm9uKCJjaGFuZ2UuRFQiLGZ1bmN0aW9uKHQpe0d0KGEsUCh0aGlzKS52YWwoKSksdihhKX0pLFAoYS5uVGFibGUpLm9uKCJsZW5ndGguZHQuRFQiLGZ1bmN0aW9uKHQsZSxuKXthPT09ZSYmUCgic2VsZWN0IixjKS52YWwobil9KSxjWzBdfWZ1bmN0aW9uIHp0KHQpe2Z1bmN0aW9uIGModCl7dih0KX12YXIgZT10LnNQYWdpbmF0aW9uVHlwZSxmPXcuZXh0LnBhZ2VyW2VdLGQ9ImZ1bmN0aW9uIj09dHlwZW9mIGYsZT1QKCI8ZGl2Lz4iKS5hZGRDbGFzcyh0Lm9DbGFzc2VzLnNQYWdpbmcrZSlbMF0saD10LmFhbkZlYXR1cmVzO3JldHVybiBkfHxmLmZuSW5pdCh0LGUsYyksaC5wfHwoZS5pZD10LnNUYWJsZUlkKyJfcGFnaW5hdGUiLHQuYW9EcmF3Q2FsbGJhY2sucHVzaCh7Zm46ZnVuY3Rpb24odCl7aWYoZClmb3IodmFyIGU9dC5faURpc3BsYXlTdGFydCxuPXQuX2lEaXNwbGF5TGVuZ3RoLGE9dC5mblJlY29yZHNEaXNwbGF5KCkscj0tMT09PW4sbz1yPzA6TWF0aC5jZWlsKGUvbiksaT1yPzE6TWF0aC5jZWlsKGEvbiksbD1mKG8saSkscz0wLHU9aC5wLmxlbmd0aDtzPHU7cysrKXZlKHQsInBhZ2VCdXR0b24iKSh0LGgucFtzXSxzLGwsbyxpKTtlbHNlIGYuZm5VcGRhdGUodCxjKX0sc05hbWU6InBhZ2luYXRpb24ifSkpLGV9ZnVuY3Rpb24gWXQodCxlLG4pe3ZhciBhPXQuX2lEaXNwbGF5U3RhcnQscj10Ll9pRGlzcGxheUxlbmd0aCxvPXQuZm5SZWNvcmRzRGlzcGxheSgpLG89KDA9PT1vfHwtMT09PXI/YT0wOiJudW1iZXIiPT10eXBlb2YgZT9vPChhPWUqcikmJihhPTApOiJmaXJzdCI9PWU/YT0wOiJwcmV2aW91cyI9PWU/KGE9MDw9cj9hLXI6MCk8MCYmKGE9MCk6Im5leHQiPT1lP2ErcjxvJiYoYSs9cik6Imxhc3QiPT1lP2E9TWF0aC5mbG9vcigoby0xKS9yKSpyOlcodCwwLCJVbmtub3duIHBhZ2luZyBhY3Rpb246ICIrZSw1KSx0Ll9pRGlzcGxheVN0YXJ0IT09YSk7cmV0dXJuIHQuX2lEaXNwbGF5U3RhcnQ9YSxvPyhSKHQsbnVsbCwicGFnZSIsW3RdKSxuJiZ2KHQpKTpSKHQsbnVsbCwicGFnZS1uYyIsW3RdKSxvfWZ1bmN0aW9uIFp0KHQpe3JldHVybiBQKCI8ZGl2Lz4iLHtpZDp0LmFhbkZlYXR1cmVzLnI/bnVsbDp0LnNUYWJsZUlkKyJfcHJvY2Vzc2luZyIsY2xhc3M6dC5vQ2xhc3Nlcy5zUHJvY2Vzc2luZyxyb2xlOiJzdGF0dXMifSkuaHRtbCh0Lm9MYW5ndWFnZS5zUHJvY2Vzc2luZykuYXBwZW5kKCI8ZGl2PjxkaXY+PC9kaXY+PGRpdj48L2Rpdj48ZGl2PjwvZGl2PjxkaXY+PC9kaXY+PC9kaXY+IikuaW5zZXJ0QmVmb3JlKHQublRhYmxlKVswXX1mdW5jdGlvbiBEKHQsZSl7dC5vRmVhdHVyZXMuYlByb2Nlc3NpbmcmJlAodC5hYW5GZWF0dXJlcy5yKS5jc3MoImRpc3BsYXkiLGU/ImJsb2NrIjoibm9uZSIpLFIodCxudWxsLCJwcm9jZXNzaW5nIixbdCxlXSl9ZnVuY3Rpb24gS3QodCl7dmFyIGUsbixhLHIsbyxpLGwscyx1LGMsZixkLGg9UCh0Lm5UYWJsZSkscD10Lm9TY3JvbGw7cmV0dXJuIiI9PT1wLnNYJiYiIj09PXAuc1k/dC5uVGFibGU6KGU9cC5zWCxuPXAuc1ksYT10Lm9DbGFzc2VzLG89KHI9aC5jaGlsZHJlbigiY2FwdGlvbiIpKS5sZW5ndGg/clswXS5fY2FwdGlvblNpZGU6bnVsbCxzPVAoaFswXS5jbG9uZU5vZGUoITEpKSxpPVAoaFswXS5jbG9uZU5vZGUoITEpKSx1PWZ1bmN0aW9uKHQpe3JldHVybiB0P00odCk6bnVsbH0sKGw9aC5jaGlsZHJlbigidGZvb3QiKSkubGVuZ3RofHwobD1udWxsKSxzPVAoZj0iPGRpdi8+Iix7Y2xhc3M6YS5zU2Nyb2xsV3JhcHBlcn0pLmFwcGVuZChQKGYse2NsYXNzOmEuc1Njcm9sbEhlYWR9KS5jc3Moe292ZXJmbG93OiJoaWRkZW4iLHBvc2l0aW9uOiJyZWxhdGl2ZSIsYm9yZGVyOjAsd2lkdGg6ZT91KGUpOiIxMDAlIn0pLmFwcGVuZChQKGYse2NsYXNzOmEuc1Njcm9sbEhlYWRJbm5lcn0pLmNzcyh7ImJveC1zaXppbmciOiJjb250ZW50LWJveCIsd2lkdGg6cC5zWElubmVyfHwiMTAwJSJ9KS5hcHBlbmQocy5yZW1vdmVBdHRyKCJpZCIpLmNzcygibWFyZ2luLWxlZnQiLDApLmFwcGVuZCgidG9wIj09PW8/cjpudWxsKS5hcHBlbmQoaC5jaGlsZHJlbigidGhlYWQiKSkpKSkuYXBwZW5kKFAoZix7Y2xhc3M6YS5zU2Nyb2xsQm9keX0pLmNzcyh7cG9zaXRpb246InJlbGF0aXZlIixvdmVyZmxvdzoiYXV0byIsd2lkdGg6dShlKX0pLmFwcGVuZChoKSksbCYmcy5hcHBlbmQoUChmLHtjbGFzczphLnNTY3JvbGxGb290fSkuY3NzKHtvdmVyZmxvdzoiaGlkZGVuIixib3JkZXI6MCx3aWR0aDplP3UoZSk6IjEwMCUifSkuYXBwZW5kKFAoZix7Y2xhc3M6YS5zU2Nyb2xsRm9vdElubmVyfSkuYXBwZW5kKGkucmVtb3ZlQXR0cigiaWQiKS5jc3MoIm1hcmdpbi1sZWZ0IiwwKS5hcHBlbmQoImJvdHRvbSI9PT1vP3I6bnVsbCkuYXBwZW5kKGguY2hpbGRyZW4oInRmb290IikpKSkpLHU9cy5jaGlsZHJlbigpLGM9dVswXSxmPXVbMV0sZD1sP3VbMl06bnVsbCxlJiZQKGYpLm9uKCJzY3JvbGwuRFQiLGZ1bmN0aW9uKHQpe3ZhciBlPXRoaXMuc2Nyb2xsTGVmdDtjLnNjcm9sbExlZnQ9ZSxsJiYoZC5zY3JvbGxMZWZ0PWUpfSksUChmKS5jc3MoIm1heC1oZWlnaHQiLG4pLHAuYkNvbGxhcHNlfHxQKGYpLmNzcygiaGVpZ2h0IixuKSx0Lm5TY3JvbGxIZWFkPWMsdC5uU2Nyb2xsQm9keT1mLHQublNjcm9sbEZvb3Q9ZCx0LmFvRHJhd0NhbGxiYWNrLnB1c2goe2ZuOlF0LHNOYW1lOiJzY3JvbGxpbmcifSksc1swXSl9ZnVuY3Rpb24gUXQobil7ZnVuY3Rpb24gdCh0KXsodD10LnN0eWxlKS5wYWRkaW5nVG9wPSIwIix0LnBhZGRpbmdCb3R0b209IjAiLHQuYm9yZGVyVG9wV2lkdGg9IjAiLHQuYm9yZGVyQm90dG9tV2lkdGg9IjAiLHQuaGVpZ2h0PTB9dmFyIGUsYSxyLG8saSxsPW4ub1Njcm9sbCxzPWwuc1gsdT1sLnNYSW5uZXIsYz1sLnNZLGw9bC5pQmFyV2lkdGgsZj1QKG4ublNjcm9sbEhlYWQpLGQ9ZlswXS5zdHlsZSxoPWYuY2hpbGRyZW4oImRpdiIpLHA9aFswXS5zdHlsZSxoPWguY2hpbGRyZW4oInRhYmxlIiksZz1uLm5TY3JvbGxCb2R5LGI9UChnKSxtPWcuc3R5bGUsUz1QKG4ublNjcm9sbEZvb3QpLmNoaWxkcmVuKCJkaXYiKSx2PVMuY2hpbGRyZW4oInRhYmxlIikseT1QKG4ublRIZWFkKSxEPVAobi5uVGFibGUpLF89RFswXSx3PV8uc3R5bGUsQz1uLm5URm9vdD9QKG4ublRGb290KTpudWxsLFQ9bi5vQnJvd3Nlcix4PVQuYlNjcm9sbE92ZXJzaXplLEE9KEgobi5hb0NvbHVtbnMsIm5UaCIpLFtdKSxJPVtdLEY9W10sTD1bXSxSPWcuc2Nyb2xsSGVpZ2h0PmcuY2xpZW50SGVpZ2h0O24uc2Nyb2xsQmFyVmlzIT09UiYmbi5zY3JvbGxCYXJWaXMhPT1OPyhuLnNjcm9sbEJhclZpcz1SLE8obikpOihuLnNjcm9sbEJhclZpcz1SLEQuY2hpbGRyZW4oInRoZWFkLCB0Zm9vdCIpLnJlbW92ZSgpLEMmJihSPUMuY2xvbmUoKS5wcmVwZW5kVG8oRCksaT1DLmZpbmQoInRyIiksYT1SLmZpbmQoInRyIiksUi5maW5kKCJbaWRdIikucmVtb3ZlQXR0cigiaWQiKSksUj15LmNsb25lKCkucHJlcGVuZFRvKEQpLHk9eS5maW5kKCJ0ciIpLGU9Ui5maW5kKCJ0ciIpLFIuZmluZCgidGgsIHRkIikucmVtb3ZlQXR0cigidGFiaW5kZXgiKSxSLmZpbmQoIltpZF0iKS5yZW1vdmVBdHRyKCJpZCIpLHN8fChtLndpZHRoPSIxMDAlIixmWzBdLnN0eWxlLndpZHRoPSIxMDAlIiksUC5lYWNoKEN0KG4sUiksZnVuY3Rpb24odCxlKXtyPXJ0KG4sdCksZS5zdHlsZS53aWR0aD1uLmFvQ29sdW1uc1tyXS5zV2lkdGh9KSxDJiZrKGZ1bmN0aW9uKHQpe3Quc3R5bGUud2lkdGg9IiJ9LGEpLGY9RC5vdXRlcldpZHRoKCksIiI9PT1zPyh3LndpZHRoPSIxMDAlIix4JiYoRC5maW5kKCJ0Ym9keSIpLmhlaWdodCgpPmcub2Zmc2V0SGVpZ2h0fHwic2Nyb2xsIj09Yi5jc3MoIm92ZXJmbG93LXkiKSkmJih3LndpZHRoPU0oRC5vdXRlcldpZHRoKCktbCkpLGY9RC5vdXRlcldpZHRoKCkpOiIiIT09dSYmKHcud2lkdGg9TSh1KSxmPUQub3V0ZXJXaWR0aCgpKSxrKHQsZSksayhmdW5jdGlvbih0KXt2YXIgZT1qLmdldENvbXB1dGVkU3R5bGU/ai5nZXRDb21wdXRlZFN0eWxlKHQpLndpZHRoOk0oUCh0KS53aWR0aCgpKTtGLnB1c2godC5pbm5lckhUTUwpLEEucHVzaChlKX0sZSksayhmdW5jdGlvbih0LGUpe3Quc3R5bGUud2lkdGg9QVtlXX0seSksUChlKS5jc3MoImhlaWdodCIsMCksQyYmKGsodCxhKSxrKGZ1bmN0aW9uKHQpe0wucHVzaCh0LmlubmVySFRNTCksSS5wdXNoKE0oUCh0KS5jc3MoIndpZHRoIikpKX0sYSksayhmdW5jdGlvbih0LGUpe3Quc3R5bGUud2lkdGg9SVtlXX0saSksUChhKS5oZWlnaHQoMCkpLGsoZnVuY3Rpb24odCxlKXt0LmlubmVySFRNTD0nPGRpdiBjbGFzcz0iZGF0YVRhYmxlc19zaXppbmciPicrRltlXSsiPC9kaXY+Iix0LmNoaWxkTm9kZXNbMF0uc3R5bGUuaGVpZ2h0PSIwIix0LmNoaWxkTm9kZXNbMF0uc3R5bGUub3ZlcmZsb3c9ImhpZGRlbiIsdC5zdHlsZS53aWR0aD1BW2VdfSxlKSxDJiZrKGZ1bmN0aW9uKHQsZSl7dC5pbm5lckhUTUw9JzxkaXYgY2xhc3M9ImRhdGFUYWJsZXNfc2l6aW5nIj4nK0xbZV0rIjwvZGl2PiIsdC5jaGlsZE5vZGVzWzBdLnN0eWxlLmhlaWdodD0iMCIsdC5jaGlsZE5vZGVzWzBdLnN0eWxlLm92ZXJmbG93PSJoaWRkZW4iLHQuc3R5bGUud2lkdGg9SVtlXX0sYSksTWF0aC5yb3VuZChELm91dGVyV2lkdGgoKSk8TWF0aC5yb3VuZChmKT8obz1nLnNjcm9sbEhlaWdodD5nLm9mZnNldEhlaWdodHx8InNjcm9sbCI9PWIuY3NzKCJvdmVyZmxvdy15Iik/ZitsOmYseCYmKGcuc2Nyb2xsSGVpZ2h0Pmcub2Zmc2V0SGVpZ2h0fHwic2Nyb2xsIj09Yi5jc3MoIm92ZXJmbG93LXkiKSkmJih3LndpZHRoPU0oby1sKSksIiIhPT1zJiYiIj09PXV8fFcobiwxLCJQb3NzaWJsZSBjb2x1bW4gbWlzYWxpZ25tZW50Iiw2KSk6bz0iMTAwJSIsbS53aWR0aD1NKG8pLGQud2lkdGg9TShvKSxDJiYobi5uU2Nyb2xsRm9vdC5zdHlsZS53aWR0aD1NKG8pKSxjfHx4JiYobS5oZWlnaHQ9TShfLm9mZnNldEhlaWdodCtsKSksUj1ELm91dGVyV2lkdGgoKSxoWzBdLnN0eWxlLndpZHRoPU0oUikscC53aWR0aD1NKFIpLHk9RC5oZWlnaHQoKT5nLmNsaWVudEhlaWdodHx8InNjcm9sbCI9PWIuY3NzKCJvdmVyZmxvdy15IikscFtpPSJwYWRkaW5nIisoVC5iU2Nyb2xsYmFyTGVmdD8iTGVmdCI6IlJpZ2h0IildPXk/bCsicHgiOiIwcHgiLEMmJih2WzBdLnN0eWxlLndpZHRoPU0oUiksU1swXS5zdHlsZS53aWR0aD1NKFIpLFNbMF0uc3R5bGVbaV09eT9sKyJweCI6IjBweCIpLEQuY2hpbGRyZW4oImNvbGdyb3VwIikuaW5zZXJ0QmVmb3JlKEQuY2hpbGRyZW4oInRoZWFkIikpLGIudHJpZ2dlcigic2Nyb2xsIiksIW4uYlNvcnRlZCYmIW4uYkZpbHRlcmVkfHxuLl9kcmF3SG9sZHx8KGcuc2Nyb2xsVG9wPTApKX1mdW5jdGlvbiBrKHQsZSxuKXtmb3IodmFyIGEscixvPTAsaT0wLGw9ZS5sZW5ndGg7aTxsOyl7Zm9yKGE9ZVtpXS5maXJzdENoaWxkLHI9bj9uW2ldLmZpcnN0Q2hpbGQ6bnVsbDthOykxPT09YS5ub2RlVHlwZSYmKG4/dChhLHIsbyk6dChhLG8pLG8rKyksYT1hLm5leHRTaWJsaW5nLHI9bj9yLm5leHRTaWJsaW5nOm51bGw7aSsrfX12YXIgdGU9LzwuKj8+L2c7ZnVuY3Rpb24gZWUodCl7dmFyIGUsbixhPXQublRhYmxlLHI9dC5hb0NvbHVtbnMsbz10Lm9TY3JvbGwsaT1vLnNZLGw9by5zWCxvPW8uc1hJbm5lcixzPXIubGVuZ3RoLHU9aXQodCwiYlZpc2libGUiKSxjPVAoInRoIix0Lm5USGVhZCksZj1hLmdldEF0dHJpYnV0ZSgid2lkdGgiKSxkPWEucGFyZW50Tm9kZSxoPSExLHA9dC5vQnJvd3NlcixnPXAuYlNjcm9sbE92ZXJzaXplLGI9YS5zdHlsZS53aWR0aDtmb3IoYiYmLTEhPT1iLmluZGV4T2YoIiUiKSYmKGY9YiksRD0wO0Q8dS5sZW5ndGg7RCsrKW51bGwhPT0oZT1yW3VbRF1dKS5zV2lkdGgmJihlLnNXaWR0aD1hZShlLnNXaWR0aE9yaWcsZCksaD0hMCk7aWYoZ3x8IWgmJiFsJiYhaSYmcz09VCh0KSYmcz09Yy5sZW5ndGgpZm9yKEQ9MDtEPHM7RCsrKXt2YXIgbT1ydCh0LEQpO251bGwhPT1tJiYoclttXS5zV2lkdGg9TShjLmVxKEQpLndpZHRoKCkpKX1lbHNle3ZhciBiPVAoYSkuY2xvbmUoKS5jc3MoInZpc2liaWxpdHkiLCJoaWRkZW4iKS5yZW1vdmVBdHRyKCJpZCIpLFM9KGIuZmluZCgidGJvZHkgdHIiKS5yZW1vdmUoKSxQKCI8dHIvPiIpLmFwcGVuZFRvKGIuZmluZCgidGJvZHkiKSkpO2ZvcihiLmZpbmQoInRoZWFkLCB0Zm9vdCIpLnJlbW92ZSgpLGIuYXBwZW5kKFAodC5uVEhlYWQpLmNsb25lKCkpLmFwcGVuZChQKHQublRGb290KS5jbG9uZSgpKSxiLmZpbmQoInRmb290IHRoLCB0Zm9vdCB0ZCIpLmNzcygid2lkdGgiLCIiKSxjPUN0KHQsYi5maW5kKCJ0aGVhZCIpWzBdKSxEPTA7RDx1Lmxlbmd0aDtEKyspZT1yW3VbRF1dLGNbRF0uc3R5bGUud2lkdGg9bnVsbCE9PWUuc1dpZHRoT3JpZyYmIiIhPT1lLnNXaWR0aE9yaWc/TShlLnNXaWR0aE9yaWcpOiIiLGUuc1dpZHRoT3JpZyYmbCYmUChjW0RdKS5hcHBlbmQoUCgiPGRpdi8+IikuY3NzKHt3aWR0aDplLnNXaWR0aE9yaWcsbWFyZ2luOjAscGFkZGluZzowLGJvcmRlcjowLGhlaWdodDoxfSkpO2lmKHQuYW9EYXRhLmxlbmd0aClmb3IoRD0wO0Q8dS5sZW5ndGg7RCsrKWU9cltuPXVbRF1dLFAocmUodCxuKSkuY2xvbmUoITEpLmFwcGVuZChlLnNDb250ZW50UGFkZGluZykuYXBwZW5kVG8oUyk7UCgiW25hbWVdIixiKS5yZW1vdmVBdHRyKCJuYW1lIik7Zm9yKHZhciB2PVAoIjxkaXYvPiIpLmNzcyhsfHxpP3twb3NpdGlvbjoiYWJzb2x1dGUiLHRvcDowLGxlZnQ6MCxoZWlnaHQ6MSxyaWdodDowLG92ZXJmbG93OiJoaWRkZW4ifTp7fSkuYXBwZW5kKGIpLmFwcGVuZFRvKGQpLHk9KGwmJm8/Yi53aWR0aChvKTpsPyhiLmNzcygid2lkdGgiLCJhdXRvIiksYi5yZW1vdmVBdHRyKCJ3aWR0aCIpLGIud2lkdGgoKTxkLmNsaWVudFdpZHRoJiZmJiZiLndpZHRoKGQuY2xpZW50V2lkdGgpKTppP2Iud2lkdGgoZC5jbGllbnRXaWR0aCk6ZiYmYi53aWR0aChmKSwwKSxEPTA7RDx1Lmxlbmd0aDtEKyspe3ZhciBfPVAoY1tEXSksdz1fLm91dGVyV2lkdGgoKS1fLndpZHRoKCksXz1wLmJCb3VuZGluZz9NYXRoLmNlaWwoY1tEXS5nZXRCb3VuZGluZ0NsaWVudFJlY3QoKS53aWR0aCk6Xy5vdXRlcldpZHRoKCk7eSs9XyxyW3VbRF1dLnNXaWR0aD1NKF8tdyl9YS5zdHlsZS53aWR0aD1NKHkpLHYucmVtb3ZlKCl9ZiYmKGEuc3R5bGUud2lkdGg9TShmKSksIWYmJiFsfHx0Ll9yZXN6RXZ0fHwobz1mdW5jdGlvbigpe1Aoaikub24oInJlc2l6ZS5EVC0iK3Quc0luc3RhbmNlLG5lKGZ1bmN0aW9uKCl7Tyh0KX0pKX0sZz9zZXRUaW1lb3V0KG8sMWUzKTpvKCksdC5fcmVzekV2dD0hMCl9dmFyIG5lPXcudXRpbC50aHJvdHRsZTtmdW5jdGlvbiBhZSh0LGUpe3JldHVybiB0PyhlPSh0PVAoIjxkaXYvPiIpLmNzcygid2lkdGgiLE0odCkpLmFwcGVuZFRvKGV8fHkuYm9keSkpWzBdLm9mZnNldFdpZHRoLHQucmVtb3ZlKCksZSk6MH1mdW5jdGlvbiByZSh0LGUpe3ZhciBuLGE9b2UodCxlKTtyZXR1cm4gYTwwP251bGw6KG49dC5hb0RhdGFbYV0pLm5Ucj9uLmFuQ2VsbHNbZV06UCgiPHRkLz4iKS5odG1sKFModCxhLGUsImRpc3BsYXkiKSlbMF19ZnVuY3Rpb24gb2UodCxlKXtmb3IodmFyIG4sYT0tMSxyPS0xLG89MCxpPXQuYW9EYXRhLmxlbmd0aDtvPGk7bysrKShuPShuPShuPVModCxvLGUsImRpc3BsYXkiKSsiIikucmVwbGFjZSh0ZSwiIikpLnJlcGxhY2UoLyZuYnNwOy9nLCIgIikpLmxlbmd0aD5hJiYoYT1uLmxlbmd0aCxyPW8pO3JldHVybiByfWZ1bmN0aW9uIE0odCl7cmV0dXJuIG51bGw9PT10PyIwcHgiOiJudW1iZXIiPT10eXBlb2YgdD90PDA/IjBweCI6dCsicHgiOnQubWF0Y2goL1xkJC8pP3QrInB4Ijp0fWZ1bmN0aW9uIEkodCl7ZnVuY3Rpb24gZSh0KXt0Lmxlbmd0aCYmIUFycmF5LmlzQXJyYXkodFswXSk/aC5wdXNoKHQpOlAubWVyZ2UoaCx0KX12YXIgbixhLHIsbyxpLGwscyx1PVtdLGM9dC5hb0NvbHVtbnMsZj10LmFhU29ydGluZ0ZpeGVkLGQ9UC5pc1BsYWluT2JqZWN0KGYpLGg9W107Zm9yKEFycmF5LmlzQXJyYXkoZikmJmUoZiksZCYmZi5wcmUmJmUoZi5wcmUpLGUodC5hYVNvcnRpbmcpLGQmJmYucG9zdCYmZShmLnBvc3QpLG49MDtuPGgubGVuZ3RoO24rKylmb3Iocj0obz1jW3M9aFtuXVthPTBdXS5hRGF0YVNvcnQpLmxlbmd0aDthPHI7YSsrKWw9Y1tpPW9bYV1dLnNUeXBlfHwic3RyaW5nIixoW25dLl9pZHg9PT1OJiYoaFtuXS5faWR4PVAuaW5BcnJheShoW25dWzFdLGNbaV0uYXNTb3J0aW5nKSksdS5wdXNoKHtzcmM6cyxjb2w6aSxkaXI6aFtuXVsxXSxpbmRleDpoW25dLl9pZHgsdHlwZTpsLGZvcm1hdHRlcjp3LmV4dC50eXBlLm9yZGVyW2wrIi1wcmUiXX0pO3JldHVybiB1fWZ1bmN0aW9uIGllKHQpe3ZhciBlLG4sYSxyLGMsZj1bXSx1PXcuZXh0LnR5cGUub3JkZXIsZD10LmFvRGF0YSxvPSh0LmFvQ29sdW1ucywwKSxpPXQuYWlEaXNwbGF5TWFzdGVyO2ZvcihsdCh0KSxlPTAsbj0oYz1JKHQpKS5sZW5ndGg7ZTxuO2UrKykocj1jW2VdKS5mb3JtYXR0ZXImJm8rKyxmZSh0LHIuY29sKTtpZigic3NwIiE9RSh0KSYmMCE9PWMubGVuZ3RoKXtmb3IoZT0wLGE9aS5sZW5ndGg7ZTxhO2UrKylmW2lbZV1dPWU7bz09PWMubGVuZ3RoP2kuc29ydChmdW5jdGlvbih0LGUpe2Zvcih2YXIgbixhLHIsbyxpPWMubGVuZ3RoLGw9ZFt0XS5fYVNvcnREYXRhLHM9ZFtlXS5fYVNvcnREYXRhLHU9MDt1PGk7dSsrKWlmKDAhPShyPShuPWxbKG89Y1t1XSkuY29sXSk8KGE9c1tvLmNvbF0pPy0xOmE8bj8xOjApKXJldHVybiJhc2MiPT09by5kaXI/cjotcjtyZXR1cm4obj1mW3RdKTwoYT1mW2VdKT8tMTphPG4/MTowfSk6aS5zb3J0KGZ1bmN0aW9uKHQsZSl7Zm9yKHZhciBuLGEscixvPWMubGVuZ3RoLGk9ZFt0XS5fYVNvcnREYXRhLGw9ZFtlXS5fYVNvcnREYXRhLHM9MDtzPG87cysrKWlmKG49aVsocj1jW3NdKS5jb2xdLGE9bFtyLmNvbF0sMCE9PShyPSh1W3IudHlwZSsiLSIrci5kaXJdfHx1WyJzdHJpbmctIityLmRpcl0pKG4sYSkpKXJldHVybiByO3JldHVybihuPWZbdF0pPChhPWZbZV0pPy0xOmE8bj8xOjB9KX10LmJTb3J0ZWQ9ITB9ZnVuY3Rpb24gbGUodCl7Zm9yKHZhciBlPXQuYW9Db2x1bW5zLG49SSh0KSxhPXQub0xhbmd1YWdlLm9BcmlhLHI9MCxvPWUubGVuZ3RoO3I8bztyKyspe3ZhciBpPWVbcl0sbD1pLmFzU29ydGluZyxzPWkuYXJpYVRpdGxlfHxpLnNUaXRsZS5yZXBsYWNlKC88Lio/Pi9nLCIiKSx1PWkublRoO3UucmVtb3ZlQXR0cmlidXRlKCJhcmlhLXNvcnQiKSxpPWkuYlNvcnRhYmxlP3MrKCJhc2MiPT09KDA8bi5sZW5ndGgmJm5bMF0uY29sPT1yJiYodS5zZXRBdHRyaWJ1dGUoImFyaWEtc29ydCIsImFzYyI9PW5bMF0uZGlyPyJhc2NlbmRpbmciOiJkZXNjZW5kaW5nIiksbFtuWzBdLmluZGV4KzFdKXx8bFswXSk/YS5zU29ydEFzY2VuZGluZzphLnNTb3J0RGVzY2VuZGluZyk6cyx1LnNldEF0dHJpYnV0ZSgiYXJpYS1sYWJlbCIsaSl9fWZ1bmN0aW9uIHNlKHQsZSxuLGEpe2Z1bmN0aW9uIHIodCxlKXt2YXIgbj10Ll9pZHg7cmV0dXJuKG49bj09PU4/UC5pbkFycmF5KHRbMV0scyk6bikrMTxzLmxlbmd0aD9uKzE6ZT9udWxsOjB9dmFyIG8saT10LmFvQ29sdW1uc1tlXSxsPXQuYWFTb3J0aW5nLHM9aS5hc1NvcnRpbmc7Im51bWJlciI9PXR5cGVvZiBsWzBdJiYobD10LmFhU29ydGluZz1bbF0pLG4mJnQub0ZlYXR1cmVzLmJTb3J0TXVsdGk/LTEhPT0oaT1QLmluQXJyYXkoZSxIKGwsIjAiKSkpP251bGw9PT0obz1udWxsPT09KG89cihsW2ldLCEwKSkmJjE9PT1sLmxlbmd0aD8wOm8pP2wuc3BsaWNlKGksMSk6KGxbaV1bMV09c1tvXSxsW2ldLl9pZHg9byk6KGwucHVzaChbZSxzWzBdLDBdKSxsW2wubGVuZ3RoLTFdLl9pZHg9MCk6bC5sZW5ndGgmJmxbMF1bMF09PWU/KG89cihsWzBdKSxsLmxlbmd0aD0xLGxbMF1bMV09c1tvXSxsWzBdLl9pZHg9byk6KGwubGVuZ3RoPTAsbC5wdXNoKFtlLHNbMF1dKSxsWzBdLl9pZHg9MCksdSh0KSwiZnVuY3Rpb24iPT10eXBlb2YgYSYmYSh0KX1mdW5jdGlvbiB1ZShlLHQsbixhKXt2YXIgcj1lLmFvQ29sdW1uc1tuXTttZSh0LHt9LGZ1bmN0aW9uKHQpeyExIT09ci5iU29ydGFibGUmJihlLm9GZWF0dXJlcy5iUHJvY2Vzc2luZz8oRChlLCEwKSxzZXRUaW1lb3V0KGZ1bmN0aW9uKCl7c2UoZSxuLHQuc2hpZnRLZXksYSksInNzcCIhPT1FKGUpJiZEKGUsITEpfSwwKSk6c2UoZSxuLHQuc2hpZnRLZXksYSkpfSl9ZnVuY3Rpb24gY2UodCl7dmFyIGUsbixhLHI9dC5hTGFzdFNvcnQsbz10Lm9DbGFzc2VzLnNTb3J0Q29sdW1uLGk9SSh0KSxsPXQub0ZlYXR1cmVzO2lmKGwuYlNvcnQmJmwuYlNvcnRDbGFzc2VzKXtmb3IoZT0wLG49ci5sZW5ndGg7ZTxuO2UrKylhPXJbZV0uc3JjLFAoSCh0LmFvRGF0YSwiYW5DZWxscyIsYSkpLnJlbW92ZUNsYXNzKG8rKGU8Mj9lKzE6MykpO2ZvcihlPTAsbj1pLmxlbmd0aDtlPG47ZSsrKWE9aVtlXS5zcmMsUChIKHQuYW9EYXRhLCJhbkNlbGxzIixhKSkuYWRkQ2xhc3MobysoZTwyP2UrMTozKSl9dC5hTGFzdFNvcnQ9aX1mdW5jdGlvbiBmZSh0LGUpe2Zvcih2YXIgbixhLHIsbz10LmFvQ29sdW1uc1tlXSxpPXcuZXh0Lm9yZGVyW28uc1NvcnREYXRhVHlwZV0sbD0oaSYmKG49aS5jYWxsKHQub0luc3RhbmNlLHQsZSxvdCh0LGUpKSksdy5leHQudHlwZS5vcmRlcltvLnNUeXBlKyItcHJlIl0pLHM9MCx1PXQuYW9EYXRhLmxlbmd0aDtzPHU7cysrKShhPXQuYW9EYXRhW3NdKS5fYVNvcnREYXRhfHwoYS5fYVNvcnREYXRhPVtdKSxhLl9hU29ydERhdGFbZV0mJiFpfHwocj1pP25bc106Uyh0LHMsZSwic29ydCIpLGEuX2FTb3J0RGF0YVtlXT1sP2wocik6cil9ZnVuY3Rpb24gZGUobil7dmFyIHQ7bi5fYkxvYWRpbmdTdGF0ZXx8KHQ9e3RpbWU6K25ldyBEYXRlLHN0YXJ0Om4uX2lEaXNwbGF5U3RhcnQsbGVuZ3RoOm4uX2lEaXNwbGF5TGVuZ3RoLG9yZGVyOlAuZXh0ZW5kKCEwLFtdLG4uYWFTb3J0aW5nKSxzZWFyY2g6RXQobi5vUHJldmlvdXNTZWFyY2gpLGNvbHVtbnM6UC5tYXAobi5hb0NvbHVtbnMsZnVuY3Rpb24odCxlKXtyZXR1cm57dmlzaWJsZTp0LmJWaXNpYmxlLHNlYXJjaDpFdChuLmFvUHJlU2VhcmNoQ29sc1tlXSl9fSl9LG4ub1NhdmVkU3RhdGU9dCxSKG4sImFvU3RhdGVTYXZlUGFyYW1zIiwic3RhdGVTYXZlUGFyYW1zIixbbix0XSksbi5vRmVhdHVyZXMuYlN0YXRlU2F2ZSYmIW4uYkRlc3Ryb3lpbmcmJm4uZm5TdGF0ZVNhdmVDYWxsYmFjay5jYWxsKG4ub0luc3RhbmNlLG4sdCkpfWZ1bmN0aW9uIGhlKGUsdCxuKXt2YXIgYTtpZihlLm9GZWF0dXJlcy5iU3RhdGVTYXZlKXJldHVybihhPWUuZm5TdGF0ZUxvYWRDYWxsYmFjay5jYWxsKGUub0luc3RhbmNlLGUsZnVuY3Rpb24odCl7cGUoZSx0LG4pfSkpIT09TiYmcGUoZSxhLG4pLCEwO24oKX1mdW5jdGlvbiBwZShuLHQsZSl7dmFyIGEscixvPW4uYW9Db2x1bW5zLGk9KG4uX2JMb2FkaW5nU3RhdGU9ITAsbi5fYkluaXRDb21wbGV0ZT9uZXcgdy5BcGkobik6bnVsbCk7aWYodCYmdC50aW1lKXt2YXIgbD1SKG4sImFvU3RhdGVMb2FkUGFyYW1zIiwic3RhdGVMb2FkUGFyYW1zIixbbix0XSk7aWYoLTEhPT1QLmluQXJyYXkoITEsbCkpbi5fYkxvYWRpbmdTdGF0ZT0hMTtlbHNle2w9bi5pU3RhdGVEdXJhdGlvbjtpZigwPGwmJnQudGltZTwrbmV3IERhdGUtMWUzKmwpbi5fYkxvYWRpbmdTdGF0ZT0hMTtlbHNlIGlmKHQuY29sdW1ucyYmby5sZW5ndGghPT10LmNvbHVtbnMubGVuZ3RoKW4uX2JMb2FkaW5nU3RhdGU9ITE7ZWxzZXtpZihuLm9Mb2FkZWRTdGF0ZT1QLmV4dGVuZCghMCx7fSx0KSx0Lmxlbmd0aCE9PU4mJihpP2kucGFnZS5sZW4odC5sZW5ndGgpOm4uX2lEaXNwbGF5TGVuZ3RoPXQubGVuZ3RoKSx0LnN0YXJ0IT09TiYmKG51bGw9PT1pPyhuLl9pRGlzcGxheVN0YXJ0PXQuc3RhcnQsbi5pSW5pdERpc3BsYXlTdGFydD10LnN0YXJ0KTpZdChuLHQuc3RhcnQvbi5faURpc3BsYXlMZW5ndGgpKSx0Lm9yZGVyIT09TiYmKG4uYWFTb3J0aW5nPVtdLFAuZWFjaCh0Lm9yZGVyLGZ1bmN0aW9uKHQsZSl7bi5hYVNvcnRpbmcucHVzaChlWzBdPj1vLmxlbmd0aD9bMCxlWzFdXTplKX0pKSx0LnNlYXJjaCE9PU4mJlAuZXh0ZW5kKG4ub1ByZXZpb3VzU2VhcmNoLEJ0KHQuc2VhcmNoKSksdC5jb2x1bW5zKXtmb3IoYT0wLHI9dC5jb2x1bW5zLmxlbmd0aDthPHI7YSsrKXt2YXIgcz10LmNvbHVtbnNbYV07cy52aXNpYmxlIT09TiYmKGk/aS5jb2x1bW4oYSkudmlzaWJsZShzLnZpc2libGUsITEpOm9bYV0uYlZpc2libGU9cy52aXNpYmxlKSxzLnNlYXJjaCE9PU4mJlAuZXh0ZW5kKG4uYW9QcmVTZWFyY2hDb2xzW2FdLEJ0KHMuc2VhcmNoKSl9aSYmaS5jb2x1bW5zLmFkanVzdCgpfW4uX2JMb2FkaW5nU3RhdGU9ITEsUihuLCJhb1N0YXRlTG9hZGVkIiwic3RhdGVMb2FkZWQiLFtuLHRdKX19fWVsc2Ugbi5fYkxvYWRpbmdTdGF0ZT0hMTtlKCl9ZnVuY3Rpb24gZ2UodCl7dmFyIGU9dy5zZXR0aW5ncyx0PVAuaW5BcnJheSh0LEgoZSwiblRhYmxlIikpO3JldHVybi0xIT09dD9lW3RdOm51bGx9ZnVuY3Rpb24gVyh0LGUsbixhKXtpZihuPSJEYXRhVGFibGVzIHdhcm5pbmc6ICIrKHQ/InRhYmxlIGlkPSIrdC5zVGFibGVJZCsiIC0gIjoiIikrbixhJiYobis9Ii4gRm9yIG1vcmUgaW5mb3JtYXRpb24gYWJvdXQgdGhpcyBlcnJvciwgcGxlYXNlIHNlZSBodHRwOi8vZGF0YXRhYmxlcy5uZXQvdG4vIithKSxlKWouY29uc29sZSYmY29uc29sZS5sb2cmJmNvbnNvbGUubG9nKG4pO2Vsc2V7ZT13LmV4dCxlPWUuc0Vyck1vZGV8fGUuZXJyTW9kZTtpZih0JiZSKHQsbnVsbCwiZXJyb3IiLFt0LGEsbl0pLCJhbGVydCI9PWUpYWxlcnQobik7ZWxzZXtpZigidGhyb3ciPT1lKXRocm93IG5ldyBFcnJvcihuKTsiZnVuY3Rpb24iPT10eXBlb2YgZSYmZSh0LGEsbil9fX1mdW5jdGlvbiBGKG4sYSx0LGUpe0FycmF5LmlzQXJyYXkodCk/UC5lYWNoKHQsZnVuY3Rpb24odCxlKXtBcnJheS5pc0FycmF5KGUpP0YobixhLGVbMF0sZVsxXSk6RihuLGEsZSl9KTooZT09PU4mJihlPXQpLGFbdF0hPT1OJiYobltlXT1hW3RdKSl9ZnVuY3Rpb24gYmUodCxlLG4pe3ZhciBhLHI7Zm9yKHIgaW4gZSllLmhhc093blByb3BlcnR5KHIpJiYoYT1lW3JdLFAuaXNQbGFpbk9iamVjdChhKT8oUC5pc1BsYWluT2JqZWN0KHRbcl0pfHwodFtyXT17fSksUC5leHRlbmQoITAsdFtyXSxhKSk6biYmImRhdGEiIT09ciYmImFhRGF0YSIhPT1yJiZBcnJheS5pc0FycmF5KGEpP3Rbcl09YS5zbGljZSgpOnRbcl09YSk7cmV0dXJuIHR9ZnVuY3Rpb24gbWUoZSx0LG4pe1AoZSkub24oImNsaWNrLkRUIix0LGZ1bmN0aW9uKHQpe1AoZSkudHJpZ2dlcigiYmx1ciIpLG4odCl9KS5vbigia2V5cHJlc3MuRFQiLHQsZnVuY3Rpb24odCl7MTM9PT10LndoaWNoJiYodC5wcmV2ZW50RGVmYXVsdCgpLG4odCkpfSkub24oInNlbGVjdHN0YXJ0LkRUIixmdW5jdGlvbigpe3JldHVybiExfSl9ZnVuY3Rpb24gTCh0LGUsbixhKXtuJiZ0W2VdLnB1c2goe2ZuOm4sc05hbWU6YX0pfWZ1bmN0aW9uIFIobix0LGUsYSl7dmFyIHI9W107cmV0dXJuIHQmJihyPVAubWFwKG5bdF0uc2xpY2UoKS5yZXZlcnNlKCksZnVuY3Rpb24odCxlKXtyZXR1cm4gdC5mbi5hcHBseShuLm9JbnN0YW5jZSxhKX0pKSxudWxsIT09ZSYmKHQ9UC5FdmVudChlKyIuZHQiKSwoZT1QKG4ublRhYmxlKSkudHJpZ2dlcih0LGEpLDA9PT1lLnBhcmVudHMoImJvZHkiKS5sZW5ndGgmJlAoImJvZHkiKS50cmlnZ2VyKHQsYSksci5wdXNoKHQucmVzdWx0KSkscn1mdW5jdGlvbiBTZSh0KXt2YXIgZT10Ll9pRGlzcGxheVN0YXJ0LG49dC5mbkRpc3BsYXlFbmQoKSxhPXQuX2lEaXNwbGF5TGVuZ3RoO248PWUmJihlPW4tYSksZS09ZSVhLHQuX2lEaXNwbGF5U3RhcnQ9ZT0tMT09PWF8fGU8MD8wOmV9ZnVuY3Rpb24gdmUodCxlKXt2YXIgdD10LnJlbmRlcmVyLG49dy5leHQucmVuZGVyZXJbZV07cmV0dXJuIFAuaXNQbGFpbk9iamVjdCh0KSYmdFtlXT9uW3RbZV1dfHxuLl86InN0cmluZyI9PXR5cGVvZiB0JiZuW3RdfHxuLl99ZnVuY3Rpb24gRSh0KXtyZXR1cm4gdC5vRmVhdHVyZXMuYlNlcnZlclNpZGU/InNzcCI6dC5hamF4fHx0LnNBamF4U291cmNlPyJhamF4IjoiZG9tIn1mdW5jdGlvbiB5ZSh0LG4pe3ZhciBhO3JldHVybiBBcnJheS5pc0FycmF5KHQpP1AubWFwKHQsZnVuY3Rpb24odCl7cmV0dXJuIHllKHQsbil9KToibnVtYmVyIj09dHlwZW9mIHQ/W25bdF1dOihhPVAubWFwKG4sZnVuY3Rpb24odCxlKXtyZXR1cm4gdC5uVGFibGV9KSxQKGEpLmZpbHRlcih0KS5tYXAoZnVuY3Rpb24odCl7dmFyIGU9UC5pbkFycmF5KHRoaXMsYSk7cmV0dXJuIG5bZV19KS50b0FycmF5KCkpfWZ1bmN0aW9uIERlKHIsbyx0KXt2YXIgZSxuO3QmJihlPW5ldyBCKHIpKS5vbmUoImRyYXciLGZ1bmN0aW9uKCl7dChlLmFqYXguanNvbigpKX0pLCJzc3AiPT1FKHIpP3UocixvKTooRChyLCEwKSwobj1yLmpxWEhSKSYmNCE9PW4ucmVhZHlTdGF0ZSYmbi5hYm9ydCgpLFR0KHIsW10sZnVuY3Rpb24odCl7cHQocik7Zm9yKHZhciBlPUZ0KHIsdCksbj0wLGE9ZS5sZW5ndGg7bjxhO24rKyl4KHIsZVtuXSk7dShyLG8pLEQociwhMSl9KSl9ZnVuY3Rpb24gX2UodCxlLG4sYSxyKXtmb3IodmFyIG8saSxsLHMsdT1bXSxjPXR5cGVvZiBlLGY9MCxkPShlPWUmJiJzdHJpbmciIT1jJiYiZnVuY3Rpb24iIT1jJiZlLmxlbmd0aCE9PU4/ZTpbZV0pLmxlbmd0aDtmPGQ7ZisrKWZvcihsPTAscz0oaT1lW2ZdJiZlW2ZdLnNwbGl0JiYhZVtmXS5tYXRjaCgvW1xbXCg6XS8pP2VbZl0uc3BsaXQoIiwiKTpbZVtmXV0pLmxlbmd0aDtsPHM7bCsrKShvPW4oInN0cmluZyI9PXR5cGVvZiBpW2xdP2lbbF0udHJpbSgpOmlbbF0pKSYmby5sZW5ndGgmJih1PXUuY29uY2F0KG8pKTt2YXIgaD1wLnNlbGVjdG9yW3RdO2lmKGgubGVuZ3RoKWZvcihmPTAsZD1oLmxlbmd0aDtmPGQ7ZisrKXU9aFtmXShhLHIsdSk7cmV0dXJuIHoodSl9ZnVuY3Rpb24gd2UodCl7cmV0dXJuKHQ9dHx8e30pLmZpbHRlciYmdC5zZWFyY2g9PT1OJiYodC5zZWFyY2g9dC5maWx0ZXIpLFAuZXh0ZW5kKHtzZWFyY2g6Im5vbmUiLG9yZGVyOiJjdXJyZW50IixwYWdlOiJhbGwifSx0KX1mdW5jdGlvbiBDZSh0KXtmb3IodmFyIGU9MCxuPXQubGVuZ3RoO2U8bjtlKyspaWYoMDx0W2VdLmxlbmd0aClyZXR1cm4gdFswXT10W2VdLHRbMF0ubGVuZ3RoPTEsdC5sZW5ndGg9MSx0LmNvbnRleHQ9W3QuY29udGV4dFtlXV0sdDtyZXR1cm4gdC5sZW5ndGg9MCx0fWZ1bmN0aW9uIFRlKG8sdCxlLG4pe2Z1bmN0aW9uIGkodCxlKXt2YXIgbjtpZihBcnJheS5pc0FycmF5KHQpfHx0IGluc3RhbmNlb2YgUClmb3IodmFyIGE9MCxyPXQubGVuZ3RoO2E8cjthKyspaSh0W2FdLGUpO2Vsc2UgdC5ub2RlTmFtZSYmInRyIj09PXQubm9kZU5hbWUudG9Mb3dlckNhc2UoKT9sLnB1c2godCk6KG49UCgiPHRyPjx0ZD48L3RkPjwvdHI+IikuYWRkQ2xhc3MoZSksUCgidGQiLG4pLmFkZENsYXNzKGUpLmh0bWwodClbMF0uY29sU3Bhbj1UKG8pLGwucHVzaChuWzBdKSl9dmFyIGw9W107aShlLG4pLHQuX2RldGFpbHMmJnQuX2RldGFpbHMuZGV0YWNoKCksdC5fZGV0YWlscz1QKGwpLHQuX2RldGFpbHNTaG93JiZ0Ll9kZXRhaWxzLmluc2VydEFmdGVyKHQublRyKX1mdW5jdGlvbiB4ZSh0LGUpe3ZhciBuPXQuY29udGV4dDtpZihuLmxlbmd0aCYmdC5sZW5ndGgpe3ZhciBhPW5bMF0uYW9EYXRhW3RbMF1dO2lmKGEuX2RldGFpbHMpeyhhLl9kZXRhaWxzU2hvdz1lKT8oYS5fZGV0YWlscy5pbnNlcnRBZnRlcihhLm5UciksUChhLm5UcikuYWRkQ2xhc3MoImR0LWhhc0NoaWxkIikpOihhLl9kZXRhaWxzLmRldGFjaCgpLFAoYS5uVHIpLnJlbW92ZUNsYXNzKCJkdC1oYXNDaGlsZCIpKSxSKG5bMF0sbnVsbCwiY2hpbGRSb3ciLFtlLHQucm93KHRbMF0pXSk7dmFyIHM9blswXSxyPW5ldyBCKHMpLGE9Ii5kdC5EVF9kZXRhaWxzIixlPSJkcmF3IithLHQ9ImNvbHVtbi1zaXppbmciK2EsYT0iZGVzdHJveSIrYSx1PXMuYW9EYXRhO2lmKHIub2ZmKGUrIiAiK3QrIiAiK2EpLEgodSwiX2RldGFpbHMiKS5sZW5ndGg+MCl7ci5vbihlLGZ1bmN0aW9uKHQsZSl7aWYocyE9PWUpcmV0dXJuO3Iucm93cyh7cGFnZToiY3VycmVudCJ9KS5lcSgwKS5lYWNoKGZ1bmN0aW9uKHQpe3ZhciBlPXVbdF07aWYoZS5fZGV0YWlsc1Nob3cpZS5fZGV0YWlscy5pbnNlcnRBZnRlcihlLm5Ucil9KX0pO3Iub24odCxmdW5jdGlvbih0LGUsbixhKXtpZihzIT09ZSlyZXR1cm47dmFyIHIsbz1UKGUpO2Zvcih2YXIgaT0wLGw9dS5sZW5ndGg7aTxsO2krKyl7cj11W2ldO2lmKHIuX2RldGFpbHMpci5fZGV0YWlscy5jaGlsZHJlbigidGRbY29sc3Bhbl0iKS5hdHRyKCJjb2xzcGFuIixvKX19KTtyLm9uKGEsZnVuY3Rpb24odCxlKXtpZihzIT09ZSlyZXR1cm47Zm9yKHZhciBuPTAsYT11Lmxlbmd0aDtuPGE7bisrKWlmKHVbbl0uX2RldGFpbHMpUmUocixuKX0pfUxlKG4pfX19ZnVuY3Rpb24gQWUodCxlLG4sYSxyKXtmb3IodmFyIG89W10saT0wLGw9ci5sZW5ndGg7aTxsO2krKylvLnB1c2goUyh0LHJbaV0sZSkpO3JldHVybiBvfXZhciBJZT1bXSxvPUFycmF5LnByb3RvdHlwZSxCPWZ1bmN0aW9uKHQsZSl7aWYoISh0aGlzIGluc3RhbmNlb2YgQikpcmV0dXJuIG5ldyBCKHQsZSk7ZnVuY3Rpb24gbih0KXt2YXIgZSxuLGEscjt0PXQsYT13LnNldHRpbmdzLHI9UC5tYXAoYSxmdW5jdGlvbih0LGUpe3JldHVybiB0Lm5UYWJsZX0pLCh0PXQ/dC5uVGFibGUmJnQub0FwaT9bdF06dC5ub2RlTmFtZSYmInRhYmxlIj09PXQubm9kZU5hbWUudG9Mb3dlckNhc2UoKT8tMSE9PShlPVAuaW5BcnJheSh0LHIpKT9bYVtlXV06bnVsbDp0JiYiZnVuY3Rpb24iPT10eXBlb2YgdC5zZXR0aW5ncz90LnNldHRpbmdzKCkudG9BcnJheSgpOigic3RyaW5nIj09dHlwZW9mIHQ/bj1QKHQpOnQgaW5zdGFuY2VvZiBQJiYobj10KSxuP24ubWFwKGZ1bmN0aW9uKHQpe3JldHVybi0xIT09KGU9UC5pbkFycmF5KHRoaXMscikpP2FbZV06bnVsbH0pLnRvQXJyYXkoKTp2b2lkIDApOltdKSYmby5wdXNoLmFwcGx5KG8sdCl9dmFyIG89W107aWYoQXJyYXkuaXNBcnJheSh0KSlmb3IodmFyIGE9MCxyPXQubGVuZ3RoO2E8cjthKyspbih0W2FdKTtlbHNlIG4odCk7dGhpcy5jb250ZXh0PXoobyksZSYmUC5tZXJnZSh0aGlzLGUpLHRoaXMuc2VsZWN0b3I9e3Jvd3M6bnVsbCxjb2xzOm51bGwsb3B0czpudWxsfSxCLmV4dGVuZCh0aGlzLHRoaXMsSWUpfSxGZT0ody5BcGk9QixQLmV4dGVuZChCLnByb3RvdHlwZSx7YW55OmZ1bmN0aW9uKCl7cmV0dXJuIDAhPT10aGlzLmNvdW50KCl9LGNvbmNhdDpvLmNvbmNhdCxjb250ZXh0OltdLGNvdW50OmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuZmxhdHRlbigpLmxlbmd0aH0sZWFjaDpmdW5jdGlvbih0KXtmb3IodmFyIGU9MCxuPXRoaXMubGVuZ3RoO2U8bjtlKyspdC5jYWxsKHRoaXMsdGhpc1tlXSxlLHRoaXMpO3JldHVybiB0aGlzfSxlcTpmdW5jdGlvbih0KXt2YXIgZT10aGlzLmNvbnRleHQ7cmV0dXJuIGUubGVuZ3RoPnQ/bmV3IEIoZVt0XSx0aGlzW3RdKTpudWxsfSxmaWx0ZXI6ZnVuY3Rpb24odCl7dmFyIGU9W107aWYoby5maWx0ZXIpZT1vLmZpbHRlci5jYWxsKHRoaXMsdCx0aGlzKTtlbHNlIGZvcih2YXIgbj0wLGE9dGhpcy5sZW5ndGg7bjxhO24rKyl0LmNhbGwodGhpcyx0aGlzW25dLG4sdGhpcykmJmUucHVzaCh0aGlzW25dKTtyZXR1cm4gbmV3IEIodGhpcy5jb250ZXh0LGUpfSxmbGF0dGVuOmZ1bmN0aW9uKCl7dmFyIHQ9W107cmV0dXJuIG5ldyBCKHRoaXMuY29udGV4dCx0LmNvbmNhdC5hcHBseSh0LHRoaXMudG9BcnJheSgpKSl9LGpvaW46by5qb2luLGluZGV4T2Y6by5pbmRleE9mfHxmdW5jdGlvbih0LGUpe2Zvcih2YXIgbj1lfHwwLGE9dGhpcy5sZW5ndGg7bjxhO24rKylpZih0aGlzW25dPT09dClyZXR1cm4gbjtyZXR1cm4tMX0saXRlcmF0b3I6ZnVuY3Rpb24odCxlLG4sYSl7dmFyIHIsbyxpLGwscyx1LGMsZixkPVtdLGg9dGhpcy5jb250ZXh0LHA9dGhpcy5zZWxlY3Rvcjtmb3IoInN0cmluZyI9PXR5cGVvZiB0JiYoYT1uLG49ZSxlPXQsdD0hMSksbz0wLGk9aC5sZW5ndGg7bzxpO28rKyl7dmFyIGc9bmV3IEIoaFtvXSk7aWYoInRhYmxlIj09PWUpKHI9bi5jYWxsKGcsaFtvXSxvKSkhPT1OJiZkLnB1c2gocik7ZWxzZSBpZigiY29sdW1ucyI9PT1lfHwicm93cyI9PT1lKShyPW4uY2FsbChnLGhbb10sdGhpc1tvXSxvKSkhPT1OJiZkLnB1c2gocik7ZWxzZSBpZigiY29sdW1uIj09PWV8fCJjb2x1bW4tcm93cyI9PT1lfHwicm93Ij09PWV8fCJjZWxsIj09PWUpZm9yKGM9dGhpc1tvXSwiY29sdW1uLXJvd3MiPT09ZSYmKHU9RmUoaFtvXSxwLm9wdHMpKSxsPTAscz1jLmxlbmd0aDtsPHM7bCsrKWY9Y1tsXSwocj0iY2VsbCI9PT1lP24uY2FsbChnLGhbb10sZi5yb3csZi5jb2x1bW4sbyxsKTpuLmNhbGwoZyxoW29dLGYsbyxsLHUpKSE9PU4mJmQucHVzaChyKX1yZXR1cm4gZC5sZW5ndGh8fGE/KCh0PShhPW5ldyBCKGgsdD9kLmNvbmNhdC5hcHBseShbXSxkKTpkKSkuc2VsZWN0b3IpLnJvd3M9cC5yb3dzLHQuY29scz1wLmNvbHMsdC5vcHRzPXAub3B0cyxhKTp0aGlzfSxsYXN0SW5kZXhPZjpvLmxhc3RJbmRleE9mfHxmdW5jdGlvbih0LGUpe3JldHVybiB0aGlzLmluZGV4T2YuYXBwbHkodGhpcy50b0FycmF5LnJldmVyc2UoKSxhcmd1bWVudHMpfSxsZW5ndGg6MCxtYXA6ZnVuY3Rpb24odCl7dmFyIGU9W107aWYoby5tYXApZT1vLm1hcC5jYWxsKHRoaXMsdCx0aGlzKTtlbHNlIGZvcih2YXIgbj0wLGE9dGhpcy5sZW5ndGg7bjxhO24rKyllLnB1c2godC5jYWxsKHRoaXMsdGhpc1tuXSxuKSk7cmV0dXJuIG5ldyBCKHRoaXMuY29udGV4dCxlKX0scGx1Y2s6ZnVuY3Rpb24odCl7dmFyIGU9dy51dGlsLmdldCh0KTtyZXR1cm4gdGhpcy5tYXAoZnVuY3Rpb24odCl7cmV0dXJuIGUodCl9KX0scG9wOm8ucG9wLHB1c2g6by5wdXNoLHJlZHVjZTpvLnJlZHVjZXx8ZnVuY3Rpb24odCxlKXtyZXR1cm4gZXQodGhpcyx0LGUsMCx0aGlzLmxlbmd0aCwxKX0scmVkdWNlUmlnaHQ6by5yZWR1Y2VSaWdodHx8ZnVuY3Rpb24odCxlKXtyZXR1cm4gZXQodGhpcyx0LGUsdGhpcy5sZW5ndGgtMSwtMSwtMSl9LHJldmVyc2U6by5yZXZlcnNlLHNlbGVjdG9yOm51bGwsc2hpZnQ6by5zaGlmdCxzbGljZTpmdW5jdGlvbigpe3JldHVybiBuZXcgQih0aGlzLmNvbnRleHQsdGhpcyl9LHNvcnQ6by5zb3J0LHNwbGljZTpvLnNwbGljZSx0b0FycmF5OmZ1bmN0aW9uKCl7cmV0dXJuIG8uc2xpY2UuY2FsbCh0aGlzKX0sdG8kOmZ1bmN0aW9uKCl7cmV0dXJuIFAodGhpcyl9LHRvSlF1ZXJ5OmZ1bmN0aW9uKCl7cmV0dXJuIFAodGhpcyl9LHVuaXF1ZTpmdW5jdGlvbigpe3JldHVybiBuZXcgQih0aGlzLmNvbnRleHQseih0aGlzKSl9LHVuc2hpZnQ6by51bnNoaWZ0fSksQi5leHRlbmQ9ZnVuY3Rpb24odCxlLG4pe2lmKG4ubGVuZ3RoJiZlJiYoZSBpbnN0YW5jZW9mIEJ8fGUuX19kdF93cmFwcGVyKSlmb3IodmFyIGEscj0wLG89bi5sZW5ndGg7cjxvO3IrKyllWyhhPW5bcl0pLm5hbWVdPSJmdW5jdGlvbiI9PT1hLnR5cGU/ZnVuY3Rpb24oZSxuLGEpe3JldHVybiBmdW5jdGlvbigpe3ZhciB0PW4uYXBwbHkoZSxhcmd1bWVudHMpO3JldHVybiBCLmV4dGVuZCh0LHQsYS5tZXRob2RFeHQpLHR9fSh0LGEudmFsLGEpOiJvYmplY3QiPT09YS50eXBlP3t9OmEudmFsLGVbYS5uYW1lXS5fX2R0X3dyYXBwZXI9ITAsQi5leHRlbmQodCxlW2EubmFtZV0sYS5wcm9wRXh0KX0sQi5yZWdpc3Rlcj1lPWZ1bmN0aW9uKHQsZSl7aWYoQXJyYXkuaXNBcnJheSh0KSlmb3IodmFyIG49MCxhPXQubGVuZ3RoO248YTtuKyspQi5yZWdpc3Rlcih0W25dLGUpO2Vsc2UgZm9yKHZhciByPXQuc3BsaXQoIi4iKSxvPUllLGk9MCxsPXIubGVuZ3RoO2k8bDtpKyspe3ZhciBzLHUsYz1mdW5jdGlvbih0LGUpe2Zvcih2YXIgbj0wLGE9dC5sZW5ndGg7bjxhO24rKylpZih0W25dLm5hbWU9PT1lKXJldHVybiB0W25dO3JldHVybiBudWxsfShvLHU9KHM9LTEhPT1yW2ldLmluZGV4T2YoIigpIikpP3JbaV0ucmVwbGFjZSgiKCkiLCIiKTpyW2ldKTtjfHxvLnB1c2goYz17bmFtZTp1LHZhbDp7fSxtZXRob2RFeHQ6W10scHJvcEV4dDpbXSx0eXBlOiJvYmplY3QifSksaT09PWwtMT8oYy52YWw9ZSxjLnR5cGU9ImZ1bmN0aW9uIj09dHlwZW9mIGU/ImZ1bmN0aW9uIjpQLmlzUGxhaW5PYmplY3QoZSk/Im9iamVjdCI6Im90aGVyIik6bz1zP2MubWV0aG9kRXh0OmMucHJvcEV4dH19LEIucmVnaXN0ZXJQbHVyYWw9dD1mdW5jdGlvbih0LGUsbil7Qi5yZWdpc3Rlcih0LG4pLEIucmVnaXN0ZXIoZSxmdW5jdGlvbigpe3ZhciB0PW4uYXBwbHkodGhpcyxhcmd1bWVudHMpO3JldHVybiB0PT09dGhpcz90aGlzOnQgaW5zdGFuY2VvZiBCP3QubGVuZ3RoP0FycmF5LmlzQXJyYXkodFswXSk/bmV3IEIodC5jb250ZXh0LHRbMF0pOnRbMF06Tjp0fSl9LGUoInRhYmxlcygpIixmdW5jdGlvbih0KXtyZXR1cm4gdCE9PU4mJm51bGwhPT10P25ldyBCKHllKHQsdGhpcy5jb250ZXh0KSk6dGhpc30pLGUoInRhYmxlKCkiLGZ1bmN0aW9uKHQpe3ZhciB0PXRoaXMudGFibGVzKHQpLGU9dC5jb250ZXh0O3JldHVybiBlLmxlbmd0aD9uZXcgQihlWzBdKTp0fSksdCgidGFibGVzKCkubm9kZXMoKSIsInRhYmxlKCkubm9kZSgpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7cmV0dXJuIHQublRhYmxlfSwxKX0pLHQoInRhYmxlcygpLmJvZHkoKSIsInRhYmxlKCkuYm9keSgpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7cmV0dXJuIHQublRCb2R5fSwxKX0pLHQoInRhYmxlcygpLmhlYWRlcigpIiwidGFibGUoKS5oZWFkZXIoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe3JldHVybiB0Lm5USGVhZH0sMSl9KSx0KCJ0YWJsZXMoKS5mb290ZXIoKSIsInRhYmxlKCkuZm9vdGVyKCkiLGZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtyZXR1cm4gdC5uVEZvb3R9LDEpfSksdCgidGFibGVzKCkuY29udGFpbmVycygpIiwidGFibGUoKS5jb250YWluZXIoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe3JldHVybiB0Lm5UYWJsZVdyYXBwZXJ9LDEpfSksZSgiZHJhdygpIixmdW5jdGlvbihlKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpeyJwYWdlIj09PWU/dih0KTp1KHQsITE9PT0oZT0ic3RyaW5nIj09dHlwZW9mIGU/ImZ1bGwtaG9sZCIhPT1lOmUpKX0pfSksZSgicGFnZSgpIixmdW5jdGlvbihlKXtyZXR1cm4gZT09PU4/dGhpcy5wYWdlLmluZm8oKS5wYWdlOnRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtZdCh0LGUpfSl9KSxlKCJwYWdlLmluZm8oKSIsZnVuY3Rpb24odCl7dmFyIGUsbixhLHIsbztyZXR1cm4gMD09PXRoaXMuY29udGV4dC5sZW5ndGg/Tjoobj0oZT10aGlzLmNvbnRleHRbMF0pLl9pRGlzcGxheVN0YXJ0LGE9ZS5vRmVhdHVyZXMuYlBhZ2luYXRlP2UuX2lEaXNwbGF5TGVuZ3RoOi0xLHI9ZS5mblJlY29yZHNEaXNwbGF5KCkse3BhZ2U6KG89LTE9PT1hKT8wOk1hdGguZmxvb3Iobi9hKSxwYWdlczpvPzE6TWF0aC5jZWlsKHIvYSksc3RhcnQ6bixlbmQ6ZS5mbkRpc3BsYXlFbmQoKSxsZW5ndGg6YSxyZWNvcmRzVG90YWw6ZS5mblJlY29yZHNUb3RhbCgpLHJlY29yZHNEaXNwbGF5OnIsc2VydmVyU2lkZToic3NwIj09PUUoZSl9KX0pLGUoInBhZ2UubGVuKCkiLGZ1bmN0aW9uKGUpe3JldHVybiBlPT09Tj8wIT09dGhpcy5jb250ZXh0Lmxlbmd0aD90aGlzLmNvbnRleHRbMF0uX2lEaXNwbGF5TGVuZ3RoOk46dGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe0d0KHQsZSl9KX0pLGUoImFqYXguanNvbigpIixmdW5jdGlvbigpe3ZhciB0PXRoaXMuY29udGV4dDtpZigwPHQubGVuZ3RoKXJldHVybiB0WzBdLmpzb259KSxlKCJhamF4LnBhcmFtcygpIixmdW5jdGlvbigpe3ZhciB0PXRoaXMuY29udGV4dDtpZigwPHQubGVuZ3RoKXJldHVybiB0WzBdLm9BamF4RGF0YX0pLGUoImFqYXgucmVsb2FkKCkiLGZ1bmN0aW9uKGUsbil7cmV0dXJuIHRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtEZSh0LCExPT09bixlKX0pfSksZSgiYWpheC51cmwoKSIsZnVuY3Rpb24oZSl7dmFyIHQ9dGhpcy5jb250ZXh0O3JldHVybiBlPT09Tj8wPT09dC5sZW5ndGg/TjoodD10WzBdKS5hamF4P1AuaXNQbGFpbk9iamVjdCh0LmFqYXgpP3QuYWpheC51cmw6dC5hamF4OnQuc0FqYXhTb3VyY2U6dGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe1AuaXNQbGFpbk9iamVjdCh0LmFqYXgpP3QuYWpheC51cmw9ZTp0LmFqYXg9ZX0pfSksZSgiYWpheC51cmwoKS5sb2FkKCkiLGZ1bmN0aW9uKGUsbil7cmV0dXJuIHRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtEZSh0LCExPT09bixlKX0pfSksZnVuY3Rpb24odCxlKXt2YXIgbixhPVtdLHI9dC5haURpc3BsYXksbz10LmFpRGlzcGxheU1hc3RlcixpPWUuc2VhcmNoLGw9ZS5vcmRlcixlPWUucGFnZTtpZigic3NwIj09RSh0KSlyZXR1cm4icmVtb3ZlZCI9PT1pP1tdOmYoMCxvLmxlbmd0aCk7aWYoImN1cnJlbnQiPT1lKWZvcih1PXQuX2lEaXNwbGF5U3RhcnQsYz10LmZuRGlzcGxheUVuZCgpO3U8Yzt1KyspYS5wdXNoKHJbdV0pO2Vsc2UgaWYoImN1cnJlbnQiPT1sfHwiYXBwbGllZCI9PWwpe2lmKCJub25lIj09aSlhPW8uc2xpY2UoKTtlbHNlIGlmKCJhcHBsaWVkIj09aSlhPXIuc2xpY2UoKTtlbHNlIGlmKCJyZW1vdmVkIj09aSl7Zm9yKHZhciBzPXt9LHU9MCxjPXIubGVuZ3RoO3U8Yzt1Kyspc1tyW3VdXT1udWxsO2E9UC5tYXAobyxmdW5jdGlvbih0KXtyZXR1cm4gcy5oYXNPd25Qcm9wZXJ0eSh0KT9udWxsOnR9KX19ZWxzZSBpZigiaW5kZXgiPT1sfHwib3JpZ2luYWwiPT1sKWZvcih1PTAsYz10LmFvRGF0YS5sZW5ndGg7dTxjO3UrKykoIm5vbmUiPT1pfHwtMT09PShuPVAuaW5BcnJheSh1LHIpKSYmInJlbW92ZWQiPT1pfHwwPD1uJiYiYXBwbGllZCI9PWkpJiZhLnB1c2godSk7cmV0dXJuIGF9KSxMZT0oZSgicm93cygpIixmdW5jdGlvbihlLG4pe2U9PT1OP2U9IiI6UC5pc1BsYWluT2JqZWN0KGUpJiYobj1lLGU9IiIpLG49d2Uobik7dmFyIHQ9dGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe3JldHVybiBfZSgicm93IixlLGZ1bmN0aW9uKG4pe3ZhciB0PWQobiksYT1yLmFvRGF0YTtpZihudWxsIT09dCYmIW8pcmV0dXJuW3RdO2lmKGk9aXx8RmUocixvKSxudWxsIT09dCYmLTEhPT1QLmluQXJyYXkodCxpKSlyZXR1cm5bdF07aWYobnVsbD09PW58fG49PT1OfHwiIj09PW4pcmV0dXJuIGk7aWYoImZ1bmN0aW9uIj09dHlwZW9mIG4pcmV0dXJuIFAubWFwKGksZnVuY3Rpb24odCl7dmFyIGU9YVt0XTtyZXR1cm4gbih0LGUuX2FEYXRhLGUublRyKT90Om51bGx9KTtpZihuLm5vZGVOYW1lKXJldHVybiB0PW4uX0RUX1Jvd0luZGV4LGU9bi5fRFRfQ2VsbEluZGV4LHQhPT1OP2FbdF0mJmFbdF0ublRyPT09bj9bdF06W106ZT9hW2Uucm93XSYmYVtlLnJvd10ublRyPT09bi5wYXJlbnROb2RlP1tlLnJvd106W106KHQ9UChuKS5jbG9zZXN0KCIqW2RhdGEtZHQtcm93XSIpKS5sZW5ndGg/W3QuZGF0YSgiZHQtcm93IildOltdO2lmKCJzdHJpbmciPT10eXBlb2YgbiYmIiMiPT09bi5jaGFyQXQoMCkpe3ZhciBlPXIuYUlkc1tuLnJlcGxhY2UoL14jLywiIildO2lmKGUhPT1OKXJldHVybltlLmlkeF19dD1fKG0oci5hb0RhdGEsaSwiblRyIikpO3JldHVybiBQKHQpLmZpbHRlcihuKS5tYXAoZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5fRFRfUm93SW5kZXh9KS50b0FycmF5KCl9LHI9dCxvPW4pO3ZhciByLG8saX0sMSk7cmV0dXJuIHQuc2VsZWN0b3Iucm93cz1lLHQuc2VsZWN0b3Iub3B0cz1uLHR9KSxlKCJyb3dzKCkubm9kZXMoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigicm93IixmdW5jdGlvbih0LGUpe3JldHVybiB0LmFvRGF0YVtlXS5uVHJ8fE59LDEpfSksZSgicm93cygpLmRhdGEoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcighMCwicm93cyIsZnVuY3Rpb24odCxlKXtyZXR1cm4gbSh0LmFvRGF0YSxlLCJfYURhdGEiKX0sMSl9KSx0KCJyb3dzKCkuY2FjaGUoKSIsInJvdygpLmNhY2hlKCkiLGZ1bmN0aW9uKG4pe3JldHVybiB0aGlzLml0ZXJhdG9yKCJyb3ciLGZ1bmN0aW9uKHQsZSl7dD10LmFvRGF0YVtlXTtyZXR1cm4ic2VhcmNoIj09PW4/dC5fYUZpbHRlckRhdGE6dC5fYVNvcnREYXRhfSwxKX0pLHQoInJvd3MoKS5pbnZhbGlkYXRlKCkiLCJyb3coKS5pbnZhbGlkYXRlKCkiLGZ1bmN0aW9uKG4pe3JldHVybiB0aGlzLml0ZXJhdG9yKCJyb3ciLGZ1bmN0aW9uKHQsZSl7YnQodCxlLG4pfSl9KSx0KCJyb3dzKCkuaW5kZXhlcygpIiwicm93KCkuaW5kZXgoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigicm93IixmdW5jdGlvbih0LGUpe3JldHVybiBlfSwxKX0pLHQoInJvd3MoKS5pZHMoKSIsInJvdygpLmlkKCkiLGZ1bmN0aW9uKHQpe2Zvcih2YXIgZT1bXSxuPXRoaXMuY29udGV4dCxhPTAscj1uLmxlbmd0aDthPHI7YSsrKWZvcih2YXIgbz0wLGk9dGhpc1thXS5sZW5ndGg7bzxpO28rKyl7dmFyIGw9blthXS5yb3dJZEZuKG5bYV0uYW9EYXRhW3RoaXNbYV1bb11dLl9hRGF0YSk7ZS5wdXNoKCghMD09PXQ/IiMiOiIiKStsKX1yZXR1cm4gbmV3IEIobixlKX0pLHQoInJvd3MoKS5yZW1vdmUoKSIsInJvdygpLnJlbW92ZSgpIixmdW5jdGlvbigpe3ZhciBmPXRoaXM7cmV0dXJuIHRoaXMuaXRlcmF0b3IoInJvdyIsZnVuY3Rpb24odCxlLG4pe3ZhciBhLHIsbyxpLGwscyx1PXQuYW9EYXRhLGM9dVtlXTtmb3IodS5zcGxpY2UoZSwxKSxhPTAscj11Lmxlbmd0aDthPHI7YSsrKWlmKHM9KGw9dVthXSkuYW5DZWxscyxudWxsIT09bC5uVHImJihsLm5Uci5fRFRfUm93SW5kZXg9YSksbnVsbCE9PXMpZm9yKG89MCxpPXMubGVuZ3RoO288aTtvKyspc1tvXS5fRFRfQ2VsbEluZGV4LnJvdz1hO2d0KHQuYWlEaXNwbGF5TWFzdGVyLGUpLGd0KHQuYWlEaXNwbGF5LGUpLGd0KGZbbl0sZSwhMSksMDx0Ll9pUmVjb3Jkc0Rpc3BsYXkmJnQuX2lSZWNvcmRzRGlzcGxheS0tLFNlKHQpO249dC5yb3dJZEZuKGMuX2FEYXRhKTtuIT09TiYmZGVsZXRlIHQuYUlkc1tuXX0pLHRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtmb3IodmFyIGU9MCxuPXQuYW9EYXRhLmxlbmd0aDtlPG47ZSsrKXQuYW9EYXRhW2VdLmlkeD1lfSksdGhpc30pLGUoInJvd3MuYWRkKCkiLGZ1bmN0aW9uKG8pe3ZhciB0PXRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtmb3IodmFyIGUsbj1bXSxhPTAscj1vLmxlbmd0aDthPHI7YSsrKShlPW9bYV0pLm5vZGVOYW1lJiYiVFIiPT09ZS5ub2RlTmFtZS50b1VwcGVyQ2FzZSgpP24ucHVzaCh1dCh0LGUpWzBdKTpuLnB1c2goeCh0LGUpKTtyZXR1cm4gbn0sMSksZT10aGlzLnJvd3MoLTEpO3JldHVybiBlLnBvcCgpLFAubWVyZ2UoZSx0KSxlfSksZSgicm93KCkiLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIENlKHRoaXMucm93cyh0LGUpKX0pLGUoInJvdygpLmRhdGEoKSIsZnVuY3Rpb24odCl7dmFyIGUsbj10aGlzLmNvbnRleHQ7cmV0dXJuIHQ9PT1OP24ubGVuZ3RoJiZ0aGlzLmxlbmd0aD9uWzBdLmFvRGF0YVt0aGlzWzBdXS5fYURhdGE6TjooKGU9blswXS5hb0RhdGFbdGhpc1swXV0pLl9hRGF0YT10LEFycmF5LmlzQXJyYXkodCkmJmUublRyJiZlLm5Uci5pZCYmYihuWzBdLnJvd0lkKSh0LGUublRyLmlkKSxidChuWzBdLHRoaXNbMF0sImRhdGEiKSx0aGlzKX0pLGUoInJvdygpLm5vZGUoKSIsZnVuY3Rpb24oKXt2YXIgdD10aGlzLmNvbnRleHQ7cmV0dXJuIHQubGVuZ3RoJiZ0aGlzLmxlbmd0aCYmdFswXS5hb0RhdGFbdGhpc1swXV0ublRyfHxudWxsfSksZSgicm93LmFkZCgpIixmdW5jdGlvbihlKXtlIGluc3RhbmNlb2YgUCYmZS5sZW5ndGgmJihlPWVbMF0pO3ZhciB0PXRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtyZXR1cm4gZS5ub2RlTmFtZSYmIlRSIj09PWUubm9kZU5hbWUudG9VcHBlckNhc2UoKT91dCh0LGUpWzBdOngodCxlKX0pO3JldHVybiB0aGlzLnJvdyh0WzBdKX0pLFAoeSkub24oInBsdWdpbi1pbml0LmR0IixmdW5jdGlvbih0LGUpe3ZhciBuPW5ldyBCKGUpLGE9Im9uLXBsdWdpbi1pbml0IixyPSJzdGF0ZVNhdmVQYXJhbXMuIithLG89ImRlc3Ryb3kuICIrYSxhPShuLm9uKHIsZnVuY3Rpb24odCxlLG4pe2Zvcih2YXIgYT1lLnJvd0lkRm4scj1lLmFvRGF0YSxvPVtdLGk9MDtpPHIubGVuZ3RoO2krKylyW2ldLl9kZXRhaWxzU2hvdyYmby5wdXNoKCIjIithKHJbaV0uX2FEYXRhKSk7bi5jaGlsZFJvd3M9b30pLG4ub24obyxmdW5jdGlvbigpe24ub2ZmKHIrIiAiK28pfSksbi5zdGF0ZS5sb2FkZWQoKSk7YSYmYS5jaGlsZFJvd3MmJm4ucm93cyhQLm1hcChhLmNoaWxkUm93cyxmdW5jdGlvbih0KXtyZXR1cm4gdC5yZXBsYWNlKC86L2csIlxcOiIpfSkpLmV2ZXJ5KGZ1bmN0aW9uKCl7UihlLG51bGwsInJlcXVlc3RDaGlsZCIsW3RoaXNdKX0pfSksdy51dGlsLnRocm90dGxlKGZ1bmN0aW9uKHQpe2RlKHRbMF0pfSw1MDApKSxSZT1mdW5jdGlvbih0LGUpe3ZhciBuPXQuY29udGV4dDtuLmxlbmd0aCYmKGU9blswXS5hb0RhdGFbZSE9PU4/ZTp0WzBdXSkmJmUuX2RldGFpbHMmJihlLl9kZXRhaWxzLnJlbW92ZSgpLGUuX2RldGFpbHNTaG93PU4sZS5fZGV0YWlscz1OLFAoZS5uVHIpLnJlbW92ZUNsYXNzKCJkdC1oYXNDaGlsZCIpLExlKG4pKX0sUGU9InJvdygpLmNoaWxkIixqZT1QZSsiKCkiLE5lPShlKGplLGZ1bmN0aW9uKHQsZSl7dmFyIG49dGhpcy5jb250ZXh0O3JldHVybiB0PT09Tj9uLmxlbmd0aCYmdGhpcy5sZW5ndGg/blswXS5hb0RhdGFbdGhpc1swXV0uX2RldGFpbHM6TjooITA9PT10P3RoaXMuY2hpbGQuc2hvdygpOiExPT09dD9SZSh0aGlzKTpuLmxlbmd0aCYmdGhpcy5sZW5ndGgmJlRlKG5bMF0sblswXS5hb0RhdGFbdGhpc1swXV0sdCxlKSx0aGlzKX0pLGUoW1BlKyIuc2hvdygpIixqZSsiLnNob3coKSJdLGZ1bmN0aW9uKHQpe3JldHVybiB4ZSh0aGlzLCEwKSx0aGlzfSksZShbUGUrIi5oaWRlKCkiLGplKyIuaGlkZSgpIl0sZnVuY3Rpb24oKXtyZXR1cm4geGUodGhpcywhMSksdGhpc30pLGUoW1BlKyIucmVtb3ZlKCkiLGplKyIucmVtb3ZlKCkiXSxmdW5jdGlvbigpe3JldHVybiBSZSh0aGlzKSx0aGlzfSksZShQZSsiLmlzU2hvd24oKSIsZnVuY3Rpb24oKXt2YXIgdD10aGlzLmNvbnRleHQ7cmV0dXJuIHQubGVuZ3RoJiZ0aGlzLmxlbmd0aCYmdFswXS5hb0RhdGFbdGhpc1swXV0uX2RldGFpbHNTaG93fHwhMX0pLC9eKFteOl0rKToobmFtZXx2aXNJZHh8dmlzaWJsZSkkLyksSGU9KGUoImNvbHVtbnMoKSIsZnVuY3Rpb24obixhKXtuPT09Tj9uPSIiOlAuaXNQbGFpbk9iamVjdChuKSYmKGE9bixuPSIiKSxhPXdlKGEpO3ZhciB0PXRoaXMuaXRlcmF0b3IoInRhYmxlIixmdW5jdGlvbih0KXtyZXR1cm4gZT1uLGw9YSxzPShpPXQpLmFvQ29sdW1ucyx1PUgocywic05hbWUiKSxjPUgocywiblRoIiksX2UoImNvbHVtbiIsZSxmdW5jdGlvbihuKXt2YXIgYSx0PWQobik7aWYoIiI9PT1uKXJldHVybiBmKHMubGVuZ3RoKTtpZihudWxsIT09dClyZXR1cm5bMDw9dD90OnMubGVuZ3RoK3RdO2lmKCJmdW5jdGlvbiI9PXR5cGVvZiBuKXJldHVybiBhPUZlKGksbCksUC5tYXAocyxmdW5jdGlvbih0LGUpe3JldHVybiBuKGUsQWUoaSxlLDAsMCxhKSxjW2VdKT9lOm51bGx9KTt2YXIgcj0ic3RyaW5nIj09dHlwZW9mIG4/bi5tYXRjaChOZSk6IiI7aWYocilzd2l0Y2goclsyXSl7Y2FzZSJ2aXNJZHgiOmNhc2UidmlzaWJsZSI6dmFyIGUsbz1wYXJzZUludChyWzFdLDEwKTtyZXR1cm4gbzwwP1soZT1QLm1hcChzLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQuYlZpc2libGU/ZTpudWxsfSkpW2UubGVuZ3RoK29dXTpbcnQoaSxvKV07Y2FzZSJuYW1lIjpyZXR1cm4gUC5tYXAodSxmdW5jdGlvbih0LGUpe3JldHVybiB0PT09clsxXT9lOm51bGx9KTtkZWZhdWx0OnJldHVybltdfXJldHVybiBuLm5vZGVOYW1lJiZuLl9EVF9DZWxsSW5kZXg/W24uX0RUX0NlbGxJbmRleC5jb2x1bW5dOih0PVAoYykuZmlsdGVyKG4pLm1hcChmdW5jdGlvbigpe3JldHVybiBQLmluQXJyYXkodGhpcyxjKX0pLnRvQXJyYXkoKSkubGVuZ3RofHwhbi5ub2RlTmFtZT90Oih0PVAobikuY2xvc2VzdCgiKltkYXRhLWR0LWNvbHVtbl0iKSkubGVuZ3RoP1t0LmRhdGEoImR0LWNvbHVtbiIpXTpbXX0saSxsKTt2YXIgaSxlLGwscyx1LGN9LDEpO3JldHVybiB0LnNlbGVjdG9yLmNvbHM9bix0LnNlbGVjdG9yLm9wdHM9YSx0fSksdCgiY29sdW1ucygpLmhlYWRlcigpIiwiY29sdW1uKCkuaGVhZGVyKCkiLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoImNvbHVtbiIsZnVuY3Rpb24odCxlKXtyZXR1cm4gdC5hb0NvbHVtbnNbZV0ublRofSwxKX0pLHQoImNvbHVtbnMoKS5mb290ZXIoKSIsImNvbHVtbigpLmZvb3RlcigpIixmdW5jdGlvbih0LGUpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJjb2x1bW4iLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQuYW9Db2x1bW5zW2VdLm5UZn0sMSl9KSx0KCJjb2x1bW5zKCkuZGF0YSgpIiwiY29sdW1uKCkuZGF0YSgpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJjb2x1bW4tcm93cyIsQWUsMSl9KSx0KCJjb2x1bW5zKCkuZGF0YVNyYygpIiwiY29sdW1uKCkuZGF0YVNyYygpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJjb2x1bW4iLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQuYW9Db2x1bW5zW2VdLm1EYXRhfSwxKX0pLHQoImNvbHVtbnMoKS5jYWNoZSgpIiwiY29sdW1uKCkuY2FjaGUoKSIsZnVuY3Rpb24obyl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoImNvbHVtbi1yb3dzIixmdW5jdGlvbih0LGUsbixhLHIpe3JldHVybiBtKHQuYW9EYXRhLHIsInNlYXJjaCI9PT1vPyJfYUZpbHRlckRhdGEiOiJfYVNvcnREYXRhIixlKX0sMSl9KSx0KCJjb2x1bW5zKCkubm9kZXMoKSIsImNvbHVtbigpLm5vZGVzKCkiLGZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoImNvbHVtbi1yb3dzIixmdW5jdGlvbih0LGUsbixhLHIpe3JldHVybiBtKHQuYW9EYXRhLHIsImFuQ2VsbHMiLGUpfSwxKX0pLHQoImNvbHVtbnMoKS52aXNpYmxlKCkiLCJjb2x1bW4oKS52aXNpYmxlKCkiLGZ1bmN0aW9uKGYsbil7dmFyIGU9dGhpcyx0PXRoaXMuaXRlcmF0b3IoImNvbHVtbiIsZnVuY3Rpb24odCxlKXtpZihmPT09TilyZXR1cm4gdC5hb0NvbHVtbnNbZV0uYlZpc2libGU7dmFyIG4sYSxyPWUsZT1mLG89dC5hb0NvbHVtbnMsaT1vW3JdLGw9dC5hb0RhdGE7aWYoZT09PU4paS5iVmlzaWJsZTtlbHNlIGlmKGkuYlZpc2libGUhPT1lKXtpZihlKWZvcih2YXIgcz1QLmluQXJyYXkoITAsSChvLCJiVmlzaWJsZSIpLHIrMSksdT0wLGM9bC5sZW5ndGg7dTxjO3UrKylhPWxbdV0ublRyLG49bFt1XS5hbkNlbGxzLGEmJmEuaW5zZXJ0QmVmb3JlKG5bcl0sbltzXXx8bnVsbCk7ZWxzZSBQKEgodC5hb0RhdGEsImFuQ2VsbHMiLHIpKS5kZXRhY2goKTtpLmJWaXNpYmxlPWV9fSk7cmV0dXJuIGYhPT1OJiZ0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7RHQodCx0LmFvSGVhZGVyKSxEdCh0LHQuYW9Gb290ZXIpLHQuYWlEaXNwbGF5Lmxlbmd0aHx8UCh0Lm5UQm9keSkuZmluZCgidGRbY29sc3Bhbl0iKS5hdHRyKCJjb2xzcGFuIixUKHQpKSxkZSh0KSxlLml0ZXJhdG9yKCJjb2x1bW4iLGZ1bmN0aW9uKHQsZSl7Uih0LG51bGwsImNvbHVtbi12aXNpYmlsaXR5IixbdCxlLGYsbl0pfSksbiE9PU4mJiFufHxlLmNvbHVtbnMuYWRqdXN0KCl9KSx0fSksdCgiY29sdW1ucygpLmluZGV4ZXMoKSIsImNvbHVtbigpLmluZGV4KCkiLGZ1bmN0aW9uKG4pe3JldHVybiB0aGlzLml0ZXJhdG9yKCJjb2x1bW4iLGZ1bmN0aW9uKHQsZSl7cmV0dXJuInZpc2libGUiPT09bj9vdCh0LGUpOmV9LDEpfSksZSgiY29sdW1ucy5hZGp1c3QoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe08odCl9LDEpfSksZSgiY29sdW1uLmluZGV4KCkiLGZ1bmN0aW9uKHQsZSl7dmFyIG47aWYoMCE9PXRoaXMuY29udGV4dC5sZW5ndGgpcmV0dXJuIG49dGhpcy5jb250ZXh0WzBdLCJmcm9tVmlzaWJsZSI9PT10fHwidG9EYXRhIj09PXQ/cnQobixlKToiZnJvbURhdGEiPT09dHx8InRvVmlzaWJsZSI9PT10P290KG4sZSk6dm9pZCAwfSksZSgiY29sdW1uKCkiLGZ1bmN0aW9uKHQsZSl7cmV0dXJuIENlKHRoaXMuY29sdW1ucyh0LGUpKX0pLGUoImNlbGxzKCkiLGZ1bmN0aW9uKGcsdCxiKXt2YXIgYSxyLG8saSxsLHMsZTtyZXR1cm4gUC5pc1BsYWluT2JqZWN0KGcpJiYoZy5yb3c9PT1OPyhiPWcsZz1udWxsKTooYj10LHQ9bnVsbCkpLFAuaXNQbGFpbk9iamVjdCh0KSYmKGI9dCx0PW51bGwpLG51bGw9PT10fHx0PT09Tj90aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7cmV0dXJuIGE9dCx0PWcsZT13ZShiKSxmPWEuYW9EYXRhLGQ9RmUoYSxlKSxuPV8obShmLGQsImFuQ2VsbHMiKSksaD1QKFkoW10sbikpLHA9YS5hb0NvbHVtbnMubGVuZ3RoLF9lKCJjZWxsIix0LGZ1bmN0aW9uKHQpe3ZhciBlLG49ImZ1bmN0aW9uIj09dHlwZW9mIHQ7aWYobnVsbD09PXR8fHQ9PT1OfHxuKXtmb3Iobz1bXSxpPTAsbD1kLmxlbmd0aDtpPGw7aSsrKWZvcihyPWRbaV0scz0wO3M8cDtzKyspdT17cm93OnIsY29sdW1uOnN9LCghbnx8KGM9ZltyXSx0KHUsUyhhLHIscyksYy5hbkNlbGxzP2MuYW5DZWxsc1tzXTpudWxsKSkpJiZvLnB1c2godSk7cmV0dXJuIG99cmV0dXJuIFAuaXNQbGFpbk9iamVjdCh0KT90LmNvbHVtbiE9PU4mJnQucm93IT09TiYmLTEhPT1QLmluQXJyYXkodC5yb3csZCk/W3RdOltdOihlPWguZmlsdGVyKHQpLm1hcChmdW5jdGlvbih0LGUpe3JldHVybntyb3c6ZS5fRFRfQ2VsbEluZGV4LnJvdyxjb2x1bW46ZS5fRFRfQ2VsbEluZGV4LmNvbHVtbn19KS50b0FycmF5KCkpLmxlbmd0aHx8IXQubm9kZU5hbWU/ZTooYz1QKHQpLmNsb3Nlc3QoIipbZGF0YS1kdC1yb3ddIikpLmxlbmd0aD9be3JvdzpjLmRhdGEoImR0LXJvdyIpLGNvbHVtbjpjLmRhdGEoImR0LWNvbHVtbiIpfV06W119LGEsZSk7dmFyIGEsZSxyLG8saSxsLHMsdSxjLGYsZCxuLGgscH0pOihlPWI/e3BhZ2U6Yi5wYWdlLG9yZGVyOmIub3JkZXIsc2VhcmNoOmIuc2VhcmNofTp7fSxhPXRoaXMuY29sdW1ucyh0LGUpLHI9dGhpcy5yb3dzKGcsZSksZT10aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCxlKXt2YXIgbj1bXTtmb3Iobz0wLGk9cltlXS5sZW5ndGg7bzxpO28rKylmb3IobD0wLHM9YVtlXS5sZW5ndGg7bDxzO2wrKyluLnB1c2goe3JvdzpyW2VdW29dLGNvbHVtbjphW2VdW2xdfSk7cmV0dXJuIG59LDEpLGU9YiYmYi5zZWxlY3RlZD90aGlzLmNlbGxzKGUsYik6ZSxQLmV4dGVuZChlLnNlbGVjdG9yLHtjb2xzOnQscm93czpnLG9wdHM6Yn0pLGUpfSksdCgiY2VsbHMoKS5ub2RlcygpIiwiY2VsbCgpLm5vZGUoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigiY2VsbCIsZnVuY3Rpb24odCxlLG4pe3Q9dC5hb0RhdGFbZV07cmV0dXJuIHQmJnQuYW5DZWxscz90LmFuQ2VsbHNbbl06Tn0sMSl9KSxlKCJjZWxscygpLmRhdGEoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigiY2VsbCIsZnVuY3Rpb24odCxlLG4pe3JldHVybiBTKHQsZSxuKX0sMSl9KSx0KCJjZWxscygpLmNhY2hlKCkiLCJjZWxsKCkuY2FjaGUoKSIsZnVuY3Rpb24oYSl7cmV0dXJuIGE9InNlYXJjaCI9PT1hPyJfYUZpbHRlckRhdGEiOiJfYVNvcnREYXRhIix0aGlzLml0ZXJhdG9yKCJjZWxsIixmdW5jdGlvbih0LGUsbil7cmV0dXJuIHQuYW9EYXRhW2VdW2FdW25dfSwxKX0pLHQoImNlbGxzKCkucmVuZGVyKCkiLCJjZWxsKCkucmVuZGVyKCkiLGZ1bmN0aW9uKGEpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJjZWxsIixmdW5jdGlvbih0LGUsbil7cmV0dXJuIFModCxlLG4sYSl9LDEpfSksdCgiY2VsbHMoKS5pbmRleGVzKCkiLCJjZWxsKCkuaW5kZXgoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigiY2VsbCIsZnVuY3Rpb24odCxlLG4pe3JldHVybntyb3c6ZSxjb2x1bW46bixjb2x1bW5WaXNpYmxlOm90KHQsbil9fSwxKX0pLHQoImNlbGxzKCkuaW52YWxpZGF0ZSgpIiwiY2VsbCgpLmludmFsaWRhdGUoKSIsZnVuY3Rpb24oYSl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoImNlbGwiLGZ1bmN0aW9uKHQsZSxuKXtidCh0LGUsYSxuKX0pfSksZSgiY2VsbCgpIixmdW5jdGlvbih0LGUsbil7cmV0dXJuIENlKHRoaXMuY2VsbHModCxlLG4pKX0pLGUoImNlbGwoKS5kYXRhKCkiLGZ1bmN0aW9uKHQpe3ZhciBlPXRoaXMuY29udGV4dCxuPXRoaXNbMF07cmV0dXJuIHQ9PT1OP2UubGVuZ3RoJiZuLmxlbmd0aD9TKGVbMF0sblswXS5yb3csblswXS5jb2x1bW4pOk46KGN0KGVbMF0sblswXS5yb3csblswXS5jb2x1bW4sdCksYnQoZVswXSxuWzBdLnJvdywiZGF0YSIsblswXS5jb2x1bW4pLHRoaXMpfSksZSgib3JkZXIoKSIsZnVuY3Rpb24oZSx0KXt2YXIgbj10aGlzLmNvbnRleHQ7cmV0dXJuIGU9PT1OPzAhPT1uLmxlbmd0aD9uWzBdLmFhU29ydGluZzpOOigibnVtYmVyIj09dHlwZW9mIGU/ZT1bW2UsdF1dOmUubGVuZ3RoJiYhQXJyYXkuaXNBcnJheShlWzBdKSYmKGU9QXJyYXkucHJvdG90eXBlLnNsaWNlLmNhbGwoYXJndW1lbnRzKSksdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe3QuYWFTb3J0aW5nPWUuc2xpY2UoKX0pKX0pLGUoIm9yZGVyLmxpc3RlbmVyKCkiLGZ1bmN0aW9uKGUsbixhKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe3VlKHQsZSxuLGEpfSl9KSxlKCJvcmRlci5maXhlZCgpIixmdW5jdGlvbihlKXt2YXIgdDtyZXR1cm4gZT90aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7dC5hYVNvcnRpbmdGaXhlZD1QLmV4dGVuZCghMCx7fSxlKX0pOih0PSh0PXRoaXMuY29udGV4dCkubGVuZ3RoP3RbMF0uYWFTb3J0aW5nRml4ZWQ6TixBcnJheS5pc0FycmF5KHQpP3twcmU6dH06dCl9KSxlKFsiY29sdW1ucygpLm9yZGVyKCkiLCJjb2x1bW4oKS5vcmRlcigpIl0sZnVuY3Rpb24oYSl7dmFyIHI9dGhpcztyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQsZSl7dmFyIG49W107UC5lYWNoKHJbZV0sZnVuY3Rpb24odCxlKXtuLnB1c2goW2UsYV0pfSksdC5hYVNvcnRpbmc9bn0pfSksZSgic2VhcmNoKCkiLGZ1bmN0aW9uKGUsbixhLHIpe3ZhciB0PXRoaXMuY29udGV4dDtyZXR1cm4gZT09PU4/MCE9PXQubGVuZ3RoP3RbMF0ub1ByZXZpb3VzU2VhcmNoLnNTZWFyY2g6Tjp0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7dC5vRmVhdHVyZXMuYkZpbHRlciYmUnQodCxQLmV4dGVuZCh7fSx0Lm9QcmV2aW91c1NlYXJjaCx7c1NlYXJjaDplKyIiLGJSZWdleDpudWxsIT09biYmbixiU21hcnQ6bnVsbD09PWF8fGEsYkNhc2VJbnNlbnNpdGl2ZTpudWxsPT09cnx8cn0pLDEpfSl9KSx0KCJjb2x1bW5zKCkuc2VhcmNoKCkiLCJjb2x1bW4oKS5zZWFyY2goKSIsZnVuY3Rpb24oYSxyLG8saSl7cmV0dXJuIHRoaXMuaXRlcmF0b3IoImNvbHVtbiIsZnVuY3Rpb24odCxlKXt2YXIgbj10LmFvUHJlU2VhcmNoQ29scztpZihhPT09TilyZXR1cm4gbltlXS5zU2VhcmNoO3Qub0ZlYXR1cmVzLmJGaWx0ZXImJihQLmV4dGVuZChuW2VdLHtzU2VhcmNoOmErIiIsYlJlZ2V4Om51bGwhPT1yJiZyLGJTbWFydDpudWxsPT09b3x8byxiQ2FzZUluc2Vuc2l0aXZlOm51bGw9PT1pfHxpfSksUnQodCx0Lm9QcmV2aW91c1NlYXJjaCwxKSl9KX0pLGUoInN0YXRlKCkiLGZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuY29udGV4dC5sZW5ndGg/dGhpcy5jb250ZXh0WzBdLm9TYXZlZFN0YXRlOm51bGx9KSxlKCJzdGF0ZS5jbGVhcigpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7dC5mblN0YXRlU2F2ZUNhbGxiYWNrLmNhbGwodC5vSW5zdGFuY2UsdCx7fSl9KX0pLGUoInN0YXRlLmxvYWRlZCgpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLmNvbnRleHQubGVuZ3RoP3RoaXMuY29udGV4dFswXS5vTG9hZGVkU3RhdGU6bnVsbH0pLGUoInN0YXRlLnNhdmUoKSIsZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5pdGVyYXRvcigidGFibGUiLGZ1bmN0aW9uKHQpe2RlKHQpfSl9KSx3LnVzZT1mdW5jdGlvbih0LGUpeyJsaWIiPT09ZXx8dC5mbj9QPXQ6IndpbiIhPWUmJiF0LmRvY3VtZW50fHwoeT0oaj10KS5kb2N1bWVudCl9LHcuZmFjdG9yeT1mdW5jdGlvbih0LGUpe3ZhciBuPSExO3JldHVybiB0JiZ0LmRvY3VtZW50JiYoeT0oaj10KS5kb2N1bWVudCksZSYmZS5mbiYmZS5mbi5qcXVlcnkmJihQPWUsbj0hMCksbn0sdy52ZXJzaW9uQ2hlY2s9dy5mblZlcnNpb25DaGVjaz1mdW5jdGlvbih0KXtmb3IodmFyIGUsbixhPXcudmVyc2lvbi5zcGxpdCgiLiIpLHI9dC5zcGxpdCgiLiIpLG89MCxpPXIubGVuZ3RoO288aTtvKyspaWYoKGU9cGFyc2VJbnQoYVtvXSwxMCl8fDApIT09KG49cGFyc2VJbnQocltvXSwxMCl8fDApKXJldHVybiBuPGU7cmV0dXJuITB9LHcuaXNEYXRhVGFibGU9dy5mbklzRGF0YVRhYmxlPWZ1bmN0aW9uKHQpe3ZhciByPVAodCkuZ2V0KDApLG89ITE7cmV0dXJuIHQgaW5zdGFuY2VvZiB3LkFwaXx8KFAuZWFjaCh3LnNldHRpbmdzLGZ1bmN0aW9uKHQsZSl7dmFyIG49ZS5uU2Nyb2xsSGVhZD9QKCJ0YWJsZSIsZS5uU2Nyb2xsSGVhZClbMF06bnVsbCxhPWUublNjcm9sbEZvb3Q/UCgidGFibGUiLGUublNjcm9sbEZvb3QpWzBdOm51bGw7ZS5uVGFibGUhPT1yJiZuIT09ciYmYSE9PXJ8fChvPSEwKX0pLG8pfSx3LnRhYmxlcz13LmZuVGFibGVzPWZ1bmN0aW9uKGUpe3ZhciB0PSExLG49KFAuaXNQbGFpbk9iamVjdChlKSYmKHQ9ZS5hcGksZT1lLnZpc2libGUpLFAubWFwKHcuc2V0dGluZ3MsZnVuY3Rpb24odCl7aWYoIWV8fFAodC5uVGFibGUpLmlzKCI6dmlzaWJsZSIpKXJldHVybiB0Lm5UYWJsZX0pKTtyZXR1cm4gdD9uZXcgQihuKTpufSx3LmNhbWVsVG9IdW5nYXJpYW49QyxlKCIkKCkiLGZ1bmN0aW9uKHQsZSl7ZT10aGlzLnJvd3MoZSkubm9kZXMoKSxlPVAoZSk7cmV0dXJuIFAoW10uY29uY2F0KGUuZmlsdGVyKHQpLnRvQXJyYXkoKSxlLmZpbmQodCkudG9BcnJheSgpKSl9KSxQLmVhY2goWyJvbiIsIm9uZSIsIm9mZiJdLGZ1bmN0aW9uKHQsbil7ZShuKyIoKSIsZnVuY3Rpb24oKXt2YXIgdD1BcnJheS5wcm90b3R5cGUuc2xpY2UuY2FsbChhcmd1bWVudHMpLGU9KHRbMF09UC5tYXAodFswXS5zcGxpdCgvXHMvKSxmdW5jdGlvbih0KXtyZXR1cm4gdC5tYXRjaCgvXC5kdFxiLyk/dDp0KyIuZHQifSkuam9pbigiICIpLFAodGhpcy50YWJsZXMoKS5ub2RlcygpKSk7cmV0dXJuIGVbbl0uYXBwbHkoZSx0KSx0aGlzfSl9KSxlKCJjbGVhcigpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7cHQodCl9KX0pLGUoInNldHRpbmdzKCkiLGZ1bmN0aW9uKCl7cmV0dXJuIG5ldyBCKHRoaXMuY29udGV4dCx0aGlzLmNvbnRleHQpfSksZSgiaW5pdCgpIixmdW5jdGlvbigpe3ZhciB0PXRoaXMuY29udGV4dDtyZXR1cm4gdC5sZW5ndGg/dFswXS5vSW5pdDpudWxsfSksZSgiZGF0YSgpIixmdW5jdGlvbigpe3JldHVybiB0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24odCl7cmV0dXJuIEgodC5hb0RhdGEsIl9hRGF0YSIpfSkuZmxhdHRlbigpfSksZSgiZGVzdHJveSgpIixmdW5jdGlvbihjKXtyZXR1cm4gYz1jfHwhMSx0aGlzLml0ZXJhdG9yKCJ0YWJsZSIsZnVuY3Rpb24oZSl7dmFyIG4sdD1lLm9DbGFzc2VzLGE9ZS5uVGFibGUscj1lLm5UQm9keSxvPWUublRIZWFkLGk9ZS5uVEZvb3QsbD1QKGEpLHI9UChyKSxzPVAoZS5uVGFibGVXcmFwcGVyKSx1PVAubWFwKGUuYW9EYXRhLGZ1bmN0aW9uKHQpe3JldHVybiB0Lm5Ucn0pLGk9KGUuYkRlc3Ryb3lpbmc9ITAsUihlLCJhb0Rlc3Ryb3lDYWxsYmFjayIsImRlc3Ryb3kiLFtlXSksY3x8bmV3IEIoZSkuY29sdW1ucygpLnZpc2libGUoITApLHMub2ZmKCIuRFQiKS5maW5kKCI6bm90KHRib2R5ICopIikub2ZmKCIuRFQiKSxQKGopLm9mZigiLkRULSIrZS5zSW5zdGFuY2UpLGEhPW8ucGFyZW50Tm9kZSYmKGwuY2hpbGRyZW4oInRoZWFkIikuZGV0YWNoKCksbC5hcHBlbmQobykpLGkmJmEhPWkucGFyZW50Tm9kZSYmKGwuY2hpbGRyZW4oInRmb290IikuZGV0YWNoKCksbC5hcHBlbmQoaSkpLGUuYWFTb3J0aW5nPVtdLGUuYWFTb3J0aW5nRml4ZWQ9W10sY2UoZSksUCh1KS5yZW1vdmVDbGFzcyhlLmFzU3RyaXBlQ2xhc3Nlcy5qb2luKCIgIikpLFAoInRoLCB0ZCIsbykucmVtb3ZlQ2xhc3ModC5zU29ydGFibGUrIiAiK3Quc1NvcnRhYmxlQXNjKyIgIit0LnNTb3J0YWJsZURlc2MrIiAiK3Quc1NvcnRhYmxlTm9uZSksci5jaGlsZHJlbigpLmRldGFjaCgpLHIuYXBwZW5kKHUpLGUublRhYmxlV3JhcHBlci5wYXJlbnROb2RlKSxvPWM/InJlbW92ZSI6ImRldGFjaCIsdT0obFtvXSgpLHNbb10oKSwhYyYmaSYmKGkuaW5zZXJ0QmVmb3JlKGEsZS5uVGFibGVSZWluc2VydEJlZm9yZSksbC5jc3MoIndpZHRoIixlLnNEZXN0cm95V2lkdGgpLnJlbW92ZUNsYXNzKHQuc1RhYmxlKSxuPWUuYXNEZXN0cm95U3RyaXBlcy5sZW5ndGgpJiZyLmNoaWxkcmVuKCkuZWFjaChmdW5jdGlvbih0KXtQKHRoaXMpLmFkZENsYXNzKGUuYXNEZXN0cm95U3RyaXBlc1t0JW5dKX0pLFAuaW5BcnJheShlLHcuc2V0dGluZ3MpKTstMSE9PXUmJncuc2V0dGluZ3Muc3BsaWNlKHUsMSl9KX0pLFAuZWFjaChbImNvbHVtbiIsInJvdyIsImNlbGwiXSxmdW5jdGlvbih0LHMpe2UocysicygpLmV2ZXJ5KCkiLGZ1bmN0aW9uKG8pe3ZhciBpPXRoaXMuc2VsZWN0b3Iub3B0cyxsPXRoaXM7cmV0dXJuIHRoaXMuaXRlcmF0b3IocyxmdW5jdGlvbih0LGUsbixhLHIpe28uY2FsbChsW3NdKGUsImNlbGwiPT09cz9uOmksImNlbGwiPT09cz9pOk4pLGUsbixhLHIpfSl9KX0pLGUoImkxOG4oKSIsZnVuY3Rpb24odCxlLG4pe3ZhciBhPXRoaXMuY29udGV4dFswXSx0PUEodCkoYS5vTGFuZ3VhZ2UpO3JldHVybiB0PT09TiYmKHQ9ZSksKHQ9biE9PU4mJlAuaXNQbGFpbk9iamVjdCh0KT90W25dIT09Tj90W25dOnQuXzp0KS5yZXBsYWNlKCIlZCIsbil9KSx3LnZlcnNpb249IjEuMTMuNCIsdy5zZXR0aW5ncz1bXSx3Lm1vZGVscz17fSx3Lm1vZGVscy5vU2VhcmNoPXtiQ2FzZUluc2Vuc2l0aXZlOiEwLHNTZWFyY2g6IiIsYlJlZ2V4OiExLGJTbWFydDohMCxyZXR1cm46ITF9LHcubW9kZWxzLm9Sb3c9e25UcjpudWxsLGFuQ2VsbHM6bnVsbCxfYURhdGE6W10sX2FTb3J0RGF0YTpudWxsLF9hRmlsdGVyRGF0YTpudWxsLF9zRmlsdGVyUm93Om51bGwsX3NSb3dTdHJpcGU6IiIsc3JjOm51bGwsaWR4Oi0xfSx3Lm1vZGVscy5vQ29sdW1uPXtpZHg6bnVsbCxhRGF0YVNvcnQ6bnVsbCxhc1NvcnRpbmc6bnVsbCxiU2VhcmNoYWJsZTpudWxsLGJTb3J0YWJsZTpudWxsLGJWaXNpYmxlOm51bGwsX3NNYW51YWxUeXBlOm51bGwsX2JBdHRyU3JjOiExLGZuQ3JlYXRlZENlbGw6bnVsbCxmbkdldERhdGE6bnVsbCxmblNldERhdGE6bnVsbCxtRGF0YTpudWxsLG1SZW5kZXI6bnVsbCxuVGg6bnVsbCxuVGY6bnVsbCxzQ2xhc3M6bnVsbCxzQ29udGVudFBhZGRpbmc6bnVsbCxzRGVmYXVsdENvbnRlbnQ6bnVsbCxzTmFtZTpudWxsLHNTb3J0RGF0YVR5cGU6InN0ZCIsc1NvcnRpbmdDbGFzczpudWxsLHNTb3J0aW5nQ2xhc3NKVUk6bnVsbCxzVGl0bGU6bnVsbCxzVHlwZTpudWxsLHNXaWR0aDpudWxsLHNXaWR0aE9yaWc6bnVsbH0sdy5kZWZhdWx0cz17YWFEYXRhOm51bGwsYWFTb3J0aW5nOltbMCwiYXNjIl1dLGFhU29ydGluZ0ZpeGVkOltdLGFqYXg6bnVsbCxhTGVuZ3RoTWVudTpbMTAsMjUsNTAsMTAwXSxhb0NvbHVtbnM6bnVsbCxhb0NvbHVtbkRlZnM6bnVsbCxhb1NlYXJjaENvbHM6W10sYXNTdHJpcGVDbGFzc2VzOm51bGwsYkF1dG9XaWR0aDohMCxiRGVmZXJSZW5kZXI6ITEsYkRlc3Ryb3k6ITEsYkZpbHRlcjohMCxiSW5mbzohMCxiTGVuZ3RoQ2hhbmdlOiEwLGJQYWdpbmF0ZTohMCxiUHJvY2Vzc2luZzohMSxiUmV0cmlldmU6ITEsYlNjcm9sbENvbGxhcHNlOiExLGJTZXJ2ZXJTaWRlOiExLGJTb3J0OiEwLGJTb3J0TXVsdGk6ITAsYlNvcnRDZWxsc1RvcDohMSxiU29ydENsYXNzZXM6ITAsYlN0YXRlU2F2ZTohMSxmbkNyZWF0ZWRSb3c6bnVsbCxmbkRyYXdDYWxsYmFjazpudWxsLGZuRm9vdGVyQ2FsbGJhY2s6bnVsbCxmbkZvcm1hdE51bWJlcjpmdW5jdGlvbih0KXtyZXR1cm4gdC50b1N0cmluZygpLnJlcGxhY2UoL1xCKD89KFxkezN9KSsoPyFcZCkpL2csdGhpcy5vTGFuZ3VhZ2Uuc1Rob3VzYW5kcyl9LGZuSGVhZGVyQ2FsbGJhY2s6bnVsbCxmbkluZm9DYWxsYmFjazpudWxsLGZuSW5pdENvbXBsZXRlOm51bGwsZm5QcmVEcmF3Q2FsbGJhY2s6bnVsbCxmblJvd0NhbGxiYWNrOm51bGwsZm5TZXJ2ZXJEYXRhOm51bGwsZm5TZXJ2ZXJQYXJhbXM6bnVsbCxmblN0YXRlTG9hZENhbGxiYWNrOmZ1bmN0aW9uKHQpe3RyeXtyZXR1cm4gSlNPTi5wYXJzZSgoLTE9PT10LmlTdGF0ZUR1cmF0aW9uP3Nlc3Npb25TdG9yYWdlOmxvY2FsU3RvcmFnZSkuZ2V0SXRlbSgiRGF0YVRhYmxlc18iK3Quc0luc3RhbmNlKyJfIitsb2NhdGlvbi5wYXRobmFtZSkpfWNhdGNoKHQpe3JldHVybnt9fX0sZm5TdGF0ZUxvYWRQYXJhbXM6bnVsbCxmblN0YXRlTG9hZGVkOm51bGwsZm5TdGF0ZVNhdmVDYWxsYmFjazpmdW5jdGlvbih0LGUpe3RyeXsoLTE9PT10LmlTdGF0ZUR1cmF0aW9uP3Nlc3Npb25TdG9yYWdlOmxvY2FsU3RvcmFnZSkuc2V0SXRlbSgiRGF0YVRhYmxlc18iK3Quc0luc3RhbmNlKyJfIitsb2NhdGlvbi5wYXRobmFtZSxKU09OLnN0cmluZ2lmeShlKSl9Y2F0Y2godCl7fX0sZm5TdGF0ZVNhdmVQYXJhbXM6bnVsbCxpU3RhdGVEdXJhdGlvbjo3MjAwLGlEZWZlckxvYWRpbmc6bnVsbCxpRGlzcGxheUxlbmd0aDoxMCxpRGlzcGxheVN0YXJ0OjAsaVRhYkluZGV4OjAsb0NsYXNzZXM6e30sb0xhbmd1YWdlOntvQXJpYTp7c1NvcnRBc2NlbmRpbmc6IjogYWN0aXZhdGUgdG8gc29ydCBjb2x1bW4gYXNjZW5kaW5nIixzU29ydERlc2NlbmRpbmc6IjogYWN0aXZhdGUgdG8gc29ydCBjb2x1bW4gZGVzY2VuZGluZyJ9LG9QYWdpbmF0ZTp7c0ZpcnN0OiJGaXJzdCIsc0xhc3Q6Ikxhc3QiLHNOZXh0OiJOZXh0IixzUHJldmlvdXM6IlByZXZpb3VzIn0sc0VtcHR5VGFibGU6Ik5vIGRhdGEgYXZhaWxhYmxlIGluIHRhYmxlIixzSW5mbzoiU2hvd2luZyBfU1RBUlRfIHRvIF9FTkRfIG9mIF9UT1RBTF8gZW50cmllcyIsc0luZm9FbXB0eToiU2hvd2luZyAwIHRvIDAgb2YgMCBlbnRyaWVzIixzSW5mb0ZpbHRlcmVkOiIoZmlsdGVyZWQgZnJvbSBfTUFYXyB0b3RhbCBlbnRyaWVzKSIsc0luZm9Qb3N0Rml4OiIiLHNEZWNpbWFsOiIiLHNUaG91c2FuZHM6IiwiLHNMZW5ndGhNZW51OiJTaG93IF9NRU5VXyBlbnRyaWVzIixzTG9hZGluZ1JlY29yZHM6IkxvYWRpbmcuLi4iLHNQcm9jZXNzaW5nOiIiLHNTZWFyY2g6IlNlYXJjaDoiLHNTZWFyY2hQbGFjZWhvbGRlcjoiIixzVXJsOiIiLHNaZXJvUmVjb3JkczoiTm8gbWF0Y2hpbmcgcmVjb3JkcyBmb3VuZCJ9LG9TZWFyY2g6UC5leHRlbmQoe30sdy5tb2RlbHMub1NlYXJjaCksc0FqYXhEYXRhUHJvcDoiZGF0YSIsc0FqYXhTb3VyY2U6bnVsbCxzRG9tOiJsZnJ0aXAiLHNlYXJjaERlbGF5Om51bGwsc1BhZ2luYXRpb25UeXBlOiJzaW1wbGVfbnVtYmVycyIsc1Njcm9sbFg6IiIsc1Njcm9sbFhJbm5lcjoiIixzU2Nyb2xsWToiIixzU2VydmVyTWV0aG9kOiJHRVQiLHJlbmRlcmVyOm51bGwscm93SWQ6IkRUX1Jvd0lkIn0saSh3LmRlZmF1bHRzKSx3LmRlZmF1bHRzLmNvbHVtbj17YURhdGFTb3J0Om51bGwsaURhdGFTb3J0Oi0xLGFzU29ydGluZzpbImFzYyIsImRlc2MiXSxiU2VhcmNoYWJsZTohMCxiU29ydGFibGU6ITAsYlZpc2libGU6ITAsZm5DcmVhdGVkQ2VsbDpudWxsLG1EYXRhOm51bGwsbVJlbmRlcjpudWxsLHNDZWxsVHlwZToidGQiLHNDbGFzczoiIixzQ29udGVudFBhZGRpbmc6IiIsc0RlZmF1bHRDb250ZW50Om51bGwsc05hbWU6IiIsc1NvcnREYXRhVHlwZToic3RkIixzVGl0bGU6bnVsbCxzVHlwZTpudWxsLHNXaWR0aDpudWxsfSxpKHcuZGVmYXVsdHMuY29sdW1uKSx3Lm1vZGVscy5vU2V0dGluZ3M9e29GZWF0dXJlczp7YkF1dG9XaWR0aDpudWxsLGJEZWZlclJlbmRlcjpudWxsLGJGaWx0ZXI6bnVsbCxiSW5mbzpudWxsLGJMZW5ndGhDaGFuZ2U6bnVsbCxiUGFnaW5hdGU6bnVsbCxiUHJvY2Vzc2luZzpudWxsLGJTZXJ2ZXJTaWRlOm51bGwsYlNvcnQ6bnVsbCxiU29ydE11bHRpOm51bGwsYlNvcnRDbGFzc2VzOm51bGwsYlN0YXRlU2F2ZTpudWxsfSxvU2Nyb2xsOntiQ29sbGFwc2U6bnVsbCxpQmFyV2lkdGg6MCxzWDpudWxsLHNYSW5uZXI6bnVsbCxzWTpudWxsfSxvTGFuZ3VhZ2U6e2ZuSW5mb0NhbGxiYWNrOm51bGx9LG9Ccm93c2VyOntiU2Nyb2xsT3ZlcnNpemU6ITEsYlNjcm9sbGJhckxlZnQ6ITEsYkJvdW5kaW5nOiExLGJhcldpZHRoOjB9LGFqYXg6bnVsbCxhYW5GZWF0dXJlczpbXSxhb0RhdGE6W10sYWlEaXNwbGF5OltdLGFpRGlzcGxheU1hc3RlcjpbXSxhSWRzOnt9LGFvQ29sdW1uczpbXSxhb0hlYWRlcjpbXSxhb0Zvb3RlcjpbXSxvUHJldmlvdXNTZWFyY2g6e30sYW9QcmVTZWFyY2hDb2xzOltdLGFhU29ydGluZzpudWxsLGFhU29ydGluZ0ZpeGVkOltdLGFzU3RyaXBlQ2xhc3NlczpudWxsLGFzRGVzdHJveVN0cmlwZXM6W10sc0Rlc3Ryb3lXaWR0aDowLGFvUm93Q2FsbGJhY2s6W10sYW9IZWFkZXJDYWxsYmFjazpbXSxhb0Zvb3RlckNhbGxiYWNrOltdLGFvRHJhd0NhbGxiYWNrOltdLGFvUm93Q3JlYXRlZENhbGxiYWNrOltdLGFvUHJlRHJhd0NhbGxiYWNrOltdLGFvSW5pdENvbXBsZXRlOltdLGFvU3RhdGVTYXZlUGFyYW1zOltdLGFvU3RhdGVMb2FkUGFyYW1zOltdLGFvU3RhdGVMb2FkZWQ6W10sc1RhYmxlSWQ6IiIsblRhYmxlOm51bGwsblRIZWFkOm51bGwsblRGb290Om51bGwsblRCb2R5Om51bGwsblRhYmxlV3JhcHBlcjpudWxsLGJEZWZlckxvYWRpbmc6ITEsYkluaXRpYWxpc2VkOiExLGFvT3BlblJvd3M6W10sc0RvbTpudWxsLHNlYXJjaERlbGF5Om51bGwsc1BhZ2luYXRpb25UeXBlOiJ0d29fYnV0dG9uIixpU3RhdGVEdXJhdGlvbjowLGFvU3RhdGVTYXZlOltdLGFvU3RhdGVMb2FkOltdLG9TYXZlZFN0YXRlOm51bGwsb0xvYWRlZFN0YXRlOm51bGwsc0FqYXhTb3VyY2U6bnVsbCxzQWpheERhdGFQcm9wOm51bGwsanFYSFI6bnVsbCxqc29uOk4sb0FqYXhEYXRhOk4sZm5TZXJ2ZXJEYXRhOm51bGwsYW9TZXJ2ZXJQYXJhbXM6W10sc1NlcnZlck1ldGhvZDpudWxsLGZuRm9ybWF0TnVtYmVyOm51bGwsYUxlbmd0aE1lbnU6bnVsbCxpRHJhdzowLGJEcmF3aW5nOiExLGlEcmF3RXJyb3I6LTEsX2lEaXNwbGF5TGVuZ3RoOjEwLF9pRGlzcGxheVN0YXJ0OjAsX2lSZWNvcmRzVG90YWw6MCxfaVJlY29yZHNEaXNwbGF5OjAsb0NsYXNzZXM6e30sYkZpbHRlcmVkOiExLGJTb3J0ZWQ6ITEsYlNvcnRDZWxsc1RvcDpudWxsLG9Jbml0Om51bGwsYW9EZXN0cm95Q2FsbGJhY2s6W10sZm5SZWNvcmRzVG90YWw6ZnVuY3Rpb24oKXtyZXR1cm4ic3NwIj09RSh0aGlzKT8rdGhpcy5faVJlY29yZHNUb3RhbDp0aGlzLmFpRGlzcGxheU1hc3Rlci5sZW5ndGh9LGZuUmVjb3Jkc0Rpc3BsYXk6ZnVuY3Rpb24oKXtyZXR1cm4ic3NwIj09RSh0aGlzKT8rdGhpcy5faVJlY29yZHNEaXNwbGF5OnRoaXMuYWlEaXNwbGF5Lmxlbmd0aH0sZm5EaXNwbGF5RW5kOmZ1bmN0aW9uKCl7dmFyIHQ9dGhpcy5faURpc3BsYXlMZW5ndGgsZT10aGlzLl9pRGlzcGxheVN0YXJ0LG49ZSt0LGE9dGhpcy5haURpc3BsYXkubGVuZ3RoLHI9dGhpcy5vRmVhdHVyZXMsbz1yLmJQYWdpbmF0ZTtyZXR1cm4gci5iU2VydmVyU2lkZT8hMT09PW98fC0xPT09dD9lK2E6TWF0aC5taW4oZSt0LHRoaXMuX2lSZWNvcmRzRGlzcGxheSk6IW98fGE8bnx8LTE9PT10P2E6bn0sb0luc3RhbmNlOm51bGwsc0luc3RhbmNlOm51bGwsaVRhYkluZGV4OjAsblNjcm9sbEhlYWQ6bnVsbCxuU2Nyb2xsRm9vdDpudWxsLGFMYXN0U29ydDpbXSxvUGx1Z2luczp7fSxyb3dJZEZuOm51bGwscm93SWQ6bnVsbH0sdy5leHQ9cD17YnV0dG9uczp7fSxjbGFzc2VzOnt9LGJ1aWxkZXI6Ii1zb3VyY2UtIixlcnJNb2RlOiJhbGVydCIsZmVhdHVyZTpbXSxzZWFyY2g6W10sc2VsZWN0b3I6e2NlbGw6W10sY29sdW1uOltdLHJvdzpbXX0saW50ZXJuYWw6e30sbGVnYWN5OnthamF4Om51bGx9LHBhZ2VyOnt9LHJlbmRlcmVyOntwYWdlQnV0dG9uOnt9LGhlYWRlcjp7fX0sb3JkZXI6e30sdHlwZTp7ZGV0ZWN0OltdLHNlYXJjaDp7fSxvcmRlcjp7fX0sX3VuaXF1ZTowLGZuVmVyc2lvbkNoZWNrOncuZm5WZXJzaW9uQ2hlY2ssaUFwaUluZGV4OjAsb0pVSUNsYXNzZXM6e30sc1ZlcnNpb246dy52ZXJzaW9ufSxQLmV4dGVuZChwLHthZm5GaWx0ZXJpbmc6cC5zZWFyY2gsYVR5cGVzOnAudHlwZS5kZXRlY3Qsb2ZuU2VhcmNoOnAudHlwZS5zZWFyY2gsb1NvcnQ6cC50eXBlLm9yZGVyLGFmblNvcnREYXRhOnAub3JkZXIsYW9GZWF0dXJlczpwLmZlYXR1cmUsb0FwaTpwLmludGVybmFsLG9TdGRDbGFzc2VzOnAuY2xhc3NlcyxvUGFnaW5hdGlvbjpwLnBhZ2VyfSksUC5leHRlbmQody5leHQuY2xhc3Nlcyx7c1RhYmxlOiJkYXRhVGFibGUiLHNOb0Zvb3Rlcjoibm8tZm9vdGVyIixzUGFnZUJ1dHRvbjoicGFnaW5hdGVfYnV0dG9uIixzUGFnZUJ1dHRvbkFjdGl2ZToiY3VycmVudCIsc1BhZ2VCdXR0b25EaXNhYmxlZDoiZGlzYWJsZWQiLHNTdHJpcGVPZGQ6Im9kZCIsc1N0cmlwZUV2ZW46ImV2ZW4iLHNSb3dFbXB0eToiZGF0YVRhYmxlc19lbXB0eSIsc1dyYXBwZXI6ImRhdGFUYWJsZXNfd3JhcHBlciIsc0ZpbHRlcjoiZGF0YVRhYmxlc19maWx0ZXIiLHNJbmZvOiJkYXRhVGFibGVzX2luZm8iLHNQYWdpbmc6ImRhdGFUYWJsZXNfcGFnaW5hdGUgcGFnaW5nXyIsc0xlbmd0aDoiZGF0YVRhYmxlc19sZW5ndGgiLHNQcm9jZXNzaW5nOiJkYXRhVGFibGVzX3Byb2Nlc3NpbmciLHNTb3J0QXNjOiJzb3J0aW5nX2FzYyIsc1NvcnREZXNjOiJzb3J0aW5nX2Rlc2MiLHNTb3J0YWJsZToic29ydGluZyIsc1NvcnRhYmxlQXNjOiJzb3J0aW5nX2Rlc2NfZGlzYWJsZWQiLHNTb3J0YWJsZURlc2M6InNvcnRpbmdfYXNjX2Rpc2FibGVkIixzU29ydGFibGVOb25lOiJzb3J0aW5nX2Rpc2FibGVkIixzU29ydENvbHVtbjoic29ydGluZ18iLHNGaWx0ZXJJbnB1dDoiIixzTGVuZ3RoU2VsZWN0OiIiLHNTY3JvbGxXcmFwcGVyOiJkYXRhVGFibGVzX3Njcm9sbCIsc1Njcm9sbEhlYWQ6ImRhdGFUYWJsZXNfc2Nyb2xsSGVhZCIsc1Njcm9sbEhlYWRJbm5lcjoiZGF0YVRhYmxlc19zY3JvbGxIZWFkSW5uZXIiLHNTY3JvbGxCb2R5OiJkYXRhVGFibGVzX3Njcm9sbEJvZHkiLHNTY3JvbGxGb290OiJkYXRhVGFibGVzX3Njcm9sbEZvb3QiLHNTY3JvbGxGb290SW5uZXI6ImRhdGFUYWJsZXNfc2Nyb2xsRm9vdElubmVyIixzSGVhZGVyVEg6IiIsc0Zvb3RlclRIOiIiLHNTb3J0SlVJQXNjOiIiLHNTb3J0SlVJRGVzYzoiIixzU29ydEpVSToiIixzU29ydEpVSUFzY0FsbG93ZWQ6IiIsc1NvcnRKVUlEZXNjQWxsb3dlZDoiIixzU29ydEpVSVdyYXBwZXI6IiIsc1NvcnRJY29uOiIiLHNKVUlIZWFkZXI6IiIsc0pVSUZvb3RlcjoiIn0pLHcuZXh0LnBhZ2VyKTtmdW5jdGlvbiBPZSh0LGUpe3ZhciBuPVtdLGE9SGUubnVtYmVyc19sZW5ndGgscj1NYXRoLmZsb29yKGEvMik7cmV0dXJuIGU8PWE/bj1mKDAsZSk6dDw9cj8oKG49ZigwLGEtMikpLnB1c2goImVsbGlwc2lzIiksbi5wdXNoKGUtMSkpOigoZS0xLXI8PXQ/bj1mKGUtKGEtMiksZSk6KChuPWYodC1yKzIsdCtyLTEpKS5wdXNoKCJlbGxpcHNpcyIpLG4ucHVzaChlLTEpLG4pKS5zcGxpY2UoMCwwLCJlbGxpcHNpcyIpLG4uc3BsaWNlKDAsMCwwKSksbi5EVF9lbD0ic3BhbiIsbn1QLmV4dGVuZChIZSx7c2ltcGxlOmZ1bmN0aW9uKHQsZSl7cmV0dXJuWyJwcmV2aW91cyIsIm5leHQiXX0sZnVsbDpmdW5jdGlvbih0LGUpe3JldHVyblsiZmlyc3QiLCJwcmV2aW91cyIsIm5leHQiLCJsYXN0Il19LG51bWJlcnM6ZnVuY3Rpb24odCxlKXtyZXR1cm5bT2UodCxlKV19LHNpbXBsZV9udW1iZXJzOmZ1bmN0aW9uKHQsZSl7cmV0dXJuWyJwcmV2aW91cyIsT2UodCxlKSwibmV4dCJdfSxmdWxsX251bWJlcnM6ZnVuY3Rpb24odCxlKXtyZXR1cm5bImZpcnN0IiwicHJldmlvdXMiLE9lKHQsZSksIm5leHQiLCJsYXN0Il19LGZpcnN0X2xhc3RfbnVtYmVyczpmdW5jdGlvbih0LGUpe3JldHVyblsiZmlyc3QiLE9lKHQsZSksImxhc3QiXX0sX251bWJlcnM6T2UsbnVtYmVyc19sZW5ndGg6N30pLFAuZXh0ZW5kKCEwLHcuZXh0LnJlbmRlcmVyLHtwYWdlQnV0dG9uOntfOmZ1bmN0aW9uKGMsdCxmLGUsZCxoKXtmdW5jdGlvbiBwKHQsZSl7Zm9yKHZhciBuLGEscixvPW0uc1BhZ2VCdXR0b25EaXNhYmxlZCxpPWZ1bmN0aW9uKHQpe1l0KGMsdC5kYXRhLmFjdGlvbiwhMCl9LGw9MCxzPWUubGVuZ3RoO2w8cztsKyspaWYobj1lW2xdLEFycmF5LmlzQXJyYXkobikpe3ZhciB1PVAoIjwiKyhuLkRUX2VsfHwiZGl2IikrIi8+IikuYXBwZW5kVG8odCk7cCh1LG4pfWVsc2V7c3dpdGNoKGc9bnVsbCxiPW4sYT1jLmlUYWJJbmRleCxuKXtjYXNlImVsbGlwc2lzIjp0LmFwcGVuZCgnPHNwYW4gY2xhc3M9ImVsbGlwc2lzIj4mI3gyMDI2Ozwvc3Bhbj4nKTticmVhaztjYXNlImZpcnN0IjpnPVMuc0ZpcnN0LDA9PT1kJiYoYT0tMSxiKz0iICIrbyk7YnJlYWs7Y2FzZSJwcmV2aW91cyI6Zz1TLnNQcmV2aW91cywwPT09ZCYmKGE9LTEsYis9IiAiK28pO2JyZWFrO2Nhc2UibmV4dCI6Zz1TLnNOZXh0LDAhPT1oJiZkIT09aC0xfHwoYT0tMSxiKz0iICIrbyk7YnJlYWs7Y2FzZSJsYXN0IjpnPVMuc0xhc3QsMCE9PWgmJmQhPT1oLTF8fChhPS0xLGIrPSIgIitvKTticmVhaztkZWZhdWx0Omc9Yy5mbkZvcm1hdE51bWJlcihuKzEpLGI9ZD09PW4/bS5zUGFnZUJ1dHRvbkFjdGl2ZToiIn1udWxsIT09ZyYmKHU9Yy5vSW5pdC5wYWdpbmdUYWd8fCJhIixyPS0xIT09Yi5pbmRleE9mKG8pLG1lKFAoIjwiK3UrIj4iLHtjbGFzczptLnNQYWdlQnV0dG9uKyIgIitiLCJhcmlhLWNvbnRyb2xzIjpjLnNUYWJsZUlkLCJhcmlhLWRpc2FibGVkIjpyPyJ0cnVlIjpudWxsLCJhcmlhLWxhYmVsIjp2W25dLCJhcmlhLXJvbGUiOiJsaW5rIiwiYXJpYS1jdXJyZW50IjpiPT09bS5zUGFnZUJ1dHRvbkFjdGl2ZT8icGFnZSI6bnVsbCwiZGF0YS1kdC1pZHgiOm4sdGFiaW5kZXg6YSxpZDowPT09ZiYmInN0cmluZyI9PXR5cGVvZiBuP2Muc1RhYmxlSWQrIl8iK246bnVsbH0pLmh0bWwoZykuYXBwZW5kVG8odCkse2FjdGlvbjpufSxpKSl9fXZhciBnLGIsbixtPWMub0NsYXNzZXMsUz1jLm9MYW5ndWFnZS5vUGFnaW5hdGUsdj1jLm9MYW5ndWFnZS5vQXJpYS5wYWdpbmF0ZXx8e307dHJ5e249UCh0KS5maW5kKHkuYWN0aXZlRWxlbWVudCkuZGF0YSgiZHQtaWR4Iil9Y2F0Y2godCl7fXAoUCh0KS5lbXB0eSgpLGUpLG4hPT1OJiZQKHQpLmZpbmQoIltkYXRhLWR0LWlkeD0iK24rIl0iKS50cmlnZ2VyKCJmb2N1cyIpfX19KSxQLmV4dGVuZCh3LmV4dC50eXBlLmRldGVjdCxbZnVuY3Rpb24odCxlKXtlPWUub0xhbmd1YWdlLnNEZWNpbWFsO3JldHVybiBsKHQsZSk/Im51bSIrZTpudWxsfSxmdW5jdGlvbih0LGUpe3ZhciBuO3JldHVybighdHx8dCBpbnN0YW5jZW9mIERhdGV8fFgudGVzdCh0KSkmJihudWxsIT09KG49RGF0ZS5wYXJzZSh0KSkmJiFpc05hTihuKXx8aCh0KSk/ImRhdGUiOm51bGx9LGZ1bmN0aW9uKHQsZSl7ZT1lLm9MYW5ndWFnZS5zRGVjaW1hbDtyZXR1cm4gbCh0LGUsITApPyJudW0tZm10IitlOm51bGx9LGZ1bmN0aW9uKHQsZSl7ZT1lLm9MYW5ndWFnZS5zRGVjaW1hbDtyZXR1cm4gYSh0LGUpPyJodG1sLW51bSIrZTpudWxsfSxmdW5jdGlvbih0LGUpe2U9ZS5vTGFuZ3VhZ2Uuc0RlY2ltYWw7cmV0dXJuIGEodCxlLCEwKT8iaHRtbC1udW0tZm10IitlOm51bGx9LGZ1bmN0aW9uKHQsZSl7cmV0dXJuIGgodCl8fCJzdHJpbmciPT10eXBlb2YgdCYmLTEhPT10LmluZGV4T2YoIjwiKT8iaHRtbCI6bnVsbH1dKSxQLmV4dGVuZCh3LmV4dC50eXBlLnNlYXJjaCx7aHRtbDpmdW5jdGlvbih0KXtyZXR1cm4gaCh0KT90OiJzdHJpbmciPT10eXBlb2YgdD90LnJlcGxhY2UoVSwiICIpLnJlcGxhY2UoViwiIik6IiJ9LHN0cmluZzpmdW5jdGlvbih0KXtyZXR1cm4haCh0KSYmInN0cmluZyI9PXR5cGVvZiB0P3QucmVwbGFjZShVLCIgIik6dH19KTtmdW5jdGlvbiBrZSh0LGUsbixhKXt2YXIgcjtyZXR1cm4gMD09PXR8fHQmJiItIiE9PXQ/Im51bWJlciI9PShyPXR5cGVvZiB0KXx8ImJpZ2ludCI9PXI/dDorKHQ9KHQ9ZT9HKHQsZSk6dCkucmVwbGFjZSYmKG4mJih0PXQucmVwbGFjZShuLCIiKSksYSk/dC5yZXBsYWNlKGEsIiIpOnQpOi0xLzB9ZnVuY3Rpb24gTWUobil7UC5lYWNoKHtudW06ZnVuY3Rpb24odCl7cmV0dXJuIGtlKHQsbil9LCJudW0tZm10IjpmdW5jdGlvbih0KXtyZXR1cm4ga2UodCxuLHEpfSwiaHRtbC1udW0iOmZ1bmN0aW9uKHQpe3JldHVybiBrZSh0LG4sVil9LCJodG1sLW51bS1mbXQiOmZ1bmN0aW9uKHQpe3JldHVybiBrZSh0LG4sVixxKX19LGZ1bmN0aW9uKHQsZSl7cC50eXBlLm9yZGVyW3QrbisiLXByZSJdPWUsdC5tYXRjaCgvXmh0bWxcLS8pJiYocC50eXBlLnNlYXJjaFt0K25dPXAudHlwZS5zZWFyY2guaHRtbCl9KX1QLmV4dGVuZChwLnR5cGUub3JkZXIseyJkYXRlLXByZSI6ZnVuY3Rpb24odCl7dD1EYXRlLnBhcnNlKHQpO3JldHVybiBpc05hTih0KT8tMS8wOnR9LCJodG1sLXByZSI6ZnVuY3Rpb24odCl7cmV0dXJuIGgodCk/IiI6dC5yZXBsYWNlP3QucmVwbGFjZSgvPC4qPz4vZywiIikudG9Mb3dlckNhc2UoKTp0KyIifSwic3RyaW5nLXByZSI6ZnVuY3Rpb24odCl7cmV0dXJuIGgodCk/IiI6InN0cmluZyI9PXR5cGVvZiB0P3QudG9Mb3dlckNhc2UoKTp0LnRvU3RyaW5nP3QudG9TdHJpbmcoKToiIn0sInN0cmluZy1hc2MiOmZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQ8ZT8tMTplPHQ/MTowfSwic3RyaW5nLWRlc2MiOmZ1bmN0aW9uKHQsZSl7cmV0dXJuIHQ8ZT8xOmU8dD8tMTowfX0pLE1lKCIiKSxQLmV4dGVuZCghMCx3LmV4dC5yZW5kZXJlcix7aGVhZGVyOntfOmZ1bmN0aW9uKHIsbyxpLGwpe1Aoci5uVGFibGUpLm9uKCJvcmRlci5kdC5EVCIsZnVuY3Rpb24odCxlLG4sYSl7cj09PWUmJihlPWkuaWR4LG8ucmVtb3ZlQ2xhc3MobC5zU29ydEFzYysiICIrbC5zU29ydERlc2MpLmFkZENsYXNzKCJhc2MiPT1hW2VdP2wuc1NvcnRBc2M6ImRlc2MiPT1hW2VdP2wuc1NvcnREZXNjOmkuc1NvcnRpbmdDbGFzcykpfSl9LGpxdWVyeXVpOmZ1bmN0aW9uKHIsbyxpLGwpe1AoIjxkaXYvPiIpLmFkZENsYXNzKGwuc1NvcnRKVUlXcmFwcGVyKS5hcHBlbmQoby5jb250ZW50cygpKS5hcHBlbmQoUCgiPHNwYW4vPiIpLmFkZENsYXNzKGwuc1NvcnRJY29uKyIgIitpLnNTb3J0aW5nQ2xhc3NKVUkpKS5hcHBlbmRUbyhvKSxQKHIublRhYmxlKS5vbigib3JkZXIuZHQuRFQiLGZ1bmN0aW9uKHQsZSxuLGEpe3I9PT1lJiYoZT1pLmlkeCxvLnJlbW92ZUNsYXNzKGwuc1NvcnRBc2MrIiAiK2wuc1NvcnREZXNjKS5hZGRDbGFzcygiYXNjIj09YVtlXT9sLnNTb3J0QXNjOiJkZXNjIj09YVtlXT9sLnNTb3J0RGVzYzppLnNTb3J0aW5nQ2xhc3MpLG8uZmluZCgic3Bhbi4iK2wuc1NvcnRJY29uKS5yZW1vdmVDbGFzcyhsLnNTb3J0SlVJQXNjKyIgIitsLnNTb3J0SlVJRGVzYysiICIrbC5zU29ydEpVSSsiICIrbC5zU29ydEpVSUFzY0FsbG93ZWQrIiAiK2wuc1NvcnRKVUlEZXNjQWxsb3dlZCkuYWRkQ2xhc3MoImFzYyI9PWFbZV0/bC5zU29ydEpVSUFzYzoiZGVzYyI9PWFbZV0/bC5zU29ydEpVSURlc2M6aS5zU29ydGluZ0NsYXNzSlVJKSl9KX19fSk7ZnVuY3Rpb24gV2UodCl7cmV0dXJuInN0cmluZyI9PXR5cGVvZih0PUFycmF5LmlzQXJyYXkodCk/dC5qb2luKCIsIik6dCk/dC5yZXBsYWNlKC8mL2csIiZhbXA7IikucmVwbGFjZSgvPC9nLCImbHQ7IikucmVwbGFjZSgvPi9nLCImZ3Q7IikucmVwbGFjZSgvIi9nLCImcXVvdDsiKTp0fWZ1bmN0aW9uIEVlKHQsZSxuLGEscil7cmV0dXJuIGoubW9tZW50P3RbZV0ocik6ai5sdXhvbj90W25dKHIpOmE/dFthXShyKTp0fXZhciBCZT0hMTtmdW5jdGlvbiBVZSh0LGUsbil7dmFyIGE7aWYoai5tb21lbnQpe2lmKCEoYT1qLm1vbWVudC51dGModCxlLG4sITApKS5pc1ZhbGlkKCkpcmV0dXJuIG51bGx9ZWxzZSBpZihqLmx1eG9uKXtpZighKGE9ZSYmInN0cmluZyI9PXR5cGVvZiB0P2oubHV4b24uRGF0ZVRpbWUuZnJvbUZvcm1hdCh0LGUpOmoubHV4b24uRGF0ZVRpbWUuZnJvbUlTTyh0KSkuaXNWYWxpZClyZXR1cm4gbnVsbDthLnNldExvY2FsZShuKX1lbHNlIGU/KEJlfHxhbGVydCgiRGF0YVRhYmxlcyB3YXJuaW5nOiBGb3JtYXR0ZWQgZGF0ZSB3aXRob3V0IE1vbWVudC5qcyBvciBMdXhvbiAtIGh0dHBzOi8vZGF0YXRhYmxlcy5uZXQvdG4vMTciKSxCZT0hMCk6YT1uZXcgRGF0ZSh0KTtyZXR1cm4gYX1mdW5jdGlvbiBWZShzKXtyZXR1cm4gZnVuY3Rpb24oYSxyLG8saSl7MD09PWFyZ3VtZW50cy5sZW5ndGg/KG89ImVuIixhPXI9bnVsbCk6MT09PWFyZ3VtZW50cy5sZW5ndGg/KG89ImVuIixyPWEsYT1udWxsKToyPT09YXJndW1lbnRzLmxlbmd0aCYmKG89cixyPWEsYT1udWxsKTt2YXIgbD0iZGF0ZXRpbWUtIityO3JldHVybiB3LmV4dC50eXBlLm9yZGVyW2xdfHwody5leHQudHlwZS5kZXRlY3QudW5zaGlmdChmdW5jdGlvbih0KXtyZXR1cm4gdD09PWwmJmx9KSx3LmV4dC50eXBlLm9yZGVyW2wrIi1hc2MiXT1mdW5jdGlvbih0LGUpe3Q9dC52YWx1ZU9mKCksZT1lLnZhbHVlT2YoKTtyZXR1cm4gdD09PWU/MDp0PGU/LTE6MX0sdy5leHQudHlwZS5vcmRlcltsKyItZGVzYyJdPWZ1bmN0aW9uKHQsZSl7dD10LnZhbHVlT2YoKSxlPWUudmFsdWVPZigpO3JldHVybiB0PT09ZT8wOmU8dD8tMToxfSksZnVuY3Rpb24odCxlKXt2YXIgbjtyZXR1cm4gbnVsbCE9PXQmJnQhPT1OfHwodD0iLS1ub3ciPT09aT8obj1uZXcgRGF0ZSxuZXcgRGF0ZShEYXRlLlVUQyhuLmdldEZ1bGxZZWFyKCksbi5nZXRNb250aCgpLG4uZ2V0RGF0ZSgpLG4uZ2V0SG91cnMoKSxuLmdldE1pbnV0ZXMoKSxuLmdldFNlY29uZHMoKSkpKToiIiksInR5cGUiPT09ZT9sOiIiPT09dD8ic29ydCIhPT1lPyIiOlVlKCIwMDAwLTAxLTAxIDAwOjAwOjAwIixudWxsLG8pOiEobnVsbD09PXJ8fGEhPT1yfHwic29ydCI9PT1lfHwidHlwZSI9PT1lfHx0IGluc3RhbmNlb2YgRGF0ZSl8fG51bGw9PT0obj1VZSh0LGEsbykpP3Q6InNvcnQiPT09ZT9uOih0PW51bGw9PT1yP0VlKG4sInRvRGF0ZSIsInRvSlNEYXRlIiwiIilbc10oKTpFZShuLCJmb3JtYXQiLCJ0b0Zvcm1hdCIsInRvSVNPU3RyaW5nIixyKSwiZGlzcGxheSI9PT1lP1dlKHQpOnQpfX19dmFyIFhlPSIsIixKZT0iLiI7aWYoSW50bCl0cnl7Zm9yKHZhciBxZT0obmV3IEludGwuTnVtYmVyRm9ybWF0KS5mb3JtYXRUb1BhcnRzKDEwMDAwMC4xKSxuPTA7bjxxZS5sZW5ndGg7bisrKSJncm91cCI9PT1xZVtuXS50eXBlP1hlPXFlW25dLnZhbHVlOiJkZWNpbWFsIj09PXFlW25dLnR5cGUmJihKZT1xZVtuXS52YWx1ZSl9Y2F0Y2godCl7fWZ1bmN0aW9uIEdlKGUpe3JldHVybiBmdW5jdGlvbigpe3ZhciB0PVtnZSh0aGlzW3cuZXh0LmlBcGlJbmRleF0pXS5jb25jYXQoQXJyYXkucHJvdG90eXBlLnNsaWNlLmNhbGwoYXJndW1lbnRzKSk7cmV0dXJuIHcuZXh0LmludGVybmFsW2VdLmFwcGx5KHRoaXMsdCl9fXJldHVybiB3LmRhdGV0aW1lPWZ1bmN0aW9uKG4sYSl7dmFyIHI9ImRhdGV0aW1lLWRldGVjdC0iK247YT1hfHwiZW4iLHcuZXh0LnR5cGUub3JkZXJbcl18fCh3LmV4dC50eXBlLmRldGVjdC51bnNoaWZ0KGZ1bmN0aW9uKHQpe3ZhciBlPVVlKHQsbixhKTtyZXR1cm4hKCIiIT09dCYmIWUpJiZyfSksdy5leHQudHlwZS5vcmRlcltyKyItcHJlIl09ZnVuY3Rpb24odCl7cmV0dXJuIFVlKHQsbixhKXx8MH0pfSx3LnJlbmRlcj17ZGF0ZTpWZSgidG9Mb2NhbGVEYXRlU3RyaW5nIiksZGF0ZXRpbWU6VmUoInRvTG9jYWxlU3RyaW5nIiksdGltZTpWZSgidG9Mb2NhbGVUaW1lU3RyaW5nIiksbnVtYmVyOmZ1bmN0aW9uKGEscixvLGksbCl7cmV0dXJuIG51bGwhPT1hJiZhIT09Tnx8KGE9WGUpLG51bGwhPT1yJiZyIT09Tnx8KHI9SmUpLHtkaXNwbGF5OmZ1bmN0aW9uKHQpe2lmKCJudW1iZXIiIT10eXBlb2YgdCYmInN0cmluZyIhPXR5cGVvZiB0KXJldHVybiB0O2lmKCIiPT09dHx8bnVsbD09PXQpcmV0dXJuIHQ7dmFyIGU9dDwwPyItIjoiIixuPXBhcnNlRmxvYXQodCk7aWYoaXNOYU4obikpcmV0dXJuIFdlKHQpO249bi50b0ZpeGVkKG8pLHQ9TWF0aC5hYnMobik7bj1wYXJzZUludCh0LDEwKSx0PW8/cisodC1uKS50b0ZpeGVkKG8pLnN1YnN0cmluZygyKToiIjtyZXR1cm4oZT0wPT09biYmMD09PXBhcnNlRmxvYXQodCk/IiI6ZSkrKGl8fCIiKStuLnRvU3RyaW5nKCkucmVwbGFjZSgvXEIoPz0oXGR7M30pKyg/IVxkKSkvZyxhKSt0KyhsfHwiIil9fX0sdGV4dDpmdW5jdGlvbigpe3JldHVybntkaXNwbGF5OldlLGZpbHRlcjpXZX19fSxQLmV4dGVuZCh3LmV4dC5pbnRlcm5hbCx7X2ZuRXh0ZXJuQXBpRnVuYzpHZSxfZm5CdWlsZEFqYXg6VHQsX2ZuQWpheFVwZGF0ZTp4dCxfZm5BamF4UGFyYW1ldGVyczpBdCxfZm5BamF4VXBkYXRlRHJhdzpJdCxfZm5BamF4RGF0YVNyYzpGdCxfZm5BZGRDb2x1bW46bnQsX2ZuQ29sdW1uT3B0aW9uczphdCxfZm5BZGp1c3RDb2x1bW5TaXppbmc6TyxfZm5WaXNpYmxlVG9Db2x1bW5JbmRleDpydCxfZm5Db2x1bW5JbmRleFRvVmlzaWJsZTpvdCxfZm5WaXNibGVDb2x1bW5zOlQsX2ZuR2V0Q29sdW1uczppdCxfZm5Db2x1bW5UeXBlczpsdCxfZm5BcHBseUNvbHVtbkRlZnM6c3QsX2ZuSHVuZ2FyaWFuTWFwOmksX2ZuQ2FtZWxUb0h1bmdhcmlhbjpDLF9mbkxhbmd1YWdlQ29tcGF0OlosX2ZuQnJvd3NlckRldGVjdDp0dCxfZm5BZGREYXRhOngsX2ZuQWRkVHI6dXQsX2ZuTm9kZVRvRGF0YUluZGV4OmZ1bmN0aW9uKHQsZSl7cmV0dXJuIGUuX0RUX1Jvd0luZGV4IT09Tj9lLl9EVF9Sb3dJbmRleDpudWxsfSxfZm5Ob2RlVG9Db2x1bW5JbmRleDpmdW5jdGlvbih0LGUsbil7cmV0dXJuIFAuaW5BcnJheShuLHQuYW9EYXRhW2VdLmFuQ2VsbHMpfSxfZm5HZXRDZWxsRGF0YTpTLF9mblNldENlbGxEYXRhOmN0LF9mblNwbGl0T2JqTm90YXRpb246ZHQsX2ZuR2V0T2JqZWN0RGF0YUZuOkEsX2ZuU2V0T2JqZWN0RGF0YUZuOmIsX2ZuR2V0RGF0YU1hc3RlcjpodCxfZm5DbGVhclRhYmxlOnB0LF9mbkRlbGV0ZUluZGV4Omd0LF9mbkludmFsaWRhdGU6YnQsX2ZuR2V0Um93RWxlbWVudHM6bXQsX2ZuQ3JlYXRlVHI6U3QsX2ZuQnVpbGRIZWFkOnl0LF9mbkRyYXdIZWFkOkR0LF9mbkRyYXc6dixfZm5SZURyYXc6dSxfZm5BZGRPcHRpb25zSHRtbDpfdCxfZm5EZXRlY3RIZWFkZXI6d3QsX2ZuR2V0VW5pcXVlVGhzOkN0LF9mbkZlYXR1cmVIdG1sRmlsdGVyOkx0LF9mbkZpbHRlckNvbXBsZXRlOlJ0LF9mbkZpbHRlckN1c3RvbTpQdCxfZm5GaWx0ZXJDb2x1bW46anQsX2ZuRmlsdGVyOk50LF9mbkZpbHRlckNyZWF0ZVNlYXJjaDpIdCxfZm5Fc2NhcGVSZWdleDpPdCxfZm5GaWx0ZXJEYXRhOld0LF9mbkZlYXR1cmVIdG1sSW5mbzpVdCxfZm5VcGRhdGVJbmZvOlZ0LF9mbkluZm9NYWNyb3M6WHQsX2ZuSW5pdGlhbGlzZTpKdCxfZm5Jbml0Q29tcGxldGU6cXQsX2ZuTGVuZ3RoQ2hhbmdlOkd0LF9mbkZlYXR1cmVIdG1sTGVuZ3RoOiR0LF9mbkZlYXR1cmVIdG1sUGFnaW5hdGU6enQsX2ZuUGFnZUNoYW5nZTpZdCxfZm5GZWF0dXJlSHRtbFByb2Nlc3Npbmc6WnQsX2ZuUHJvY2Vzc2luZ0Rpc3BsYXk6RCxfZm5GZWF0dXJlSHRtbFRhYmxlOkt0LF9mblNjcm9sbERyYXc6UXQsX2ZuQXBwbHlUb0NoaWxkcmVuOmssX2ZuQ2FsY3VsYXRlQ29sdW1uV2lkdGhzOmVlLF9mblRocm90dGxlOm5lLF9mbkNvbnZlcnRUb1dpZHRoOmFlLF9mbkdldFdpZGVzdE5vZGU6cmUsX2ZuR2V0TWF4TGVuU3RyaW5nOm9lLF9mblN0cmluZ1RvQ3NzOk0sX2ZuU29ydEZsYXR0ZW46SSxfZm5Tb3J0OmllLF9mblNvcnRBcmlhOmxlLF9mblNvcnRMaXN0ZW5lcjpzZSxfZm5Tb3J0QXR0YWNoTGlzdGVuZXI6dWUsX2ZuU29ydGluZ0NsYXNzZXM6Y2UsX2ZuU29ydERhdGE6ZmUsX2ZuU2F2ZVN0YXRlOmRlLF9mbkxvYWRTdGF0ZTpoZSxfZm5JbXBsZW1lbnRTdGF0ZTpwZSxfZm5TZXR0aW5nc0Zyb21Ob2RlOmdlLF9mbkxvZzpXLF9mbk1hcDpGLF9mbkJpbmRBY3Rpb246bWUsX2ZuQ2FsbGJhY2tSZWc6TCxfZm5DYWxsYmFja0ZpcmU6UixfZm5MZW5ndGhPdmVyZmxvdzpTZSxfZm5SZW5kZXJlcjp2ZSxfZm5EYXRhU291cmNlOkUsX2ZuUm93QXR0cmlidXRlczp2dCxfZm5FeHRlbmQ6YmUsX2ZuQ2FsY3VsYXRlRW5kOmZ1bmN0aW9uKCl7fX0pLCgoUC5mbi5kYXRhVGFibGU9dykuJD1QKS5mbi5kYXRhVGFibGVTZXR0aW5ncz13LnNldHRpbmdzLFAuZm4uZGF0YVRhYmxlRXh0PXcuZXh0LFAuZm4uRGF0YVRhYmxlPWZ1bmN0aW9uKHQpe3JldHVybiBQKHRoaXMpLmRhdGFUYWJsZSh0KS5hcGkoKX0sUC5lYWNoKHcsZnVuY3Rpb24odCxlKXtQLmZuLkRhdGFUYWJsZVt0XT1lfSksd30pOw==\"></script>\n",
       "<link href=\"data:text/css;charset-utf-8;base64,OnJvb3R7LS1kdC1yb3ctc2VsZWN0ZWQ6IDEzLCAxMTAsIDI1MzstLWR0LXJvdy1zZWxlY3RlZC10ZXh0OiAyNTUsIDI1NSwgMjU1Oy0tZHQtcm93LXNlbGVjdGVkLWxpbms6IDksIDEwLCAxMX10YWJsZS5kYXRhVGFibGUgdGQuZHQtY29udHJvbHt0ZXh0LWFsaWduOmNlbnRlcjtjdXJzb3I6cG9pbnRlcn10YWJsZS5kYXRhVGFibGUgdGQuZHQtY29udHJvbDpiZWZvcmV7aGVpZ2h0OjFlbTt3aWR0aDoxZW07bWFyZ2luLXRvcDotOXB4O2Rpc3BsYXk6aW5saW5lLWJsb2NrO2NvbG9yOndoaXRlO2JvcmRlcjouMTVlbSBzb2xpZCB3aGl0ZTtib3JkZXItcmFkaXVzOjFlbTtib3gtc2hhZG93OjAgMCAuMmVtICM0NDQ7Ym94LXNpemluZzpjb250ZW50LWJveDt0ZXh0LWFsaWduOmNlbnRlcjt0ZXh0LWluZGVudDowICFpbXBvcnRhbnQ7Zm9udC1mYW1pbHk6IkNvdXJpZXIgTmV3IixDb3VyaWVyLG1vbm9zcGFjZTtsaW5lLWhlaWdodDoxZW07Y29udGVudDoiKyI7YmFja2dyb3VuZC1jb2xvcjojMzFiMTMxfXRhYmxlLmRhdGFUYWJsZSB0ci5kdC1oYXNDaGlsZCB0ZC5kdC1jb250cm9sOmJlZm9yZXtjb250ZW50OiItIjtiYWNrZ3JvdW5kLWNvbG9yOiNkMzMzMzN9dGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmcsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2MsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjX2Rpc2FibGVkLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmcsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2MsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjX2Rpc2FibGVkLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWR7Y3Vyc29yOnBvaW50ZXI7cG9zaXRpb246cmVsYXRpdmU7cGFkZGluZy1yaWdodDoyNnB4fXRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZzphZnRlcix0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19hc2M6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2FzYzphZnRlcix0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19kZXNjOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19kZXNjOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2FzY19kaXNhYmxlZDpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjX2Rpc2FibGVkOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmc6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2FzYzpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2M6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2M6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjX2Rpc2FibGVkOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGQuc29ydGluZ19hc2NfZGlzYWJsZWQ6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfZGVzY19kaXNhYmxlZDpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfZGVzY19kaXNhYmxlZDphZnRlcntwb3NpdGlvbjphYnNvbHV0ZTtkaXNwbGF5OmJsb2NrO29wYWNpdHk6LjEyNTtyaWdodDoxMHB4O2xpbmUtaGVpZ2h0OjlweDtmb250LXNpemU6LjhlbX10YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZzpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19kZXNjOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19hc2NfZGlzYWJsZWQ6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGQuc29ydGluZ19hc2M6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2M6YmVmb3JlLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2FzY19kaXNhYmxlZDpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfZGVzY19kaXNhYmxlZDpiZWZvcmV7Ym90dG9tOjUwJTtjb250ZW50OiLilrIiO2NvbnRlbnQ6IuKWsiIvIiJ9dGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmc6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2M6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjX2Rpc2FibGVkOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmc6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2M6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfYXNjX2Rpc2FibGVkOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YWZ0ZXJ7dG9wOjUwJTtjb250ZW50OiLilrwiO2NvbnRlbnQ6IuKWvCIvIiJ9dGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGguc29ydGluZ19kZXNjOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2FzYzpiZWZvcmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkLnNvcnRpbmdfZGVzYzphZnRlcntvcGFjaXR5Oi42fXRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aC5zb3J0aW5nX2Rlc2NfZGlzYWJsZWQ6YWZ0ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRoLnNvcnRpbmdfYXNjX2Rpc2FibGVkOmJlZm9yZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQ+dHI+dGQuc29ydGluZ19kZXNjX2Rpc2FibGVkOmFmdGVyLHRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50ZC5zb3J0aW5nX2FzY19kaXNhYmxlZDpiZWZvcmV7ZGlzcGxheTpub25lfXRhYmxlLmRhdGFUYWJsZSB0aGVhZD50cj50aDphY3RpdmUsdGFibGUuZGF0YVRhYmxlIHRoZWFkPnRyPnRkOmFjdGl2ZXtvdXRsaW5lOm5vbmV9ZGl2LmRhdGFUYWJsZXNfc2Nyb2xsQm9keT50YWJsZS5kYXRhVGFibGU+dGhlYWQ+dHI+dGg6YmVmb3JlLGRpdi5kYXRhVGFibGVzX3Njcm9sbEJvZHk+dGFibGUuZGF0YVRhYmxlPnRoZWFkPnRyPnRoOmFmdGVyLGRpdi5kYXRhVGFibGVzX3Njcm9sbEJvZHk+dGFibGUuZGF0YVRhYmxlPnRoZWFkPnRyPnRkOmJlZm9yZSxkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlLmRhdGFUYWJsZT50aGVhZD50cj50ZDphZnRlcntkaXNwbGF5Om5vbmV9ZGl2LmRhdGFUYWJsZXNfcHJvY2Vzc2luZ3twb3NpdGlvbjphYnNvbHV0ZTt0b3A6NTAlO2xlZnQ6NTAlO3dpZHRoOjIwMHB4O21hcmdpbi1sZWZ0Oi0xMDBweDttYXJnaW4tdG9wOi0yNnB4O3RleHQtYWxpZ246Y2VudGVyO3BhZGRpbmc6MnB4fWRpdi5kYXRhVGFibGVzX3Byb2Nlc3Npbmc+ZGl2Omxhc3QtY2hpbGR7cG9zaXRpb246cmVsYXRpdmU7d2lkdGg6ODBweDtoZWlnaHQ6MTVweDttYXJnaW46MWVtIGF1dG99ZGl2LmRhdGFUYWJsZXNfcHJvY2Vzc2luZz5kaXY6bGFzdC1jaGlsZD5kaXZ7cG9zaXRpb246YWJzb2x1dGU7dG9wOjA7d2lkdGg6MTNweDtoZWlnaHQ6MTNweDtib3JkZXItcmFkaXVzOjUwJTtiYWNrZ3JvdW5kOnJnYigxMywgMTEwLCAyNTMpO2JhY2tncm91bmQ6cmdiKHZhcigtLWR0LXJvdy1zZWxlY3RlZCkpO2FuaW1hdGlvbi10aW1pbmctZnVuY3Rpb246Y3ViaWMtYmV6aWVyKDAsIDEsIDEsIDApfWRpdi5kYXRhVGFibGVzX3Byb2Nlc3Npbmc+ZGl2Omxhc3QtY2hpbGQ+ZGl2Om50aC1jaGlsZCgxKXtsZWZ0OjhweDthbmltYXRpb246ZGF0YXRhYmxlcy1sb2FkZXItMSAuNnMgaW5maW5pdGV9ZGl2LmRhdGFUYWJsZXNfcHJvY2Vzc2luZz5kaXY6bGFzdC1jaGlsZD5kaXY6bnRoLWNoaWxkKDIpe2xlZnQ6OHB4O2FuaW1hdGlvbjpkYXRhdGFibGVzLWxvYWRlci0yIC42cyBpbmZpbml0ZX1kaXYuZGF0YVRhYmxlc19wcm9jZXNzaW5nPmRpdjpsYXN0LWNoaWxkPmRpdjpudGgtY2hpbGQoMyl7bGVmdDozMnB4O2FuaW1hdGlvbjpkYXRhdGFibGVzLWxvYWRlci0yIC42cyBpbmZpbml0ZX1kaXYuZGF0YVRhYmxlc19wcm9jZXNzaW5nPmRpdjpsYXN0LWNoaWxkPmRpdjpudGgtY2hpbGQoNCl7bGVmdDo1NnB4O2FuaW1hdGlvbjpkYXRhdGFibGVzLWxvYWRlci0zIC42cyBpbmZpbml0ZX1Aa2V5ZnJhbWVzIGRhdGF0YWJsZXMtbG9hZGVyLTF7MCV7dHJhbnNmb3JtOnNjYWxlKDApfTEwMCV7dHJhbnNmb3JtOnNjYWxlKDEpfX1Aa2V5ZnJhbWVzIGRhdGF0YWJsZXMtbG9hZGVyLTN7MCV7dHJhbnNmb3JtOnNjYWxlKDEpfTEwMCV7dHJhbnNmb3JtOnNjYWxlKDApfX1Aa2V5ZnJhbWVzIGRhdGF0YWJsZXMtbG9hZGVyLTJ7MCV7dHJhbnNmb3JtOnRyYW5zbGF0ZSgwLCAwKX0xMDAle3RyYW5zZm9ybTp0cmFuc2xhdGUoMjRweCwgMCl9fXRhYmxlLmRhdGFUYWJsZS5ub3dyYXAgdGgsdGFibGUuZGF0YVRhYmxlLm5vd3JhcCB0ZHt3aGl0ZS1zcGFjZTpub3dyYXB9dGFibGUuZGF0YVRhYmxlIHRoLmR0LWxlZnQsdGFibGUuZGF0YVRhYmxlIHRkLmR0LWxlZnR7dGV4dC1hbGlnbjpsZWZ0fXRhYmxlLmRhdGFUYWJsZSB0aC5kdC1jZW50ZXIsdGFibGUuZGF0YVRhYmxlIHRkLmR0LWNlbnRlcix0YWJsZS5kYXRhVGFibGUgdGQuZGF0YVRhYmxlc19lbXB0eXt0ZXh0LWFsaWduOmNlbnRlcn10YWJsZS5kYXRhVGFibGUgdGguZHQtcmlnaHQsdGFibGUuZGF0YVRhYmxlIHRkLmR0LXJpZ2h0e3RleHQtYWxpZ246cmlnaHR9dGFibGUuZGF0YVRhYmxlIHRoLmR0LWp1c3RpZnksdGFibGUuZGF0YVRhYmxlIHRkLmR0LWp1c3RpZnl7dGV4dC1hbGlnbjpqdXN0aWZ5fXRhYmxlLmRhdGFUYWJsZSB0aC5kdC1ub3dyYXAsdGFibGUuZGF0YVRhYmxlIHRkLmR0LW5vd3JhcHt3aGl0ZS1zcGFjZTpub3dyYXB9dGFibGUuZGF0YVRhYmxlIHRoZWFkIHRoLHRhYmxlLmRhdGFUYWJsZSB0aGVhZCB0ZCx0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGgsdGFibGUuZGF0YVRhYmxlIHRmb290IHRke3RleHQtYWxpZ246bGVmdH10YWJsZS5kYXRhVGFibGUgdGhlYWQgdGguZHQtaGVhZC1sZWZ0LHRhYmxlLmRhdGFUYWJsZSB0aGVhZCB0ZC5kdC1oZWFkLWxlZnQsdGFibGUuZGF0YVRhYmxlIHRmb290IHRoLmR0LWhlYWQtbGVmdCx0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGQuZHQtaGVhZC1sZWZ0e3RleHQtYWxpZ246bGVmdH10YWJsZS5kYXRhVGFibGUgdGhlYWQgdGguZHQtaGVhZC1jZW50ZXIsdGFibGUuZGF0YVRhYmxlIHRoZWFkIHRkLmR0LWhlYWQtY2VudGVyLHRhYmxlLmRhdGFUYWJsZSB0Zm9vdCB0aC5kdC1oZWFkLWNlbnRlcix0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGQuZHQtaGVhZC1jZW50ZXJ7dGV4dC1hbGlnbjpjZW50ZXJ9dGFibGUuZGF0YVRhYmxlIHRoZWFkIHRoLmR0LWhlYWQtcmlnaHQsdGFibGUuZGF0YVRhYmxlIHRoZWFkIHRkLmR0LWhlYWQtcmlnaHQsdGFibGUuZGF0YVRhYmxlIHRmb290IHRoLmR0LWhlYWQtcmlnaHQsdGFibGUuZGF0YVRhYmxlIHRmb290IHRkLmR0LWhlYWQtcmlnaHR7dGV4dC1hbGlnbjpyaWdodH10YWJsZS5kYXRhVGFibGUgdGhlYWQgdGguZHQtaGVhZC1qdXN0aWZ5LHRhYmxlLmRhdGFUYWJsZSB0aGVhZCB0ZC5kdC1oZWFkLWp1c3RpZnksdGFibGUuZGF0YVRhYmxlIHRmb290IHRoLmR0LWhlYWQtanVzdGlmeSx0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGQuZHQtaGVhZC1qdXN0aWZ5e3RleHQtYWxpZ246anVzdGlmeX10YWJsZS5kYXRhVGFibGUgdGhlYWQgdGguZHQtaGVhZC1ub3dyYXAsdGFibGUuZGF0YVRhYmxlIHRoZWFkIHRkLmR0LWhlYWQtbm93cmFwLHRhYmxlLmRhdGFUYWJsZSB0Zm9vdCB0aC5kdC1oZWFkLW5vd3JhcCx0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGQuZHQtaGVhZC1ub3dyYXB7d2hpdGUtc3BhY2U6bm93cmFwfXRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0aC5kdC1ib2R5LWxlZnQsdGFibGUuZGF0YVRhYmxlIHRib2R5IHRkLmR0LWJvZHktbGVmdHt0ZXh0LWFsaWduOmxlZnR9dGFibGUuZGF0YVRhYmxlIHRib2R5IHRoLmR0LWJvZHktY2VudGVyLHRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0ZC5kdC1ib2R5LWNlbnRlcnt0ZXh0LWFsaWduOmNlbnRlcn10YWJsZS5kYXRhVGFibGUgdGJvZHkgdGguZHQtYm9keS1yaWdodCx0YWJsZS5kYXRhVGFibGUgdGJvZHkgdGQuZHQtYm9keS1yaWdodHt0ZXh0LWFsaWduOnJpZ2h0fXRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0aC5kdC1ib2R5LWp1c3RpZnksdGFibGUuZGF0YVRhYmxlIHRib2R5IHRkLmR0LWJvZHktanVzdGlmeXt0ZXh0LWFsaWduOmp1c3RpZnl9dGFibGUuZGF0YVRhYmxlIHRib2R5IHRoLmR0LWJvZHktbm93cmFwLHRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0ZC5kdC1ib2R5LW5vd3JhcHt3aGl0ZS1zcGFjZTpub3dyYXB9dGFibGUuZGF0YVRhYmxle3dpZHRoOjEwMCU7bWFyZ2luOjAgYXV0bztjbGVhcjpib3RoO2JvcmRlci1jb2xsYXBzZTpzZXBhcmF0ZTtib3JkZXItc3BhY2luZzowfXRhYmxlLmRhdGFUYWJsZSB0aGVhZCB0aCx0YWJsZS5kYXRhVGFibGUgdGZvb3QgdGh7Zm9udC13ZWlnaHQ6Ym9sZH10YWJsZS5kYXRhVGFibGUgdGhlYWQgdGgsdGFibGUuZGF0YVRhYmxlIHRoZWFkIHRke3BhZGRpbmc6MTBweDtib3JkZXItYm90dG9tOjFweCBzb2xpZCByZ2JhKDAsIDAsIDAsIDAuMyl9dGFibGUuZGF0YVRhYmxlIHRoZWFkIHRoOmFjdGl2ZSx0YWJsZS5kYXRhVGFibGUgdGhlYWQgdGQ6YWN0aXZle291dGxpbmU6bm9uZX10YWJsZS5kYXRhVGFibGUgdGZvb3QgdGgsdGFibGUuZGF0YVRhYmxlIHRmb290IHRke3BhZGRpbmc6MTBweCAxMHB4IDZweCAxMHB4O2JvcmRlci10b3A6MXB4IHNvbGlkIHJnYmEoMCwgMCwgMCwgMC4zKX10YWJsZS5kYXRhVGFibGUgdGJvZHkgdHJ7YmFja2dyb3VuZC1jb2xvcjp0cmFuc3BhcmVudH10YWJsZS5kYXRhVGFibGUgdGJvZHkgdHIuc2VsZWN0ZWQ+Kntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDEzLCAxMTAsIDI1MywgMC45KTtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCksIDAuOSk7Y29sb3I6cmdiKDI1NSwgMjU1LCAyNTUpO2NvbG9yOnJnYih2YXIoLS1kdC1yb3ctc2VsZWN0ZWQtdGV4dCkpfXRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0ci5zZWxlY3RlZCBhe2NvbG9yOnJnYig5LCAxMCwgMTEpO2NvbG9yOnJnYih2YXIoLS1kdC1yb3ctc2VsZWN0ZWQtbGluaykpfXRhYmxlLmRhdGFUYWJsZSB0Ym9keSB0aCx0YWJsZS5kYXRhVGFibGUgdGJvZHkgdGR7cGFkZGluZzo4cHggMTBweH10YWJsZS5kYXRhVGFibGUucm93LWJvcmRlciB0Ym9keSB0aCx0YWJsZS5kYXRhVGFibGUucm93LWJvcmRlciB0Ym9keSB0ZCx0YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0aCx0YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0ZHtib3JkZXItdG9wOjFweCBzb2xpZCByZ2JhKDAsIDAsIDAsIDAuMTUpfXRhYmxlLmRhdGFUYWJsZS5yb3ctYm9yZGVyIHRib2R5IHRyOmZpcnN0LWNoaWxkIHRoLHRhYmxlLmRhdGFUYWJsZS5yb3ctYm9yZGVyIHRib2R5IHRyOmZpcnN0LWNoaWxkIHRkLHRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5IHRib2R5IHRyOmZpcnN0LWNoaWxkIHRoLHRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5IHRib2R5IHRyOmZpcnN0LWNoaWxkIHRke2JvcmRlci10b3A6bm9uZX10YWJsZS5kYXRhVGFibGUuY2VsbC1ib3JkZXIgdGJvZHkgdGgsdGFibGUuZGF0YVRhYmxlLmNlbGwtYm9yZGVyIHRib2R5IHRke2JvcmRlci10b3A6MXB4IHNvbGlkIHJnYmEoMCwgMCwgMCwgMC4xNSk7Ym9yZGVyLXJpZ2h0OjFweCBzb2xpZCByZ2JhKDAsIDAsIDAsIDAuMTUpfXRhYmxlLmRhdGFUYWJsZS5jZWxsLWJvcmRlciB0Ym9keSB0ciB0aDpmaXJzdC1jaGlsZCx0YWJsZS5kYXRhVGFibGUuY2VsbC1ib3JkZXIgdGJvZHkgdHIgdGQ6Zmlyc3QtY2hpbGR7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYmEoMCwgMCwgMCwgMC4xNSl9dGFibGUuZGF0YVRhYmxlLmNlbGwtYm9yZGVyIHRib2R5IHRyOmZpcnN0LWNoaWxkIHRoLHRhYmxlLmRhdGFUYWJsZS5jZWxsLWJvcmRlciB0Ym9keSB0cjpmaXJzdC1jaGlsZCB0ZHtib3JkZXItdG9wOm5vbmV9dGFibGUuZGF0YVRhYmxlLnN0cmlwZT50Ym9keT50ci5vZGQ+Kix0YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5vZGQ+Kntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDIzKX10YWJsZS5kYXRhVGFibGUuc3RyaXBlPnRib2R5PnRyLm9kZC5zZWxlY3RlZD4qLHRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5PnRyLm9kZC5zZWxlY3RlZD4qe2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEoMTMsIDExMCwgMjUzLCAwLjkyMyk7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSh2YXIoLS1kdC1yb3ctc2VsZWN0ZWQsIDAuOTIzKSl9dGFibGUuZGF0YVRhYmxlLmhvdmVyPnRib2R5PnRyOmhvdmVyPiosdGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHk+dHI6aG92ZXI+Kntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDM1KX10YWJsZS5kYXRhVGFibGUuaG92ZXI+dGJvZHk+dHIuc2VsZWN0ZWQ6aG92ZXI+Kix0YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5zZWxlY3RlZDpob3Zlcj4qe2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4ICMwZDZlZmQgIWltcG9ydGFudDtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCwgMSkpICFpbXBvcnRhbnR9dGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbj50Ym9keSB0cj4uc29ydGluZ18xLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4+dGJvZHkgdHI+LnNvcnRpbmdfMix0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uPnRib2R5IHRyPi5zb3J0aW5nXzMsdGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHkgdHI+LnNvcnRpbmdfMSx0YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keSB0cj4uc29ydGluZ18yLHRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5IHRyPi5zb3J0aW5nXzN7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgwLCAwLCAwLCAwLjAxOSl9dGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbj50Ym9keSB0ci5zZWxlY3RlZD4uc29ydGluZ18xLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4+dGJvZHkgdHIuc2VsZWN0ZWQ+LnNvcnRpbmdfMix0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uPnRib2R5IHRyLnNlbGVjdGVkPi5zb3J0aW5nXzMsdGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHkgdHIuc2VsZWN0ZWQ+LnNvcnRpbmdfMSx0YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keSB0ci5zZWxlY3RlZD4uc29ydGluZ18yLHRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5IHRyLnNlbGVjdGVkPi5zb3J0aW5nXzN7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgxMywgMTEwLCAyNTMsIDAuOTE5KTtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCwgMC45MTkpKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfMSx0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfMXtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDU0KX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfMix0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfMntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDQ3KX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfMyx0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5vZGQ+LnNvcnRpbmdfM3tib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDM5KX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5vZGQuc2VsZWN0ZWQ+LnNvcnRpbmdfMSx0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5vZGQuc2VsZWN0ZWQ+LnNvcnRpbmdfMXtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDEzLCAxMTAsIDI1MywgMC45NTQpO2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEodmFyKC0tZHQtcm93LXNlbGVjdGVkLCAwLjk1NCkpfXRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5PnRyLm9kZC5zZWxlY3RlZD4uc29ydGluZ18yLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uc3RyaXBlPnRib2R5PnRyLm9kZC5zZWxlY3RlZD4uc29ydGluZ18ye2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEoMTMsIDExMCwgMjUzLCAwLjk0Nyk7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSh2YXIoLS1kdC1yb3ctc2VsZWN0ZWQsIDAuOTQ3KSl9dGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHk+dHIub2RkLnNlbGVjdGVkPi5zb3J0aW5nXzMsdGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbi5zdHJpcGU+dGJvZHk+dHIub2RkLnNlbGVjdGVkPi5zb3J0aW5nXzN7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgxMywgMTEwLCAyNTMsIDAuOTM5KTtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCwgMC45MzkpKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5ldmVuPi5zb3J0aW5nXzEsdGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbi5zdHJpcGU+dGJvZHk+dHIuZXZlbj4uc29ydGluZ18xe2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEoMCwgMCwgMCwgMC4wMTkpfXRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5PnRyLmV2ZW4+LnNvcnRpbmdfMix0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5ldmVuPi5zb3J0aW5nXzJ7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgwLCAwLCAwLCAwLjAxMSl9dGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHk+dHIuZXZlbj4uc29ydGluZ18zLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uc3RyaXBlPnRib2R5PnRyLmV2ZW4+LnNvcnRpbmdfM3tib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDAzKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheT50Ym9keT50ci5ldmVuLnNlbGVjdGVkPi5zb3J0aW5nXzEsdGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbi5zdHJpcGU+dGJvZHk+dHIuZXZlbi5zZWxlY3RlZD4uc29ydGluZ18xe2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEoMTMsIDExMCwgMjUzLCAwLjkxOSk7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSh2YXIoLS1kdC1yb3ctc2VsZWN0ZWQsIDAuOTE5KSl9dGFibGUuZGF0YVRhYmxlLmRpc3BsYXk+dGJvZHk+dHIuZXZlbi5zZWxlY3RlZD4uc29ydGluZ18yLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uc3RyaXBlPnRib2R5PnRyLmV2ZW4uc2VsZWN0ZWQ+LnNvcnRpbmdfMntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDEzLCAxMTAsIDI1MywgMC45MTEpO2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEodmFyKC0tZHQtcm93LXNlbGVjdGVkLCAwLjkxMSkpfXRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5PnRib2R5PnRyLmV2ZW4uc2VsZWN0ZWQ+LnNvcnRpbmdfMyx0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLnN0cmlwZT50Ym9keT50ci5ldmVuLnNlbGVjdGVkPi5zb3J0aW5nXzN7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgxMywgMTEwLCAyNTMsIDAuOTAzKTtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCwgMC45MDMpKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0cjpob3Zlcj4uc29ydGluZ18xLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uaG92ZXIgdGJvZHkgdHI6aG92ZXI+LnNvcnRpbmdfMXtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDgyKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0cjpob3Zlcj4uc29ydGluZ18yLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uaG92ZXIgdGJvZHkgdHI6aG92ZXI+LnNvcnRpbmdfMntib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDc0KX10YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0cjpob3Zlcj4uc29ydGluZ18zLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uaG92ZXIgdGJvZHkgdHI6aG92ZXI+LnNvcnRpbmdfM3tib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDAsIDAsIDAsIDAuMDYyKX10YWJsZS5kYXRhVGFibGUuZGlzcGxheSB0Ym9keSB0cjpob3Zlci5zZWxlY3RlZD4uc29ydGluZ18xLHRhYmxlLmRhdGFUYWJsZS5vcmRlci1jb2x1bW4uaG92ZXIgdGJvZHkgdHI6aG92ZXIuc2VsZWN0ZWQ+LnNvcnRpbmdfMXtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKDEzLCAxMTAsIDI1MywgMC45ODIpO2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEodmFyKC0tZHQtcm93LXNlbGVjdGVkLCAwLjk4MikpfXRhYmxlLmRhdGFUYWJsZS5kaXNwbGF5IHRib2R5IHRyOmhvdmVyLnNlbGVjdGVkPi5zb3J0aW5nXzIsdGFibGUuZGF0YVRhYmxlLm9yZGVyLWNvbHVtbi5ob3ZlciB0Ym9keSB0cjpob3Zlci5zZWxlY3RlZD4uc29ydGluZ18ye2JveC1zaGFkb3c6aW5zZXQgMCAwIDAgOTk5OXB4IHJnYmEoMTMsIDExMCwgMjUzLCAwLjk3NCk7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSh2YXIoLS1kdC1yb3ctc2VsZWN0ZWQsIDAuOTc0KSl9dGFibGUuZGF0YVRhYmxlLmRpc3BsYXkgdGJvZHkgdHI6aG92ZXIuc2VsZWN0ZWQ+LnNvcnRpbmdfMyx0YWJsZS5kYXRhVGFibGUub3JkZXItY29sdW1uLmhvdmVyIHRib2R5IHRyOmhvdmVyLnNlbGVjdGVkPi5zb3J0aW5nXzN7Ym94LXNoYWRvdzppbnNldCAwIDAgMCA5OTk5cHggcmdiYSgxMywgMTEwLCAyNTMsIDAuOTYyKTtib3gtc2hhZG93Omluc2V0IDAgMCAwIDk5OTlweCByZ2JhKHZhcigtLWR0LXJvdy1zZWxlY3RlZCwgMC45NjIpKX10YWJsZS5kYXRhVGFibGUubm8tZm9vdGVye2JvcmRlci1ib3R0b206MXB4IHNvbGlkIHJnYmEoMCwgMCwgMCwgMC4zKX10YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0aGVhZCB0aCx0YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0aGVhZCB0ZCx0YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0Zm9vdCB0aCx0YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0Zm9vdCB0ZCx0YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0Ym9keSB0aCx0YWJsZS5kYXRhVGFibGUuY29tcGFjdCB0Ym9keSB0ZHtwYWRkaW5nOjRweH10YWJsZS5kYXRhVGFibGUgdGgsdGFibGUuZGF0YVRhYmxlIHRke2JveC1zaXppbmc6Y29udGVudC1ib3h9LmRhdGFUYWJsZXNfd3JhcHBlcntwb3NpdGlvbjpyZWxhdGl2ZTtjbGVhcjpib3RofS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfbGVuZ3Roe2Zsb2F0OmxlZnR9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19sZW5ndGggc2VsZWN0e2JvcmRlcjoxcHggc29saWQgI2FhYTtib3JkZXItcmFkaXVzOjNweDtwYWRkaW5nOjVweDtiYWNrZ3JvdW5kLWNvbG9yOnRyYW5zcGFyZW50O3BhZGRpbmc6NHB4fS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfZmlsdGVye2Zsb2F0OnJpZ2h0O3RleHQtYWxpZ246cmlnaHR9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19maWx0ZXIgaW5wdXR7Ym9yZGVyOjFweCBzb2xpZCAjYWFhO2JvcmRlci1yYWRpdXM6M3B4O3BhZGRpbmc6NXB4O2JhY2tncm91bmQtY29sb3I6dHJhbnNwYXJlbnQ7bWFyZ2luLWxlZnQ6M3B4fS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfaW5mb3tjbGVhcjpib3RoO2Zsb2F0OmxlZnQ7cGFkZGluZy10b3A6Ljc1NWVtfS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfcGFnaW5hdGV7ZmxvYXQ6cmlnaHQ7dGV4dC1hbGlnbjpyaWdodDtwYWRkaW5nLXRvcDouMjVlbX0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3BhZ2luYXRlIC5wYWdpbmF0ZV9idXR0b257Ym94LXNpemluZzpib3JkZXItYm94O2Rpc3BsYXk6aW5saW5lLWJsb2NrO21pbi13aWR0aDoxLjVlbTtwYWRkaW5nOi41ZW0gMWVtO21hcmdpbi1sZWZ0OjJweDt0ZXh0LWFsaWduOmNlbnRlcjt0ZXh0LWRlY29yYXRpb246bm9uZSAhaW1wb3J0YW50O2N1cnNvcjpwb2ludGVyO2NvbG9yOmluaGVyaXQgIWltcG9ydGFudDtib3JkZXI6MXB4IHNvbGlkIHRyYW5zcGFyZW50O2JvcmRlci1yYWRpdXM6MnB4O2JhY2tncm91bmQ6dHJhbnNwYXJlbnR9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZSAucGFnaW5hdGVfYnV0dG9uLmN1cnJlbnQsLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZSAucGFnaW5hdGVfYnV0dG9uLmN1cnJlbnQ6aG92ZXJ7Y29sb3I6aW5oZXJpdCAhaW1wb3J0YW50O2JvcmRlcjoxcHggc29saWQgcmdiYSgwLCAwLCAwLCAwLjMpO2JhY2tncm91bmQtY29sb3I6cmdiYSgyMzAsIDIzMCwgMjMwLCAwLjEpO2JhY2tncm91bmQ6LXdlYmtpdC1ncmFkaWVudChsaW5lYXIsIGxlZnQgdG9wLCBsZWZ0IGJvdHRvbSwgY29sb3Itc3RvcCgwJSwgcmdiYSgyMzAsIDIzMCwgMjMwLCAwLjEpKSwgY29sb3Itc3RvcCgxMDAlLCByZ2JhKDAsIDAsIDAsIDAuMSkpKTtiYWNrZ3JvdW5kOi13ZWJraXQtbGluZWFyLWdyYWRpZW50KHRvcCwgcmdiYSgyMzAsIDIzMCwgMjMwLCAwLjEpIDAlLCByZ2JhKDAsIDAsIDAsIDAuMSkgMTAwJSk7YmFja2dyb3VuZDotbW96LWxpbmVhci1ncmFkaWVudCh0b3AsIHJnYmEoMjMwLCAyMzAsIDIzMCwgMC4xKSAwJSwgcmdiYSgwLCAwLCAwLCAwLjEpIDEwMCUpO2JhY2tncm91bmQ6LW1zLWxpbmVhci1ncmFkaWVudCh0b3AsIHJnYmEoMjMwLCAyMzAsIDIzMCwgMC4xKSAwJSwgcmdiYSgwLCAwLCAwLCAwLjEpIDEwMCUpO2JhY2tncm91bmQ6LW8tbGluZWFyLWdyYWRpZW50KHRvcCwgcmdiYSgyMzAsIDIzMCwgMjMwLCAwLjEpIDAlLCByZ2JhKDAsIDAsIDAsIDAuMSkgMTAwJSk7YmFja2dyb3VuZDpsaW5lYXItZ3JhZGllbnQodG8gYm90dG9tLCByZ2JhKDIzMCwgMjMwLCAyMzAsIDAuMSkgMCUsIHJnYmEoMCwgMCwgMCwgMC4xKSAxMDAlKX0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3BhZ2luYXRlIC5wYWdpbmF0ZV9idXR0b24uZGlzYWJsZWQsLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZSAucGFnaW5hdGVfYnV0dG9uLmRpc2FibGVkOmhvdmVyLC5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfcGFnaW5hdGUgLnBhZ2luYXRlX2J1dHRvbi5kaXNhYmxlZDphY3RpdmV7Y3Vyc29yOmRlZmF1bHQ7Y29sb3I6IzY2NiAhaW1wb3J0YW50O2JvcmRlcjoxcHggc29saWQgdHJhbnNwYXJlbnQ7YmFja2dyb3VuZDp0cmFuc3BhcmVudDtib3gtc2hhZG93Om5vbmV9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZSAucGFnaW5hdGVfYnV0dG9uOmhvdmVye2NvbG9yOndoaXRlICFpbXBvcnRhbnQ7Ym9yZGVyOjFweCBzb2xpZCAjMTExO2JhY2tncm91bmQtY29sb3I6IzU4NTg1ODtiYWNrZ3JvdW5kOi13ZWJraXQtZ3JhZGllbnQobGluZWFyLCBsZWZ0IHRvcCwgbGVmdCBib3R0b20sIGNvbG9yLXN0b3AoMCUsICM1ODU4NTgpLCBjb2xvci1zdG9wKDEwMCUsICMxMTEpKTtiYWNrZ3JvdW5kOi13ZWJraXQtbGluZWFyLWdyYWRpZW50KHRvcCwgIzU4NTg1OCAwJSwgIzExMSAxMDAlKTtiYWNrZ3JvdW5kOi1tb3otbGluZWFyLWdyYWRpZW50KHRvcCwgIzU4NTg1OCAwJSwgIzExMSAxMDAlKTtiYWNrZ3JvdW5kOi1tcy1saW5lYXItZ3JhZGllbnQodG9wLCAjNTg1ODU4IDAlLCAjMTExIDEwMCUpO2JhY2tncm91bmQ6LW8tbGluZWFyLWdyYWRpZW50KHRvcCwgIzU4NTg1OCAwJSwgIzExMSAxMDAlKTtiYWNrZ3JvdW5kOmxpbmVhci1ncmFkaWVudCh0byBib3R0b20sICM1ODU4NTggMCUsICMxMTEgMTAwJSl9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZSAucGFnaW5hdGVfYnV0dG9uOmFjdGl2ZXtvdXRsaW5lOm5vbmU7YmFja2dyb3VuZC1jb2xvcjojMmIyYjJiO2JhY2tncm91bmQ6LXdlYmtpdC1ncmFkaWVudChsaW5lYXIsIGxlZnQgdG9wLCBsZWZ0IGJvdHRvbSwgY29sb3Itc3RvcCgwJSwgIzJiMmIyYiksIGNvbG9yLXN0b3AoMTAwJSwgIzBjMGMwYykpO2JhY2tncm91bmQ6LXdlYmtpdC1saW5lYXItZ3JhZGllbnQodG9wLCAjMmIyYjJiIDAlLCAjMGMwYzBjIDEwMCUpO2JhY2tncm91bmQ6LW1vei1saW5lYXItZ3JhZGllbnQodG9wLCAjMmIyYjJiIDAlLCAjMGMwYzBjIDEwMCUpO2JhY2tncm91bmQ6LW1zLWxpbmVhci1ncmFkaWVudCh0b3AsICMyYjJiMmIgMCUsICMwYzBjMGMgMTAwJSk7YmFja2dyb3VuZDotby1saW5lYXItZ3JhZGllbnQodG9wLCAjMmIyYjJiIDAlLCAjMGMwYzBjIDEwMCUpO2JhY2tncm91bmQ6bGluZWFyLWdyYWRpZW50KHRvIGJvdHRvbSwgIzJiMmIyYiAwJSwgIzBjMGMwYyAxMDAlKTtib3gtc2hhZG93Omluc2V0IDAgMCAzcHggIzExMX0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3BhZ2luYXRlIC5lbGxpcHNpc3twYWRkaW5nOjAgMWVtfS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfbGVuZ3RoLC5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfZmlsdGVyLC5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfaW5mbywuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Byb2Nlc3NpbmcsLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZXtjb2xvcjppbmhlcml0fS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfc2Nyb2xse2NsZWFyOmJvdGh9LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19zY3JvbGwgZGl2LmRhdGFUYWJsZXNfc2Nyb2xsQm9keXstd2Via2l0LW92ZXJmbG93LXNjcm9sbGluZzp0b3VjaH0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRoZWFkPnRyPnRoLC5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfc2Nyb2xsIGRpdi5kYXRhVGFibGVzX3Njcm9sbEJvZHk+dGFibGU+dGhlYWQ+dHI+dGQsLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19zY3JvbGwgZGl2LmRhdGFUYWJsZXNfc2Nyb2xsQm9keT50YWJsZT50Ym9keT50cj50aCwuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRib2R5PnRyPnRke3ZlcnRpY2FsLWFsaWduOm1pZGRsZX0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRoZWFkPnRyPnRoPmRpdi5kYXRhVGFibGVzX3NpemluZywuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRoZWFkPnRyPnRkPmRpdi5kYXRhVGFibGVzX3NpemluZywuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRib2R5PnRyPnRoPmRpdi5kYXRhVGFibGVzX3NpemluZywuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX3Njcm9sbCBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxlPnRib2R5PnRyPnRkPmRpdi5kYXRhVGFibGVzX3NpemluZ3toZWlnaHQ6MDtvdmVyZmxvdzpoaWRkZW47bWFyZ2luOjAgIWltcG9ydGFudDtwYWRkaW5nOjAgIWltcG9ydGFudH0uZGF0YVRhYmxlc193cmFwcGVyLm5vLWZvb3RlciAuZGF0YVRhYmxlc19zY3JvbGxCb2R5e2JvcmRlci1ib3R0b206MXB4IHNvbGlkIHJnYmEoMCwgMCwgMCwgMC4zKX0uZGF0YVRhYmxlc193cmFwcGVyLm5vLWZvb3RlciBkaXYuZGF0YVRhYmxlc19zY3JvbGxIZWFkIHRhYmxlLmRhdGFUYWJsZSwuZGF0YVRhYmxlc193cmFwcGVyLm5vLWZvb3RlciBkaXYuZGF0YVRhYmxlc19zY3JvbGxCb2R5PnRhYmxle2JvcmRlci1ib3R0b206bm9uZX0uZGF0YVRhYmxlc193cmFwcGVyOmFmdGVye3Zpc2liaWxpdHk6aGlkZGVuO2Rpc3BsYXk6YmxvY2s7Y29udGVudDoiIjtjbGVhcjpib3RoO2hlaWdodDowfUBtZWRpYSBzY3JlZW4gYW5kIChtYXgtd2lkdGg6IDc2N3B4KXsuZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX2luZm8sLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19wYWdpbmF0ZXtmbG9hdDpub25lO3RleHQtYWxpZ246Y2VudGVyfS5kYXRhVGFibGVzX3dyYXBwZXIgLmRhdGFUYWJsZXNfcGFnaW5hdGV7bWFyZ2luLXRvcDouNWVtfX1AbWVkaWEgc2NyZWVuIGFuZCAobWF4LXdpZHRoOiA2NDBweCl7LmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19sZW5ndGgsLmRhdGFUYWJsZXNfd3JhcHBlciAuZGF0YVRhYmxlc19maWx0ZXJ7ZmxvYXQ6bm9uZTt0ZXh0LWFsaWduOmNlbnRlcn0uZGF0YVRhYmxlc193cmFwcGVyIC5kYXRhVGFibGVzX2ZpbHRlcnttYXJnaW4tdG9wOi41ZW19fQo=\" rel=\"stylesheet\" />\n",
       "<link href=\"data:text/css;charset-utf-8;base64,LyogU2VsZWN0ZWQgcm93cy9jZWxscyAqLwp0YWJsZS5kYXRhVGFibGUgdHIuc2VsZWN0ZWQgdGQsIHRhYmxlLmRhdGFUYWJsZSB0ZC5zZWxlY3RlZCB7CiAgYmFja2dyb3VuZC1jb2xvcjogI2IwYmVkOSAhaW1wb3J0YW50Owp9Ci8qIEluIGNhc2Ugb2Ygc2Nyb2xsWC9ZIG9yIEZpeGVkSGVhZGVyICovCi5kYXRhVGFibGVzX3Njcm9sbEJvZHkgLmRhdGFUYWJsZXNfc2l6aW5nIHsKICB2aXNpYmlsaXR5OiBoaWRkZW47Cn0KCi8qIFRoZSBkYXRhdGFibGVzJyB0aGVtZSBDU1MgZmlsZSBkb2Vzbid0IGRlZmluZQp0aGUgY29sb3IgYnV0IHdpdGggd2hpdGUgYmFja2dyb3VuZC4gSXQgbGVhZHMgdG8gYW4gaXNzdWUgdGhhdAp3aGVuIHRoZSBIVE1MJ3MgYm9keSBjb2xvciBpcyBzZXQgdG8gJ3doaXRlJywgdGhlIHVzZXIgY2FuJ3QKc2VlIHRoZSB0ZXh0IHNpbmNlIHRoZSBiYWNrZ3JvdW5kIGlzIHdoaXRlLiBPbmUgY2FzZSBoYXBwZW5zIGluIHRoZQpSU3R1ZGlvJ3MgSURFIHdoZW4gaW5saW5lIHZpZXdpbmcgdGhlIERUIHRhYmxlIGluc2lkZSBhbiBSbWQgZmlsZSwKaWYgdGhlIElERSB0aGVtZSBpcyBzZXQgdG8gIkNvYmFsdCIuCgpTZWUgaHR0cHM6Ly9naXRodWIuY29tL3JzdHVkaW8vRFQvaXNzdWVzLzQ0NyBmb3IgbW9yZSBpbmZvCgpUaGlzIGZpeGVzIHNob3VsZCBoYXZlIGxpdHRsZSBzaWRlLWVmZmVjdHMgYmVjYXVzZSBhbGwgdGhlIG90aGVyIGVsZW1lbnRzCm9mIHRoZSBkZWZhdWx0IHRoZW1lIHVzZSB0aGUgIzMzMyBmb250IGNvbG9yLgoKVE9ETzogVGhlIHVwc3RyZWFtIG1heSB1c2UgcmVsYXRpdmUgY29sb3JzIGZvciBib3RoIHRoZSB0YWJsZSBiYWNrZ3JvdW5kCmFuZCB0aGUgY29sb3IuIEl0IG1lYW5zIHRoZSB0YWJsZSBjYW4gZGlzcGxheSB3ZWxsIHdpdGhvdXQgdGhpcyBwYXRjaAp0aGVuLiBBdCB0aGF0IHRpbWUsIHdlIG5lZWQgdG8gcmVtb3ZlIHRoZSBiZWxvdyBDU1MgYXR0cmlidXRlcy4KKi8KZGl2LmRhdGF0YWJsZXMgewogIGNvbG9yOiAjMzMzOwp9Cg==\" rel=\"stylesheet\" />\n",
       "<script title=\"crosstalk\" src=\"data:application/javascript;base64,IWZ1bmN0aW9uIG8odSxhLGwpe2Z1bmN0aW9uIHMobixlKXtpZighYVtuXSl7aWYoIXVbbl0pe3ZhciB0PSJmdW5jdGlvbiI9PXR5cGVvZiByZXF1aXJlJiZyZXF1aXJlO2lmKCFlJiZ0KXJldHVybiB0KG4sITApO2lmKGYpcmV0dXJuIGYobiwhMCk7dmFyIHI9bmV3IEVycm9yKCJDYW5ub3QgZmluZCBtb2R1bGUgJyIrbisiJyIpO3Rocm93IHIuY29kZT0iTU9EVUxFX05PVF9GT1VORCIscn12YXIgaT1hW25dPXtleHBvcnRzOnt9fTt1W25dWzBdLmNhbGwoaS5leHBvcnRzLGZ1bmN0aW9uKGUpe3ZhciB0PXVbbl1bMV1bZV07cmV0dXJuIHModHx8ZSl9LGksaS5leHBvcnRzLG8sdSxhLGwpfXJldHVybiBhW25dLmV4cG9ydHN9Zm9yKHZhciBmPSJmdW5jdGlvbiI9PXR5cGVvZiByZXF1aXJlJiZyZXF1aXJlLGU9MDtlPGwubGVuZ3RoO2UrKylzKGxbZV0pO3JldHVybiBzfSh7MTpbZnVuY3Rpb24oZSx0LG4peyJ1c2Ugc3RyaWN0IjtPYmplY3QuZGVmaW5lUHJvcGVydHkobiwiX19lc01vZHVsZSIse3ZhbHVlOiEwfSk7dmFyIHI9ZnVuY3Rpb24oKXtmdW5jdGlvbiByKGUsdCl7Zm9yKHZhciBuPTA7bjx0Lmxlbmd0aDtuKyspe3ZhciByPXRbbl07ci5lbnVtZXJhYmxlPXIuZW51bWVyYWJsZXx8ITEsci5jb25maWd1cmFibGU9ITAsInZhbHVlImluIHImJihyLndyaXRhYmxlPSEwKSxPYmplY3QuZGVmaW5lUHJvcGVydHkoZSxyLmtleSxyKX19cmV0dXJuIGZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gdCYmcihlLnByb3RvdHlwZSx0KSxuJiZyKGUsbiksZX19KCk7dmFyIGk9ZnVuY3Rpb24oKXtmdW5jdGlvbiBlKCl7IWZ1bmN0aW9uKGUsdCl7aWYoIShlIGluc3RhbmNlb2YgdCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiQ2Fubm90IGNhbGwgYSBjbGFzcyBhcyBhIGZ1bmN0aW9uIil9KHRoaXMsZSksdGhpcy5fdHlwZXM9e30sdGhpcy5fc2VxPTB9cmV0dXJuIHIoZSxbe2tleToib24iLHZhbHVlOmZ1bmN0aW9uKGUsdCl7dmFyIG49dGhpcy5fdHlwZXNbZV07bnx8KG49dGhpcy5fdHlwZXNbZV09e30pO3ZhciByPSJzdWIiK3RoaXMuX3NlcSsrO3JldHVybiBuW3JdPXQscn19LHtrZXk6Im9mZiIsdmFsdWU6ZnVuY3Rpb24oZSx0KXt2YXIgbj10aGlzLl90eXBlc1tlXTtpZigiZnVuY3Rpb24iPT10eXBlb2YgdCl7Zm9yKHZhciByIGluIG4paWYobi5oYXNPd25Qcm9wZXJ0eShyKSYmbltyXT09PXQpcmV0dXJuIGRlbGV0ZSBuW3JdLHI7cmV0dXJuITF9aWYoInN0cmluZyI9PXR5cGVvZiB0KXJldHVybiEoIW58fCFuW3RdKSYmKGRlbGV0ZSBuW3RdLHQpO3Rocm93IG5ldyBFcnJvcigiVW5leHBlY3RlZCB0eXBlIGZvciBsaXN0ZW5lciIpfX0se2tleToidHJpZ2dlciIsdmFsdWU6ZnVuY3Rpb24oZSx0LG4pe3ZhciByPXRoaXMuX3R5cGVzW2VdO2Zvcih2YXIgaSBpbiByKXIuaGFzT3duUHJvcGVydHkoaSkmJnJbaV0uY2FsbChuLHQpfX1dKSxlfSgpO24uZGVmYXVsdD1pfSx7fV0sMjpbZnVuY3Rpb24oZSx0LG4peyJ1c2Ugc3RyaWN0IjtPYmplY3QuZGVmaW5lUHJvcGVydHkobiwiX19lc01vZHVsZSIse3ZhbHVlOiEwfSksbi5GaWx0ZXJIYW5kbGU9dm9pZCAwO3ZhciByPWZ1bmN0aW9uKCl7ZnVuY3Rpb24gcihlLHQpe2Zvcih2YXIgbj0wO248dC5sZW5ndGg7bisrKXt2YXIgcj10W25dO3IuZW51bWVyYWJsZT1yLmVudW1lcmFibGV8fCExLHIuY29uZmlndXJhYmxlPSEwLCJ2YWx1ZSJpbiByJiYoci53cml0YWJsZT0hMCksT2JqZWN0LmRlZmluZVByb3BlcnR5KGUsci5rZXkscil9fXJldHVybiBmdW5jdGlvbihlLHQsbil7cmV0dXJuIHQmJnIoZS5wcm90b3R5cGUsdCksbiYmcihlLG4pLGV9fSgpLGk9bChlKCIuL2V2ZW50cyIpKSxvPWwoZSgiLi9maWx0ZXJzZXQiKSksdT1sKGUoIi4vZ3JvdXAiKSksYT1mdW5jdGlvbihlKXt7aWYoZSYmZS5fX2VzTW9kdWxlKXJldHVybiBlO3ZhciB0PXt9O2lmKG51bGwhPWUpZm9yKHZhciBuIGluIGUpT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsKGUsbikmJih0W25dPWVbbl0pO3JldHVybiB0LmRlZmF1bHQ9ZSx0fX0oZSgiLi91dGlsIikpO2Z1bmN0aW9uIGwoZSl7cmV0dXJuIGUmJmUuX19lc01vZHVsZT9lOntkZWZhdWx0OmV9fXZhciBzPTE7bi5GaWx0ZXJIYW5kbGU9ZnVuY3Rpb24oKXtmdW5jdGlvbiBuKGUsdCl7IWZ1bmN0aW9uKGUsdCl7aWYoIShlIGluc3RhbmNlb2YgdCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiQ2Fubm90IGNhbGwgYSBjbGFzcyBhcyBhIGZ1bmN0aW9uIil9KHRoaXMsbiksdGhpcy5fZXZlbnRSZWxheT1uZXcgaS5kZWZhdWx0LHRoaXMuX2VtaXR0ZXI9bmV3IGEuU3Vic2NyaXB0aW9uVHJhY2tlcih0aGlzLl9ldmVudFJlbGF5KSx0aGlzLl9ncm91cD1udWxsLHRoaXMuX2ZpbHRlclNldD1udWxsLHRoaXMuX2ZpbHRlclZhcj1udWxsLHRoaXMuX3Zhck9uQ2hhbmdlU3ViPW51bGwsdGhpcy5fZXh0cmFJbmZvPWEuZXh0ZW5kKHtzZW5kZXI6dGhpc30sdCksdGhpcy5faWQ9ImZpbHRlciIrcysrLHRoaXMuc2V0R3JvdXAoZSl9cmV0dXJuIHIobixbe2tleToic2V0R3JvdXAiLHZhbHVlOmZ1bmN0aW9uKGUpe3ZhciB0LG4scj10aGlzO2lmKHRoaXMuX2dyb3VwIT09ZSYmKCh0aGlzLl9ncm91cHx8ZSkmJih0aGlzLl9maWx0ZXJWYXImJih0aGlzLl9maWx0ZXJWYXIub2ZmKCJjaGFuZ2UiLHRoaXMuX3Zhck9uQ2hhbmdlU3ViKSx0aGlzLmNsZWFyKCksdGhpcy5fdmFyT25DaGFuZ2VTdWI9bnVsbCx0aGlzLl9maWx0ZXJWYXI9bnVsbCx0aGlzLl9maWx0ZXJTZXQ9bnVsbCksdGhpcy5fZ3JvdXA9ZSkpKXtlPSgwLHUuZGVmYXVsdCkoZSksdGhpcy5fZmlsdGVyU2V0PSh0PWUudmFyKCJmaWx0ZXJzZXQiKSwobj10LmdldCgpKXx8KG49bmV3IG8uZGVmYXVsdCx0LnNldChuKSksbiksdGhpcy5fZmlsdGVyVmFyPSgwLHUuZGVmYXVsdCkoZSkudmFyKCJmaWx0ZXIiKTt2YXIgaT10aGlzLl9maWx0ZXJWYXIub24oImNoYW5nZSIsZnVuY3Rpb24oZSl7ci5fZXZlbnRSZWxheS50cmlnZ2VyKCJjaGFuZ2UiLGUscil9KTt0aGlzLl92YXJPbkNoYW5nZVN1Yj1pfX19LHtrZXk6Il9tZXJnZUV4dHJhSW5mbyIsdmFsdWU6ZnVuY3Rpb24oZSl7cmV0dXJuIGEuZXh0ZW5kKHt9LHRoaXMuX2V4dHJhSW5mbz90aGlzLl9leHRyYUluZm86bnVsbCxlfHxudWxsKX19LHtrZXk6ImNsb3NlIix2YWx1ZTpmdW5jdGlvbigpe3RoaXMuX2VtaXR0ZXIucmVtb3ZlQWxsTGlzdGVuZXJzKCksdGhpcy5jbGVhcigpLHRoaXMuc2V0R3JvdXAobnVsbCl9fSx7a2V5OiJjbGVhciIsdmFsdWU6ZnVuY3Rpb24oZSl7dGhpcy5fZmlsdGVyU2V0JiYodGhpcy5fZmlsdGVyU2V0LmNsZWFyKHRoaXMuX2lkKSx0aGlzLl9vbkNoYW5nZShlKSl9fSx7a2V5OiJzZXQiLHZhbHVlOmZ1bmN0aW9uKGUsdCl7dGhpcy5fZmlsdGVyU2V0JiYodGhpcy5fZmlsdGVyU2V0LnVwZGF0ZSh0aGlzLl9pZCxlKSx0aGlzLl9vbkNoYW5nZSh0KSl9fSx7a2V5OiJvbiIsdmFsdWU6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gdGhpcy5fZW1pdHRlci5vbihlLHQpfX0se2tleToib2ZmIix2YWx1ZTpmdW5jdGlvbihlLHQpe3JldHVybiB0aGlzLl9lbWl0dGVyLm9mZihlLHQpfX0se2tleToiX29uQ2hhbmdlIix2YWx1ZTpmdW5jdGlvbihlKXt0aGlzLl9maWx0ZXJTZXQmJnRoaXMuX2ZpbHRlclZhci5zZXQodGhpcy5fZmlsdGVyU2V0LnZhbHVlLHRoaXMuX21lcmdlRXh0cmFJbmZvKGUpKX19LHtrZXk6ImZpbHRlcmVkS2V5cyIsZ2V0OmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuX2ZpbHRlclNldD90aGlzLl9maWx0ZXJTZXQudmFsdWU6bnVsbH19XSksbn0oKX0seyIuL2V2ZW50cyI6MSwiLi9maWx0ZXJzZXQiOjMsIi4vZ3JvdXAiOjQsIi4vdXRpbCI6MTF9XSwzOltmdW5jdGlvbihlLHQsbil7InVzZSBzdHJpY3QiO09iamVjdC5kZWZpbmVQcm9wZXJ0eShuLCJfX2VzTW9kdWxlIix7dmFsdWU6ITB9KTt2YXIgcj1mdW5jdGlvbigpe2Z1bmN0aW9uIHIoZSx0KXtmb3IodmFyIG49MDtuPHQubGVuZ3RoO24rKyl7dmFyIHI9dFtuXTtyLmVudW1lcmFibGU9ci5lbnVtZXJhYmxlfHwhMSxyLmNvbmZpZ3VyYWJsZT0hMCwidmFsdWUiaW4gciYmKHIud3JpdGFibGU9ITApLE9iamVjdC5kZWZpbmVQcm9wZXJ0eShlLHIua2V5LHIpfX1yZXR1cm4gZnVuY3Rpb24oZSx0LG4pe3JldHVybiB0JiZyKGUucHJvdG90eXBlLHQpLG4mJnIoZSxuKSxlfX0oKSxhPWUoIi4vdXRpbCIpO2Z1bmN0aW9uIGwoZSx0KXtyZXR1cm4gZT09PXQ/MDplPHQ/LTE6dDxlPzE6dm9pZCAwfXZhciBpPWZ1bmN0aW9uKCl7ZnVuY3Rpb24gZSgpeyFmdW5jdGlvbihlLHQpe2lmKCEoZSBpbnN0YW5jZW9mIHQpKXRocm93IG5ldyBUeXBlRXJyb3IoIkNhbm5vdCBjYWxsIGEgY2xhc3MgYXMgYSBmdW5jdGlvbiIpfSh0aGlzLGUpLHRoaXMucmVzZXQoKX1yZXR1cm4gcihlLFt7a2V5OiJyZXNldCIsdmFsdWU6ZnVuY3Rpb24oKXt0aGlzLl9oYW5kbGVzPXt9LHRoaXMuX2tleXM9e30sdGhpcy5fdmFsdWU9bnVsbCx0aGlzLl9hY3RpdmVIYW5kbGVzPTB9fSx7a2V5OiJ1cGRhdGUiLHZhbHVlOmZ1bmN0aW9uKGUsdCl7bnVsbCE9PXQmJih0PXQuc2xpY2UoMCkpLnNvcnQobCk7dmFyIG49KDAsYS5kaWZmU29ydGVkTGlzdHMpKHRoaXMuX2hhbmRsZXNbZV0sdCkscj1uLmFkZGVkLGk9bi5yZW1vdmVkO3RoaXMuX2hhbmRsZXNbZV09dDtmb3IodmFyIG89MDtvPHIubGVuZ3RoO28rKyl0aGlzLl9rZXlzW3Jbb11dPSh0aGlzLl9rZXlzW3Jbb11dfHwwKSsxO2Zvcih2YXIgdT0wO3U8aS5sZW5ndGg7dSsrKXRoaXMuX2tleXNbaVt1XV0tLTt0aGlzLl91cGRhdGVWYWx1ZSh0KX19LHtrZXk6Il91cGRhdGVWYWx1ZSIsdmFsdWU6ZnVuY3Rpb24oKXt2YXIgZT0wPGFyZ3VtZW50cy5sZW5ndGgmJnZvaWQgMCE9PWFyZ3VtZW50c1swXT9hcmd1bWVudHNbMF06dGhpcy5fYWxsS2V5cyx0PU9iamVjdC5rZXlzKHRoaXMuX2hhbmRsZXMpLmxlbmd0aDtpZigwPT09dCl0aGlzLl92YWx1ZT1udWxsO2Vsc2V7dGhpcy5fdmFsdWU9W107Zm9yKHZhciBuPTA7bjxlLmxlbmd0aDtuKyspe3RoaXMuX2tleXNbZVtuXV09PT10JiZ0aGlzLl92YWx1ZS5wdXNoKGVbbl0pfX19fSx7a2V5OiJjbGVhciIsdmFsdWU6ZnVuY3Rpb24oZSl7aWYodm9pZCAwIT09dGhpcy5faGFuZGxlc1tlXSl7dmFyIHQ9dGhpcy5faGFuZGxlc1tlXTt0fHwodD1bXSk7Zm9yKHZhciBuPTA7bjx0Lmxlbmd0aDtuKyspdGhpcy5fa2V5c1t0W25dXS0tO2RlbGV0ZSB0aGlzLl9oYW5kbGVzW2VdLHRoaXMuX3VwZGF0ZVZhbHVlKCl9fX0se2tleToidmFsdWUiLGdldDpmdW5jdGlvbigpe3JldHVybiB0aGlzLl92YWx1ZX19LHtrZXk6Il9hbGxLZXlzIixnZXQ6ZnVuY3Rpb24oKXt2YXIgZT1PYmplY3Qua2V5cyh0aGlzLl9rZXlzKTtyZXR1cm4gZS5zb3J0KGwpLGV9fV0pLGV9KCk7bi5kZWZhdWx0PWl9LHsiLi91dGlsIjoxMX1dLDQ6W2Z1bmN0aW9uKGwsZSxzKXsoZnVuY3Rpb24oZSl7InVzZSBzdHJpY3QiO09iamVjdC5kZWZpbmVQcm9wZXJ0eShzLCJfX2VzTW9kdWxlIix7dmFsdWU6ITB9KTt2YXIgbj1mdW5jdGlvbigpe2Z1bmN0aW9uIHIoZSx0KXtmb3IodmFyIG49MDtuPHQubGVuZ3RoO24rKyl7dmFyIHI9dFtuXTtyLmVudW1lcmFibGU9ci5lbnVtZXJhYmxlfHwhMSxyLmNvbmZpZ3VyYWJsZT0hMCwidmFsdWUiaW4gciYmKHIud3JpdGFibGU9ITApLE9iamVjdC5kZWZpbmVQcm9wZXJ0eShlLHIua2V5LHIpfX1yZXR1cm4gZnVuY3Rpb24oZSx0LG4pe3JldHVybiB0JiZyKGUucHJvdG90eXBlLHQpLG4mJnIoZSxuKSxlfX0oKSxyPSJmdW5jdGlvbiI9PXR5cGVvZiBTeW1ib2wmJiJzeW1ib2wiPT10eXBlb2YgU3ltYm9sLml0ZXJhdG9yP2Z1bmN0aW9uKGUpe3JldHVybiB0eXBlb2YgZX06ZnVuY3Rpb24oZSl7cmV0dXJuIGUmJiJmdW5jdGlvbiI9PXR5cGVvZiBTeW1ib2wmJmUuY29uc3RydWN0b3I9PT1TeW1ib2wmJmUhPT1TeW1ib2wucHJvdG90eXBlPyJzeW1ib2wiOnR5cGVvZiBlfTtzLmRlZmF1bHQ9ZnVuY3Rpb24gZSh0KXt7aWYodCYmInN0cmluZyI9PXR5cGVvZiB0KXJldHVybiB1Lmhhc093blByb3BlcnR5KHQpfHwodVt0XT1uZXcgYSh0KSksdVt0XTtpZigib2JqZWN0Ij09PSh2b2lkIDA9PT10PyJ1bmRlZmluZWQiOnIodCkpJiZ0Ll92YXJzJiZ0LnZhcilyZXR1cm4gdDtpZihBcnJheS5pc0FycmF5KHQpJiYxPT10Lmxlbmd0aCYmInN0cmluZyI9PXR5cGVvZiB0WzBdKXJldHVybiBlKHRbMF0pO3Rocm93IG5ldyBFcnJvcigiSW52YWxpZCBncm91cE5hbWUgYXJndW1lbnQiKX19O3ZhciB0LGk9bCgiLi92YXIiKSxvPSh0PWkpJiZ0Ll9fZXNNb2R1bGU/dDp7ZGVmYXVsdDp0fTtlLl9fY3Jvc3N0YWxrX2dyb3Vwcz1lLl9fY3Jvc3N0YWxrX2dyb3Vwc3x8e307dmFyIHU9ZS5fX2Nyb3NzdGFsa19ncm91cHM7dmFyIGE9ZnVuY3Rpb24oKXtmdW5jdGlvbiB0KGUpeyFmdW5jdGlvbihlLHQpe2lmKCEoZSBpbnN0YW5jZW9mIHQpKXRocm93IG5ldyBUeXBlRXJyb3IoIkNhbm5vdCBjYWxsIGEgY2xhc3MgYXMgYSBmdW5jdGlvbiIpfSh0aGlzLHQpLHRoaXMubmFtZT1lLHRoaXMuX3ZhcnM9e319cmV0dXJuIG4odCxbe2tleToidmFyIix2YWx1ZTpmdW5jdGlvbihlKXtpZighZXx8InN0cmluZyIhPXR5cGVvZiBlKXRocm93IG5ldyBFcnJvcigiSW52YWxpZCB2YXIgbmFtZSIpO3JldHVybiB0aGlzLl92YXJzLmhhc093blByb3BlcnR5KGUpfHwodGhpcy5fdmFyc1tlXT1uZXcgby5kZWZhdWx0KHRoaXMsZSkpLHRoaXMuX3ZhcnNbZV19fSx7a2V5OiJoYXMiLHZhbHVlOmZ1bmN0aW9uKGUpe2lmKCFlfHwic3RyaW5nIiE9dHlwZW9mIGUpdGhyb3cgbmV3IEVycm9yKCJJbnZhbGlkIHZhciBuYW1lIik7cmV0dXJuIHRoaXMuX3ZhcnMuaGFzT3duUHJvcGVydHkoZSl9fV0pLHR9KCl9KS5jYWxsKHRoaXMsInVuZGVmaW5lZCIhPXR5cGVvZiBnbG9iYWw/Z2xvYmFsOiJ1bmRlZmluZWQiIT10eXBlb2Ygc2VsZj9zZWxmOiJ1bmRlZmluZWQiIT10eXBlb2Ygd2luZG93P3dpbmRvdzp7fSl9LHsiLi92YXIiOjEyfV0sNTpbZnVuY3Rpb24oZixlLGMpeyhmdW5jdGlvbihlKXsidXNlIHN0cmljdCI7T2JqZWN0LmRlZmluZVByb3BlcnR5KGMsIl9fZXNNb2R1bGUiLHt2YWx1ZTohMH0pO3ZhciB0LG49ZigiLi9ncm91cCIpLHI9KHQ9bikmJnQuX19lc01vZHVsZT90OntkZWZhdWx0OnR9LGk9ZigiLi9zZWxlY3Rpb24iKSxvPWYoIi4vZmlsdGVyIiksdT1mKCIuL2lucHV0Iik7ZigiLi9pbnB1dF9zZWxlY3RpemUiKSxmKCIuL2lucHV0X2NoZWNrYm94Z3JvdXAiKSxmKCIuL2lucHV0X3NsaWRlciIpO3ZhciBhPSgwLHIuZGVmYXVsdCkoImRlZmF1bHQiKTtmdW5jdGlvbiBsKGUpe3JldHVybiBhLnZhcihlKX1lLlNoaW55JiZlLlNoaW55LmFkZEN1c3RvbU1lc3NhZ2VIYW5kbGVyKCJ1cGRhdGUtY2xpZW50LXZhbHVlIixmdW5jdGlvbihlKXsic3RyaW5nIj09dHlwZW9mIGUuZ3JvdXA/KDAsci5kZWZhdWx0KShlLmdyb3VwKS52YXIoZS5uYW1lKS5zZXQoZS52YWx1ZSk6bChlLm5hbWUpLnNldChlLnZhbHVlKX0pO3ZhciBzPXtncm91cDpyLmRlZmF1bHQsdmFyOmwsaGFzOmZ1bmN0aW9uKGUpe3JldHVybiBhLmhhcyhlKX0sU2VsZWN0aW9uSGFuZGxlOmkuU2VsZWN0aW9uSGFuZGxlLEZpbHRlckhhbmRsZTpvLkZpbHRlckhhbmRsZSxiaW5kOnUuYmluZH07Yy5kZWZhdWx0PXMsZS5jcm9zc3RhbGs9c30pLmNhbGwodGhpcywidW5kZWZpbmVkIiE9dHlwZW9mIGdsb2JhbD9nbG9iYWw6InVuZGVmaW5lZCIhPXR5cGVvZiBzZWxmP3NlbGY6InVuZGVmaW5lZCIhPXR5cGVvZiB3aW5kb3c/d2luZG93Ont9KX0seyIuL2ZpbHRlciI6MiwiLi9ncm91cCI6NCwiLi9pbnB1dCI6NiwiLi9pbnB1dF9jaGVja2JveGdyb3VwIjo3LCIuL2lucHV0X3NlbGVjdGl6ZSI6OCwiLi9pbnB1dF9zbGlkZXIiOjksIi4vc2VsZWN0aW9uIjoxMH1dLDY6W2Z1bmN0aW9uKGUsdCxhKXsoZnVuY3Rpb24odCl7InVzZSBzdHJpY3QiO09iamVjdC5kZWZpbmVQcm9wZXJ0eShhLCJfX2VzTW9kdWxlIix7dmFsdWU6ITB9KSxhLnJlZ2lzdGVyPWZ1bmN0aW9uKGUpe3JbZS5jbGFzc05hbWVdPWUsdC5kb2N1bWVudCYmImNvbXBsZXRlIiE9PXQuZG9jdW1lbnQucmVhZHlTdGF0ZT9vKGZ1bmN0aW9uKCl7bigpfSk6dC5kb2N1bWVudCYmc2V0VGltZW91dChuLDEwMCl9LGEuYmluZD1uO3ZhciBvPXQualF1ZXJ5LHI9e307ZnVuY3Rpb24gbigpe09iamVjdC5rZXlzKHIpLmZvckVhY2goZnVuY3Rpb24oZSl7dmFyIG49cltlXTtvKCIuIituLmNsYXNzTmFtZSkubm90KCIuY3Jvc3N0YWxrLWlucHV0LWJvdW5kIikuZWFjaChmdW5jdGlvbihlLHQpe2kobix0KX0pfSl9ZnVuY3Rpb24gaShlLHQpe3ZhciBuPW8odCkuZmluZCgic2NyaXB0W3R5cGU9J2FwcGxpY2F0aW9uL2pzb24nXVtkYXRhLWZvcj0nIit0LmlkLnJlcGxhY2UoLyhbISIjJCUmJygpKissLi86Ozw9Pj9AW1xcXF1eYHt8fX5dKS9nLCJcXCQxIikrIiddIikscj1KU09OLnBhcnNlKG5bMF0uaW5uZXJUZXh0KSxpPWUuZmFjdG9yeSh0LHIpO28odCkuZGF0YSgiY3Jvc3N0YWxrLWluc3RhbmNlIixpKSxvKHQpLmFkZENsYXNzKCJjcm9zc3RhbGstaW5wdXQtYm91bmQiKX1pZih0LlNoaW55KXt2YXIgZT1uZXcgdC5TaGlueS5JbnB1dEJpbmRpbmcsdT10LmpRdWVyeTt1LmV4dGVuZChlLHtmaW5kOmZ1bmN0aW9uKGUpe3JldHVybiB1KGUpLmZpbmQoIi5jcm9zc3RhbGstaW5wdXQiKX0saW5pdGlhbGl6ZTpmdW5jdGlvbihlKXt2YXIgdCxuO3UoZSkuaGFzQ2xhc3MoImNyb3NzdGFsay1pbnB1dC1ib3VuZCIpfHwobj1vKHQ9ZSksT2JqZWN0LmtleXMocikuZm9yRWFjaChmdW5jdGlvbihlKXtuLmhhc0NsYXNzKGUpJiYhbi5oYXNDbGFzcygiY3Jvc3N0YWxrLWlucHV0LWJvdW5kIikmJmkocltlXSx0KX0pKX0sZ2V0SWQ6ZnVuY3Rpb24oZSl7cmV0dXJuIGUuaWR9LGdldFZhbHVlOmZ1bmN0aW9uKGUpe30sc2V0VmFsdWU6ZnVuY3Rpb24oZSx0KXt9LHJlY2VpdmVNZXNzYWdlOmZ1bmN0aW9uKGUsdCl7fSxzdWJzY3JpYmU6ZnVuY3Rpb24oZSx0KXt1KGUpLmRhdGEoImNyb3NzdGFsay1pbnN0YW5jZSIpLnJlc3VtZSgpfSx1bnN1YnNjcmliZTpmdW5jdGlvbihlKXt1KGUpLmRhdGEoImNyb3NzdGFsay1pbnN0YW5jZSIpLnN1c3BlbmQoKX19KSx0LlNoaW55LmlucHV0QmluZGluZ3MucmVnaXN0ZXIoZSwiY3Jvc3N0YWxrLmlucHV0QmluZGluZyIpfX0pLmNhbGwodGhpcywidW5kZWZpbmVkIiE9dHlwZW9mIGdsb2JhbD9nbG9iYWw6InVuZGVmaW5lZCIhPXR5cGVvZiBzZWxmP3NlbGY6InVuZGVmaW5lZCIhPXR5cGVvZiB3aW5kb3c/d2luZG93Ont9KX0se31dLDc6W2Z1bmN0aW9uKHIsZSx0KXsoZnVuY3Rpb24oZSl7InVzZSBzdHJpY3QiO3ZhciB0PWZ1bmN0aW9uKGUpe3tpZihlJiZlLl9fZXNNb2R1bGUpcmV0dXJuIGU7dmFyIHQ9e307aWYobnVsbCE9ZSlmb3IodmFyIG4gaW4gZSlPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwoZSxuKSYmKHRbbl09ZVtuXSk7cmV0dXJuIHQuZGVmYXVsdD1lLHR9fShyKCIuL2lucHV0IikpLG49cigiLi9maWx0ZXIiKTt2YXIgYT1lLmpRdWVyeTt0LnJlZ2lzdGVyKHtjbGFzc05hbWU6ImNyb3NzdGFsay1pbnB1dC1jaGVja2JveGdyb3VwIixmYWN0b3J5OmZ1bmN0aW9uKGUscil7dmFyIGk9bmV3IG4uRmlsdGVySGFuZGxlKHIuZ3JvdXApLG89dm9pZCAwLHU9YShlKTtyZXR1cm4gdS5vbigiY2hhbmdlIiwiaW5wdXRbdHlwZT0nY2hlY2tib3gnXSIsZnVuY3Rpb24oKXt2YXIgZT11LmZpbmQoImlucHV0W3R5cGU9J2NoZWNrYm94J106Y2hlY2tlZCIpO2lmKDA9PT1lLmxlbmd0aClvPW51bGwsaS5jbGVhcigpO2Vsc2V7dmFyIHQ9e307ZS5lYWNoKGZ1bmN0aW9uKCl7ci5tYXBbdGhpcy52YWx1ZV0uZm9yRWFjaChmdW5jdGlvbihlKXt0W2VdPSEwfSl9KTt2YXIgbj1PYmplY3Qua2V5cyh0KTtuLnNvcnQoKSxvPW4saS5zZXQobil9fSkse3N1c3BlbmQ6ZnVuY3Rpb24oKXtpLmNsZWFyKCl9LHJlc3VtZTpmdW5jdGlvbigpe28mJmkuc2V0KG8pfX19fSl9KS5jYWxsKHRoaXMsInVuZGVmaW5lZCIhPXR5cGVvZiBnbG9iYWw/Z2xvYmFsOiJ1bmRlZmluZWQiIT10eXBlb2Ygc2VsZj9zZWxmOiJ1bmRlZmluZWQiIT10eXBlb2Ygd2luZG93P3dpbmRvdzp7fSl9LHsiLi9maWx0ZXIiOjIsIi4vaW5wdXQiOjZ9XSw4OltmdW5jdGlvbihyLGUsdCl7KGZ1bmN0aW9uKGUpeyJ1c2Ugc3RyaWN0Ijt2YXIgdD1uKHIoIi4vaW5wdXQiKSksbD1uKHIoIi4vdXRpbCIpKSxzPXIoIi4vZmlsdGVyIik7ZnVuY3Rpb24gbihlKXtpZihlJiZlLl9fZXNNb2R1bGUpcmV0dXJuIGU7dmFyIHQ9e307aWYobnVsbCE9ZSlmb3IodmFyIG4gaW4gZSlPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwoZSxuKSYmKHRbbl09ZVtuXSk7cmV0dXJuIHQuZGVmYXVsdD1lLHR9dmFyIGY9ZS5qUXVlcnk7dC5yZWdpc3Rlcih7Y2xhc3NOYW1lOiJjcm9zc3RhbGstaW5wdXQtc2VsZWN0IixmYWN0b3J5OmZ1bmN0aW9uKGUsbil7dmFyIHQ9bC5kYXRhZnJhbWVUb0QzKG4uaXRlbXMpLHI9e29wdGlvbnM6W3t2YWx1ZToiIixsYWJlbDoiKEFsbCkifV0uY29uY2F0KHQpLHZhbHVlRmllbGQ6InZhbHVlIixsYWJlbEZpZWxkOiJsYWJlbCIsc2VhcmNoRmllbGQ6ImxhYmVsIn0saT1mKGUpLmZpbmQoInNlbGVjdCIpWzBdLG89ZihpKS5zZWxlY3RpemUocilbMF0uc2VsZWN0aXplLHU9bmV3IHMuRmlsdGVySGFuZGxlKG4uZ3JvdXApLGE9dm9pZCAwO3JldHVybiBvLm9uKCJjaGFuZ2UiLGZ1bmN0aW9uKCl7aWYoMD09PW8uaXRlbXMubGVuZ3RoKWE9bnVsbCx1LmNsZWFyKCk7ZWxzZXt2YXIgdD17fTtvLml0ZW1zLmZvckVhY2goZnVuY3Rpb24oZSl7bi5tYXBbZV0uZm9yRWFjaChmdW5jdGlvbihlKXt0W2VdPSEwfSl9KTt2YXIgZT1PYmplY3Qua2V5cyh0KTtlLnNvcnQoKSxhPWUsdS5zZXQoZSl9fSkse3N1c3BlbmQ6ZnVuY3Rpb24oKXt1LmNsZWFyKCl9LHJlc3VtZTpmdW5jdGlvbigpe2EmJnUuc2V0KGEpfX19fSl9KS5jYWxsKHRoaXMsInVuZGVmaW5lZCIhPXR5cGVvZiBnbG9iYWw/Z2xvYmFsOiJ1bmRlZmluZWQiIT10eXBlb2Ygc2VsZj9zZWxmOiJ1bmRlZmluZWQiIT10eXBlb2Ygd2luZG93P3dpbmRvdzp7fSl9LHsiLi9maWx0ZXIiOjIsIi4vaW5wdXQiOjYsIi4vdXRpbCI6MTF9XSw5OltmdW5jdGlvbihuLGUsdCl7KGZ1bmN0aW9uKGUpeyJ1c2Ugc3RyaWN0Ijt2YXIgZD1mdW5jdGlvbihlLHQpe2lmKEFycmF5LmlzQXJyYXkoZSkpcmV0dXJuIGU7aWYoU3ltYm9sLml0ZXJhdG9yIGluIE9iamVjdChlKSlyZXR1cm4gZnVuY3Rpb24oZSx0KXt2YXIgbj1bXSxyPSEwLGk9ITEsbz12b2lkIDA7dHJ5e2Zvcih2YXIgdSxhPWVbU3ltYm9sLml0ZXJhdG9yXSgpOyEocj0odT1hLm5leHQoKSkuZG9uZSkmJihuLnB1c2godS52YWx1ZSksIXR8fG4ubGVuZ3RoIT09dCk7cj0hMCk7fWNhdGNoKGUpe2k9ITAsbz1lfWZpbmFsbHl7dHJ5eyFyJiZhLnJldHVybiYmYS5yZXR1cm4oKX1maW5hbGx5e2lmKGkpdGhyb3cgb319cmV0dXJuIG59KGUsdCk7dGhyb3cgbmV3IFR5cGVFcnJvcigiSW52YWxpZCBhdHRlbXB0IHRvIGRlc3RydWN0dXJlIG5vbi1pdGVyYWJsZSBpbnN0YW5jZSIpfSx0PWZ1bmN0aW9uKGUpe3tpZihlJiZlLl9fZXNNb2R1bGUpcmV0dXJuIGU7dmFyIHQ9e307aWYobnVsbCE9ZSlmb3IodmFyIG4gaW4gZSlPYmplY3QucHJvdG90eXBlLmhhc093blByb3BlcnR5LmNhbGwoZSxuKSYmKHRbbl09ZVtuXSk7cmV0dXJuIHQuZGVmYXVsdD1lLHR9fShuKCIuL2lucHV0IikpLGE9bigiLi9maWx0ZXIiKTt2YXIgdj1lLmpRdWVyeSxwPWUuc3RyZnRpbWU7ZnVuY3Rpb24geShlLHQpe2Zvcih2YXIgbj1lLnRvU3RyaW5nKCk7bi5sZW5ndGg8dDspbj0iMCIrbjtyZXR1cm4gbn10LnJlZ2lzdGVyKHtjbGFzc05hbWU6ImNyb3NzdGFsay1pbnB1dC1zbGlkZXIiLGZhY3Rvcnk6ZnVuY3Rpb24oZSxsKXt2YXIgcz1uZXcgYS5GaWx0ZXJIYW5kbGUobC5ncm91cCksdD17fSxmPXYoZSkuZmluZCgiaW5wdXQiKSxuPWYuZGF0YSgiZGF0YS10eXBlIikscj1mLmRhdGEoInRpbWUtZm9ybWF0IiksaT1mLmRhdGEoInJvdW5kIiksbz12b2lkIDA7aWYoImRhdGUiPT09bilvPXAudXRjKCksdC5wcmV0dGlmeT1mdW5jdGlvbihlKXtyZXR1cm4gbyhyLG5ldyBEYXRlKGUpKX07ZWxzZSBpZigiZGF0ZXRpbWUiPT09bil7dmFyIHU9Zi5kYXRhKCJ0aW1lem9uZSIpO289dT9wLnRpbWV6b25lKHUpOnAsdC5wcmV0dGlmeT1mdW5jdGlvbihlKXtyZXR1cm4gbyhyLG5ldyBEYXRlKGUpKX19ZWxzZSJudW1iZXIiPT09biYmdm9pZCAwIT09aSYmKHQucHJldHRpZnk9ZnVuY3Rpb24oZSl7dmFyIHQ9TWF0aC5wb3coMTAsaSk7cmV0dXJuIE1hdGgucm91bmQoZSp0KS90fSk7ZnVuY3Rpb24gYygpe3ZhciBlPWYuZGF0YSgiaW9uUmFuZ2VTbGlkZXIiKS5yZXN1bHQsdD12b2lkIDAsbj1mLmRhdGEoImRhdGEtdHlwZSIpO3JldHVybiB0PSJkYXRlIj09PW4/ZnVuY3Rpb24oZSl7cmV0dXJuKHQ9bmV3IERhdGUoK2UpKWluc3RhbmNlb2YgRGF0ZT90LmdldFVUQ0Z1bGxZZWFyKCkrIi0iK3kodC5nZXRVVENNb250aCgpKzEsMikrIi0iK3kodC5nZXRVVENEYXRlKCksMik6bnVsbDt2YXIgdH06ImRhdGV0aW1lIj09PW4/ZnVuY3Rpb24oZSl7cmV0dXJuK2UvMWUzfTpmdW5jdGlvbihlKXtyZXR1cm4rZX0sImRvdWJsZSI9PT1mLmRhdGEoImlvblJhbmdlU2xpZGVyIikub3B0aW9ucy50eXBlP1t0KGUuZnJvbSksdChlLnRvKV06dChlLmZyb20pfWYuaW9uUmFuZ2VTbGlkZXIodCk7dmFyIGg9bnVsbDtyZXR1cm4gZi5vbigiY2hhbmdlLmNyb3NzdGFsa1NsaWRlcklucHV0IixmdW5jdGlvbihlKXtpZighZi5kYXRhKCJ1cGRhdGluZyIpJiYhZi5kYXRhKCJhbmltYXRpbmciKSl7Zm9yKHZhciB0PWMoKSxuPWQodCwyKSxyPW5bMF0saT1uWzFdLG89W10sdT0wO3U8bC52YWx1ZXMubGVuZ3RoO3UrKyl7dmFyIGE9bC52YWx1ZXNbdV07cjw9YSYmYTw9aSYmby5wdXNoKGwua2V5c1t1XSl9by5zb3J0KCkscy5zZXQobyksaD1vfX0pLHtzdXNwZW5kOmZ1bmN0aW9uKCl7cy5jbGVhcigpfSxyZXN1bWU6ZnVuY3Rpb24oKXtoJiZzLnNldChoKX19fX0pfSkuY2FsbCh0aGlzLCJ1bmRlZmluZWQiIT10eXBlb2YgZ2xvYmFsP2dsb2JhbDoidW5kZWZpbmVkIiE9dHlwZW9mIHNlbGY/c2VsZjoidW5kZWZpbmVkIiE9dHlwZW9mIHdpbmRvdz93aW5kb3c6e30pfSx7Ii4vZmlsdGVyIjoyLCIuL2lucHV0Ijo2fV0sMTA6W2Z1bmN0aW9uKGUsdCxuKXsidXNlIHN0cmljdCI7T2JqZWN0LmRlZmluZVByb3BlcnR5KG4sIl9fZXNNb2R1bGUiLHt2YWx1ZTohMH0pLG4uU2VsZWN0aW9uSGFuZGxlPXZvaWQgMDt2YXIgcj1mdW5jdGlvbigpe2Z1bmN0aW9uIHIoZSx0KXtmb3IodmFyIG49MDtuPHQubGVuZ3RoO24rKyl7dmFyIHI9dFtuXTtyLmVudW1lcmFibGU9ci5lbnVtZXJhYmxlfHwhMSxyLmNvbmZpZ3VyYWJsZT0hMCwidmFsdWUiaW4gciYmKHIud3JpdGFibGU9ITApLE9iamVjdC5kZWZpbmVQcm9wZXJ0eShlLHIua2V5LHIpfX1yZXR1cm4gZnVuY3Rpb24oZSx0LG4pe3JldHVybiB0JiZyKGUucHJvdG90eXBlLHQpLG4mJnIoZSxuKSxlfX0oKSxpPWEoZSgiLi9ldmVudHMiKSksbz1hKGUoIi4vZ3JvdXAiKSksdT1mdW5jdGlvbihlKXt7aWYoZSYmZS5fX2VzTW9kdWxlKXJldHVybiBlO3ZhciB0PXt9O2lmKG51bGwhPWUpZm9yKHZhciBuIGluIGUpT2JqZWN0LnByb3RvdHlwZS5oYXNPd25Qcm9wZXJ0eS5jYWxsKGUsbikmJih0W25dPWVbbl0pO3JldHVybiB0LmRlZmF1bHQ9ZSx0fX0oZSgiLi91dGlsIikpO2Z1bmN0aW9uIGEoZSl7cmV0dXJuIGUmJmUuX19lc01vZHVsZT9lOntkZWZhdWx0OmV9fW4uU2VsZWN0aW9uSGFuZGxlPWZ1bmN0aW9uKCl7ZnVuY3Rpb24gbigpe3ZhciBlPTA8YXJndW1lbnRzLmxlbmd0aCYmdm9pZCAwIT09YXJndW1lbnRzWzBdP2FyZ3VtZW50c1swXTpudWxsLHQ9MTxhcmd1bWVudHMubGVuZ3RoJiZ2b2lkIDAhPT1hcmd1bWVudHNbMV0/YXJndW1lbnRzWzFdOm51bGw7IWZ1bmN0aW9uKGUsdCl7aWYoIShlIGluc3RhbmNlb2YgdCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiQ2Fubm90IGNhbGwgYSBjbGFzcyBhcyBhIGZ1bmN0aW9uIil9KHRoaXMsbiksdGhpcy5fZXZlbnRSZWxheT1uZXcgaS5kZWZhdWx0LHRoaXMuX2VtaXR0ZXI9bmV3IHUuU3Vic2NyaXB0aW9uVHJhY2tlcih0aGlzLl9ldmVudFJlbGF5KSx0aGlzLl9ncm91cD1udWxsLHRoaXMuX3Zhcj1udWxsLHRoaXMuX3Zhck9uQ2hhbmdlU3ViPW51bGwsdGhpcy5fZXh0cmFJbmZvPXUuZXh0ZW5kKHtzZW5kZXI6dGhpc30sdCksdGhpcy5zZXRHcm91cChlKX1yZXR1cm4gcihuLFt7a2V5OiJzZXRHcm91cCIsdmFsdWU6ZnVuY3Rpb24oZSl7dmFyIHQ9dGhpcztpZih0aGlzLl9ncm91cCE9PWUmJih0aGlzLl9ncm91cHx8ZSkmJih0aGlzLl92YXImJih0aGlzLl92YXIub2ZmKCJjaGFuZ2UiLHRoaXMuX3Zhck9uQ2hhbmdlU3ViKSx0aGlzLl92YXI9bnVsbCx0aGlzLl92YXJPbkNoYW5nZVN1Yj1udWxsKSx0aGlzLl9ncm91cD1lKSl7dGhpcy5fdmFyPSgwLG8uZGVmYXVsdCkoZSkudmFyKCJzZWxlY3Rpb24iKTt2YXIgbj10aGlzLl92YXIub24oImNoYW5nZSIsZnVuY3Rpb24oZSl7dC5fZXZlbnRSZWxheS50cmlnZ2VyKCJjaGFuZ2UiLGUsdCl9KTt0aGlzLl92YXJPbkNoYW5nZVN1Yj1ufX19LHtrZXk6Il9tZXJnZUV4dHJhSW5mbyIsdmFsdWU6ZnVuY3Rpb24oZSl7cmV0dXJuIHUuZXh0ZW5kKHt9LHRoaXMuX2V4dHJhSW5mbz90aGlzLl9leHRyYUluZm86bnVsbCxlfHxudWxsKX19LHtrZXk6InNldCIsdmFsdWU6ZnVuY3Rpb24oZSx0KXt0aGlzLl92YXImJnRoaXMuX3Zhci5zZXQoZSx0aGlzLl9tZXJnZUV4dHJhSW5mbyh0KSl9fSx7a2V5OiJjbGVhciIsdmFsdWU6ZnVuY3Rpb24oZSl7dGhpcy5fdmFyJiZ0aGlzLnNldCh2b2lkIDAsdGhpcy5fbWVyZ2VFeHRyYUluZm8oZSkpfX0se2tleToib24iLHZhbHVlOmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHRoaXMuX2VtaXR0ZXIub24oZSx0KX19LHtrZXk6Im9mZiIsdmFsdWU6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gdGhpcy5fZW1pdHRlci5vZmYoZSx0KX19LHtrZXk6ImNsb3NlIix2YWx1ZTpmdW5jdGlvbigpe3RoaXMuX2VtaXR0ZXIucmVtb3ZlQWxsTGlzdGVuZXJzKCksdGhpcy5zZXRHcm91cChudWxsKX19LHtrZXk6InZhbHVlIixnZXQ6ZnVuY3Rpb24oKXtyZXR1cm4gdGhpcy5fdmFyP3RoaXMuX3Zhci5nZXQoKTpudWxsfX1dKSxufSgpfSx7Ii4vZXZlbnRzIjoxLCIuL2dyb3VwIjo0LCIuL3V0aWwiOjExfV0sMTE6W2Z1bmN0aW9uKGUsdCxuKXsidXNlIHN0cmljdCI7T2JqZWN0LmRlZmluZVByb3BlcnR5KG4sIl9fZXNNb2R1bGUiLHt2YWx1ZTohMH0pO3ZhciByPWZ1bmN0aW9uKCl7ZnVuY3Rpb24gcihlLHQpe2Zvcih2YXIgbj0wO248dC5sZW5ndGg7bisrKXt2YXIgcj10W25dO3IuZW51bWVyYWJsZT1yLmVudW1lcmFibGV8fCExLHIuY29uZmlndXJhYmxlPSEwLCJ2YWx1ZSJpbiByJiYoci53cml0YWJsZT0hMCksT2JqZWN0LmRlZmluZVByb3BlcnR5KGUsci5rZXkscil9fXJldHVybiBmdW5jdGlvbihlLHQsbil7cmV0dXJuIHQmJnIoZS5wcm90b3R5cGUsdCksbiYmcihlLG4pLGV9fSgpLGw9ImZ1bmN0aW9uIj09dHlwZW9mIFN5bWJvbCYmInN5bWJvbCI9PXR5cGVvZiBTeW1ib2wuaXRlcmF0b3I/ZnVuY3Rpb24oZSl7cmV0dXJuIHR5cGVvZiBlfTpmdW5jdGlvbihlKXtyZXR1cm4gZSYmImZ1bmN0aW9uIj09dHlwZW9mIFN5bWJvbCYmZS5jb25zdHJ1Y3Rvcj09PVN5bWJvbCYmZSE9PVN5bWJvbC5wcm90b3R5cGU/InN5bWJvbCI6dHlwZW9mIGV9O2Z1bmN0aW9uIHUoZSl7Zm9yKHZhciB0PTE7dDxlLmxlbmd0aDt0KyspaWYoZVt0XTw9ZVt0LTFdKXRocm93IG5ldyBFcnJvcigiTGlzdCBpcyBub3Qgc29ydGVkIG9yIGNvbnRhaW5zIGR1cGxpY2F0ZSIpfW4uZXh0ZW5kPWZ1bmN0aW9uKGUpe2Zvcih2YXIgdD1hcmd1bWVudHMubGVuZ3RoLG49QXJyYXkoMTx0P3QtMTowKSxyPTE7cjx0O3IrKyluW3ItMV09YXJndW1lbnRzW3JdO2Zvcih2YXIgaT0wO2k8bi5sZW5ndGg7aSsrKXt2YXIgbz1uW2ldO2lmKG51bGwhPW8pZm9yKHZhciB1IGluIG8pby5oYXNPd25Qcm9wZXJ0eSh1KSYmKGVbdV09b1t1XSl9cmV0dXJuIGV9LG4uY2hlY2tTb3J0ZWQ9dSxuLmRpZmZTb3J0ZWRMaXN0cz1mdW5jdGlvbihlLHQpe3ZhciBuPTAscj0wO2V8fChlPVtdKTt0fHwodD1bXSk7dmFyIGk9W10sbz1bXTt1KGUpLHUodCk7Zm9yKDtuPGUubGVuZ3RoJiZyPHQubGVuZ3RoOyllW25dPT09dFtyXT8obisrLHIrKyk6ZVtuXTx0W3JdP2kucHVzaChlW24rK10pOm8ucHVzaCh0W3IrK10pO248ZS5sZW5ndGgmJihpPWkuY29uY2F0KGUuc2xpY2UobikpKTtyPHQubGVuZ3RoJiYobz1vLmNvbmNhdCh0LnNsaWNlKHIpKSk7cmV0dXJue3JlbW92ZWQ6aSxhZGRlZDpvfX0sbi5kYXRhZnJhbWVUb0QzPWZ1bmN0aW9uKGUpe3ZhciB0PVtdLG49dm9pZCAwO2Zvcih2YXIgciBpbiBlKXtpZihlLmhhc093blByb3BlcnR5KHIpJiZ0LnB1c2gociksIm9iamVjdCIhPT1sKGVbcl0pfHx2b2lkIDA9PT1lW3JdLmxlbmd0aCl0aHJvdyBuZXcgRXJyb3IoIkFsbCBmaWVsZHMgbXVzdCBiZSBhcnJheXMiKTtpZih2b2lkIDAhPT1uJiZuIT09ZVtyXS5sZW5ndGgpdGhyb3cgbmV3IEVycm9yKCJBbGwgZmllbGRzIG11c3QgYmUgYXJyYXlzIG9mIHRoZSBzYW1lIGxlbmd0aCIpO249ZVtyXS5sZW5ndGh9Zm9yKHZhciBpPVtdLG89dm9pZCAwLHU9MDt1PG47dSsrKXtvPXt9O2Zvcih2YXIgYT0wO2E8dC5sZW5ndGg7YSsrKW9bdFthXV09ZVt0W2FdXVt1XTtpLnB1c2gobyl9cmV0dXJuIGl9O24uU3Vic2NyaXB0aW9uVHJhY2tlcj1mdW5jdGlvbigpe2Z1bmN0aW9uIHQoZSl7IWZ1bmN0aW9uKGUsdCl7aWYoIShlIGluc3RhbmNlb2YgdCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiQ2Fubm90IGNhbGwgYSBjbGFzcyBhcyBhIGZ1bmN0aW9uIil9KHRoaXMsdCksdGhpcy5fZW1pdHRlcj1lLHRoaXMuX3N1YnM9e319cmV0dXJuIHIodCxbe2tleToib24iLHZhbHVlOmZ1bmN0aW9uKGUsdCl7dmFyIG49dGhpcy5fZW1pdHRlci5vbihlLHQpO3JldHVybiB0aGlzLl9zdWJzW25dPWUsbn19LHtrZXk6Im9mZiIsdmFsdWU6ZnVuY3Rpb24oZSx0KXt2YXIgbj10aGlzLl9lbWl0dGVyLm9mZihlLHQpO3JldHVybiBuJiZkZWxldGUgdGhpcy5fc3Vic1tuXSxufX0se2tleToicmVtb3ZlQWxsTGlzdGVuZXJzIix2YWx1ZTpmdW5jdGlvbigpe3ZhciB0PXRoaXMsbj10aGlzLl9zdWJzO3RoaXMuX3N1YnM9e30sT2JqZWN0LmtleXMobikuZm9yRWFjaChmdW5jdGlvbihlKXt0Ll9lbWl0dGVyLm9mZihuW2VdLGUpfSl9fV0pLHR9KCl9LHt9XSwxMjpbZnVuY3Rpb24oYSxlLGwpeyhmdW5jdGlvbihvKXsidXNlIHN0cmljdCI7T2JqZWN0LmRlZmluZVByb3BlcnR5KGwsIl9fZXNNb2R1bGUiLHt2YWx1ZTohMH0pO3ZhciBlLHU9ImZ1bmN0aW9uIj09dHlwZW9mIFN5bWJvbCYmInN5bWJvbCI9PXR5cGVvZiBTeW1ib2wuaXRlcmF0b3I/ZnVuY3Rpb24oZSl7cmV0dXJuIHR5cGVvZiBlfTpmdW5jdGlvbihlKXtyZXR1cm4gZSYmImZ1bmN0aW9uIj09dHlwZW9mIFN5bWJvbCYmZS5jb25zdHJ1Y3Rvcj09PVN5bWJvbCYmZSE9PVN5bWJvbC5wcm90b3R5cGU/InN5bWJvbCI6dHlwZW9mIGV9LHQ9ZnVuY3Rpb24oKXtmdW5jdGlvbiByKGUsdCl7Zm9yKHZhciBuPTA7bjx0Lmxlbmd0aDtuKyspe3ZhciByPXRbbl07ci5lbnVtZXJhYmxlPXIuZW51bWVyYWJsZXx8ITEsci5jb25maWd1cmFibGU9ITAsInZhbHVlImluIHImJihyLndyaXRhYmxlPSEwKSxPYmplY3QuZGVmaW5lUHJvcGVydHkoZSxyLmtleSxyKX19cmV0dXJuIGZ1bmN0aW9uKGUsdCxuKXtyZXR1cm4gdCYmcihlLnByb3RvdHlwZSx0KSxuJiZyKGUsbiksZX19KCksbj1hKCIuL2V2ZW50cyIpLGk9KGU9bikmJmUuX19lc01vZHVsZT9lOntkZWZhdWx0OmV9O3ZhciByPWZ1bmN0aW9uKCl7ZnVuY3Rpb24gcihlLHQsbil7IWZ1bmN0aW9uKGUsdCl7aWYoIShlIGluc3RhbmNlb2YgdCkpdGhyb3cgbmV3IFR5cGVFcnJvcigiQ2Fubm90IGNhbGwgYSBjbGFzcyBhcyBhIGZ1bmN0aW9uIil9KHRoaXMsciksdGhpcy5fZ3JvdXA9ZSx0aGlzLl9uYW1lPXQsdGhpcy5fdmFsdWU9bix0aGlzLl9ldmVudHM9bmV3IGkuZGVmYXVsdH1yZXR1cm4gdChyLFt7a2V5OiJnZXQiLHZhbHVlOmZ1bmN0aW9uKCl7cmV0dXJuIHRoaXMuX3ZhbHVlfX0se2tleToic2V0Iix2YWx1ZTpmdW5jdGlvbihlLHQpe2lmKHRoaXMuX3ZhbHVlIT09ZSl7dmFyIG49dGhpcy5fdmFsdWU7dGhpcy5fdmFsdWU9ZTt2YXIgcj17fTtpZih0JiYib2JqZWN0Ij09PSh2b2lkIDA9PT10PyJ1bmRlZmluZWQiOnUodCkpKWZvcih2YXIgaSBpbiB0KXQuaGFzT3duUHJvcGVydHkoaSkmJihyW2ldPXRbaV0pO3Iub2xkVmFsdWU9bixyLnZhbHVlPWUsdGhpcy5fZXZlbnRzLnRyaWdnZXIoImNoYW5nZSIscix0aGlzKSxvLlNoaW55JiZvLlNoaW55Lm9uSW5wdXRDaGFuZ2UmJm8uU2hpbnkub25JbnB1dENoYW5nZSgiLmNsaWVudFZhbHVlLSIrKG51bGwhPT10aGlzLl9ncm91cC5uYW1lP3RoaXMuX2dyb3VwLm5hbWUrIi0iOiIiKSt0aGlzLl9uYW1lLHZvaWQgMD09PWU/bnVsbDplKX19fSx7a2V5OiJvbiIsdmFsdWU6ZnVuY3Rpb24oZSx0KXtyZXR1cm4gdGhpcy5fZXZlbnRzLm9uKGUsdCl9fSx7a2V5OiJvZmYiLHZhbHVlOmZ1bmN0aW9uKGUsdCl7cmV0dXJuIHRoaXMuX2V2ZW50cy5vZmYoZSx0KX19XSkscn0oKTtsLmRlZmF1bHQ9cn0pLmNhbGwodGhpcywidW5kZWZpbmVkIiE9dHlwZW9mIGdsb2JhbD9nbG9iYWw6InVuZGVmaW5lZCIhPXR5cGVvZiBzZWxmP3NlbGY6InVuZGVmaW5lZCIhPXR5cGVvZiB3aW5kb3c/d2luZG93Ont9KX0seyIuL2V2ZW50cyI6MX1dfSx7fSxbNV0pOwovLyMgc291cmNlTWFwcGluZ1VSTD1jcm9zc3RhbGsubWluLmpzLm1hcA==\"></script>\n",
       "<link href=\"data:text/css;charset-utf-8;base64,LmNvbnRhaW5lci1mbHVpZC5jcm9zc3RhbGstYnNjb2xze21hcmdpbi1sZWZ0Oi0zMHB4O21hcmdpbi1yaWdodDotMzBweDt3aGl0ZS1zcGFjZTpub3JtYWx9Ym9keT4uY29udGFpbmVyLWZsdWlkLmNyb3NzdGFsay1ic2NvbHN7bWFyZ2luLWxlZnQ6YXV0bzttYXJnaW4tcmlnaHQ6YXV0b30uY3Jvc3N0YWxrLWlucHV0LWNoZWNrYm94Z3JvdXAgLmNyb3NzdGFsay1vcHRpb25zLWdyb3VwIC5jcm9zc3RhbGstb3B0aW9ucy1jb2x1bW57ZGlzcGxheTppbmxpbmUtYmxvY2s7cGFkZGluZy1yaWdodDoxMnB4O3ZlcnRpY2FsLWFsaWduOnRvcH1AbWVkaWEgb25seSBzY3JlZW4gYW5kIChtYXgtd2lkdGg6IDQ4MHB4KXsuY3Jvc3N0YWxrLWlucHV0LWNoZWNrYm94Z3JvdXAgLmNyb3NzdGFsay1vcHRpb25zLWdyb3VwIC5jcm9zc3RhbGstb3B0aW9ucy1jb2x1bW57ZGlzcGxheTpibG9jaztwYWRkaW5nLXJpZ2h0OmluaGVyaXR9fS5jcm9zc3RhbGstaW5wdXR7bWFyZ2luLWJvdHRvbToxNXB4fS5jcm9zc3RhbGstaW5wdXQgLmNvbnRyb2wtbGFiZWx7bWFyZ2luLWJvdHRvbTowO3ZlcnRpY2FsLWFsaWduOm1pZGRsZX0uY3Jvc3N0YWxrLWlucHV0IGlucHV0W3R5cGU9ImNoZWNrYm94Il17bWFyZ2luOjRweCAwIDA7bWFyZ2luLXRvcDoxcHg7bGluZS1oZWlnaHQ6bm9ybWFsfS5jcm9zc3RhbGstaW5wdXQgLmNoZWNrYm94e3Bvc2l0aW9uOnJlbGF0aXZlO2Rpc3BsYXk6YmxvY2s7bWFyZ2luLXRvcDoxMHB4O21hcmdpbi1ib3R0b206MTBweH0uY3Jvc3N0YWxrLWlucHV0IC5jaGVja2JveD5sYWJlbHtwYWRkaW5nLWxlZnQ6MjBweDttYXJnaW4tYm90dG9tOjA7Zm9udC13ZWlnaHQ6NDAwO2N1cnNvcjpwb2ludGVyfS5jcm9zc3RhbGstaW5wdXQgLmNoZWNrYm94IGlucHV0W3R5cGU9ImNoZWNrYm94Il0sLmNyb3NzdGFsay1pbnB1dCAuY2hlY2tib3gtaW5saW5lIGlucHV0W3R5cGU9ImNoZWNrYm94Il17cG9zaXRpb246YWJzb2x1dGU7bWFyZ2luLXRvcDoycHg7bWFyZ2luLWxlZnQ6LTIwcHh9LmNyb3NzdGFsay1pbnB1dCAuY2hlY2tib3grLmNoZWNrYm94e21hcmdpbi10b3A6LTVweH0uY3Jvc3N0YWxrLWlucHV0IC5jaGVja2JveC1pbmxpbmV7cG9zaXRpb246cmVsYXRpdmU7ZGlzcGxheTppbmxpbmUtYmxvY2s7cGFkZGluZy1sZWZ0OjIwcHg7bWFyZ2luLWJvdHRvbTowO2ZvbnQtd2VpZ2h0OjQwMDt2ZXJ0aWNhbC1hbGlnbjptaWRkbGU7Y3Vyc29yOnBvaW50ZXJ9LmNyb3NzdGFsay1pbnB1dCAuY2hlY2tib3gtaW5saW5lKy5jaGVja2JveC1pbmxpbmV7bWFyZ2luLXRvcDowO21hcmdpbi1sZWZ0OjEwcHh9Cg==\" rel=\"stylesheet\" />\n",
       "\t</head>\n",
       "\t<body>\n",
       "\t\t<div class=\"datatables html-widget html-fill-item\" id=\"htmlwidget-76e4161f3f5f724a4491\" style=\"width:100%;height:auto;\"></div>\n",
       "<script type=\"application/json\" data-for=\"htmlwidget-76e4161f3f5f724a4491\">{\"x\":{\"filter\":\"none\",\"vertical\":false,\"data\":[[\"1\",\"2\",\"3\"],[\"Logistic Regression with Ridge Penalty\",\"Linear Regression with Lasso Penalty\",\"Gradient Boosting Machine\"],[0.832,0.835,0.866],[0.752,0.754,0.783],[0.495,0.492,0.441],[0.6929999999999999,0.702,0.759],[0.675,0.679,0.722],[0.829,0.822,0.8139999999999999]],\"container\":\"<table class=\\\"display\\\">\\n  <thead>\\n    <tr>\\n      <th> <\\/th>\\n      <th>Model<\\/th>\\n      <th>AUC<\\/th>\\n      <th>Accuracy<\\/th>\\n      <th>Log Loss<\\/th>\\n      <th>TNR<\\/th>\\n      <th>TPR<\\/th>\\n      <th>Precision<\\/th>\\n    <\\/tr>\\n  <\\/thead>\\n<\\/table>\",\"options\":{\"pageLength\":5,\"columnDefs\":[{\"className\":\"dt-right\",\"targets\":[2,3,4,5,6,7]},{\"orderable\":false,\"targets\":0}],\"order\":[],\"autoWidth\":false,\"orderClasses\":false,\"lengthMenu\":[5,10,25,50,100]}},\"evals\":[],\"jsHooks\":[]}</script>\n",
       "\t</body>\n",
       "</html>\n"
      ],
      "text/plain": [
       "HTML widgets cannot be represented in plain text (need html)"
      ]
     },
     "metadata": {
      "text/html": {
       "isolated": true
      }
     },
     "output_type": "display_data"
    }
   ],
   "source": [
    "install.packages(\"DT\")\n",
    "library(DT)\n",
    "\n",
    "datatable(final_mod_metrics, options = list(pageLength = 5))"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 48,
   "id": "ba14e819",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:20:01.698366Z",
     "iopub.status.busy": "2023-12-07T21:20:01.696671Z",
     "iopub.status.idle": "2023-12-07T21:20:01.711021Z",
     "shell.execute_reply": "2023-12-07T21:20:01.709151Z"
    },
    "papermill": {
     "duration": 0.070833,
     "end_time": "2023-12-07T21:20:01.714328",
     "exception": false,
     "start_time": "2023-12-07T21:20:01.643495",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#ls()"
   ]
  },
  {
   "cell_type": "code",
   "execution_count": 49,
   "id": "12b72987",
   "metadata": {
    "execution": {
     "iopub.execute_input": "2023-12-07T21:20:01.818133Z",
     "iopub.status.busy": "2023-12-07T21:20:01.816422Z",
     "iopub.status.idle": "2023-12-07T21:20:28.504301Z",
     "shell.execute_reply": "2023-12-07T21:20:28.501875Z"
    },
    "papermill": {
     "duration": 26.74398,
     "end_time": "2023-12-07T21:20:28.507866",
     "exception": false,
     "start_time": "2023-12-07T21:20:01.763886",
     "status": "completed"
    },
    "tags": []
   },
   "outputs": [],
   "source": [
    "#save.image(\"./ridge.RData\")\n",
    "save(gbm1, file = \"gbm1.RData\")"
   ]
  }
 ],
 "metadata": {
  "kaggle": {
   "accelerator": "none",
   "dataSources": [
    {
     "databundleVersionId": 6622892,
     "sourceId": 60891,
     "sourceType": "competition"
    }
   ],
   "isGpuEnabled": false,
   "isInternetEnabled": true,
   "language": "r",
   "sourceType": "notebook"
  },
  "kernelspec": {
   "display_name": "R",
   "language": "R",
   "name": "ir"
  },
  "language_info": {
   "codemirror_mode": "r",
   "file_extension": ".r",
   "mimetype": "text/x-r-source",
   "name": "R",
   "pygments_lexer": "r",
   "version": "4.0.5"
  },
  "papermill": {
   "default_parameters": {},
   "duration": 3765.32722,
   "end_time": "2023-12-07T21:20:28.780758",
   "environment_variables": {},
   "exception": null,
   "input_path": "__notebook__.ipynb",
   "output_path": "__notebook__.ipynb",
   "parameters": {},
   "start_time": "2023-12-07T20:17:43.453538",
   "version": "2.5.0"
  }
 },
 "nbformat": 4,
 "nbformat_minor": 5
}
