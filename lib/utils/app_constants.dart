class AppConstants{


  ///API constants
  static const String baseUrl = "https://earthena.cognospheredynamics.com/api";
  
  //doctor
  static const String loginDoctor = "$baseUrl/auth/Doctorlogin";
  static const String createDoctor = "$baseUrl/auth/Doctorregister";
  static const String doctorProfile = "$baseUrl/auth/profileDoctor";
  static const String getAllDoctors = "$baseUrl/auth/getAllDoctors";
  static const String deleteDoctor = "$baseUrl/auth/deleteDoctor/";

  //patient
  static const String loginPatient = "$baseUrl/auth/Patientlogin";
  static const String createPatient = "$baseUrl/auth/Patientregister";
  static const String pateintProfile = "$baseUrl/auth/profilePatient";
  static const String getAllPatients = "$baseUrl/auth/getAllPatients";

  //admin
  static const String loginAdmin = "$baseUrl/auth/adminlogin";
  static const String createAdmin = "$baseUrl/auth/Adminregister";
  static const String adminProfile = "$baseUrl/auth/profileAdmin";

  //bookings
  static const String getAllBookings = "$baseUrl/auth/getAllBooking";
  static const String createBooking = "$baseUrl/auth/createBooking";
  static const String getBookingByDoctor = "$baseUrl/auth/getBookingByDoctor/";
  static const String getBookingByPatient = "$baseUrl/auth/getBookingByPatient/";
  static const String deleteBooking = "$baseUrl/auth/deleteBooking/";
  static const String updateBookingStatus = "$baseUrl/auth/updateBookingStatus/";

  //articles
  static const String createArticle = "$baseUrl/auth/createArticle";
  static const String getAllArticle = "$baseUrl/auth/getAllArticle";
  static const String getArticleById = "$baseUrl/auth/getSingleArticle/";
  static const String deleteArticle = "$baseUrl/auth/deleteArticle";
  static const String getArticleByDoctor = "$baseUrl/auth/getArticlesByDoctor";


  //create group
  static const String createGroup = "$baseUrl/auth/createGoup";
  static const String getAllGroups = "$baseUrl/auth/getAllGroups";
  static const String getGroupByDoctor = "$baseUrl/auth/getGroupByDoctor/";
  static const String getSingleGroup = "$baseUrl/auth/getSingleGroup/";
  static const String deleteGroup = "$baseUrl/auth/deleteGoup/";






  static const String overviewString =  "Prostate cancer is the second-most diagnosed cancer in men.  About 80 percent of prostate cancers are diagnosed at a localized stage, which means that the cancer hasn’t spread outside of the prostate. The average age at the time of prostate cancer diagnosis is about 66. \n\nThere has been an increase in the number of elderly men getting severely affected by Prostate Cancer (PCa), but this can be solved if men during their youthful stage screen and prevent the cancer from spreading and growing in case they have it. However, very few male youths have information about Prostate Cancer. Access to Prostate Cancer information as well as the effective management and sharing of this information, are crucial for promoting good health and well-being for all individuals including the youth. \n\nOf the well-known over 200 different types of human cancers, Prostate cancer (PCa) is among the top cancers causing deaths to males globally. However, learning more about prostate cancer and prostate-related health issues can help optimize health.";
  static const String assesmentQoutes = "Check your risk in 30 seconds.\n\nIt is the most cancer in men, but the earlier you find it, the easier it is to treat.\n\nAnswer these quick questions to check your risk. These questions are part of the validated international prostate symptom scores (IPSS). \n \nUrinary symptoms.";
  
  static const List<String> basics = [
    'Prostate Cancer Stages',
    'Prostate Cancer Symptoms',
    'Prostate Cancer Risk Factors',
    'Prostate Cancer Prognosis',
    'Prostate Cancer Statistics'
    ];

  static const List<Map<String, String>> basics2 = [
    {
      "label": "Prostate Cancer Stages",
      "response": "Following a prostate cancer diagnosis, staging is used to describe the extent of the disease. Prostate cancer staging is vital because it is used to guide the treatment plan and predict the patient’s prognosis.\n\n1.Clinical Stages\n\nThe clinical stage is based on the results of the urologist's physical examination of the patient's prostate (including a digital rectal exam (DRE)) and any other tests done prior to definitive treatment (i.e., surgery or radiation).\n\nThe following clinical stages are used to describe prostate cancer:\n\n• T1: The tumor cannot be felt during the DRE or  seen during imaging (e.g., a computed tomography (CT) scan or transrectal ultrasound). It may be found when surgery is done for another medical condition. \n◦ T1a: The tumor is discovered accidentally during a surgical procedure used to treat benign prostatic hyperplasia (BPH), which is the abnormal growth of benign prostate cells. Cancer is only found in 5 percent or less of the tissue removed. \n◦ T1b: The tumor is found accidentally during BPH surgery. Cancer cells are detected in more than 5 percent of the tissue removed. \n◦ T1c: The tumor is found during a needle biopsy that was performed because of an elevated PSA level. \n• T2: The tumor appears to be confined to the prostate. Due to the size of the tumor, the doctor can feel it during the DRE. The cancer may also be seen with imaging. \n◦ T2a: The tumor has invaded one-half (or less) of one side of the prostate. \n◦ T2b: The tumor has spread to more than one-half of one side of the prostate, but not to both sides. \n◦ T2c: The cancer has invaded both sides of the prostate. \n• T3: The tumor has grown outside the prostate. It may have spread to the seminal vesicles. \n◦ T3a: The tumor has developed outside the prostate; however, it has not spread to the seminal vesicles. \n◦ T3b: The tumor has spread to the seminal vesicles. \n• T4: The tumor has spread to tissues next to the prostate other than the seminal vesicles. For example, the cancer may be growing in the rectum, bladder, urethral sphincter (muscle that controls urination) and/or pelvic wall. "
    },
    {
      "label": "Prostate Cancer Risk Factors",
      "response": "In general, all men are at risk for prostate cancer during their lifetime. However, there are specific risk factors that increase the likelihood for developing the disease.\n\nAge\n\nAggressive prostate cancer is virtually nonexistent in men under 40. With age, however, the risk of developing prostate cancer increases. According to the American Cancer Society, about 60 percent  of all prostate cancers are diagnosed in men over 65.\n\nRace\n\nThe Centers for Disease Control and Prevention reports that African-American men have the highest rate of prostate cancer, followed by white, Hispanic, American Indian/Alaska Native and Asian/Pacific Islander men. African-American men are twice as likely to die from prostate cancer as white men, according to the American Cancer Society. Prostate cancer risk may also be elevated in Scandinavian men. Historically, incidence in East Asia (Japan and China) has been low. However, when Chinese and Japanese men immigrate to the U.S., they have an increased risk of developing prostate cancer when compared with their native populations.\n\nDiet\n\nMedical research suggests that the diet consumed in industrialized Western countries may be a factor in developing prostate cancer. Consider the following information regarding diet and its effect on the risk for prostate cancer:\n\n• Fat: Some studies suggest that men who eat a high-fat diet, especially if it is high in red meat or high-fat dairy products, may have a greater chance of developing prostate cancer.\n• Fruits and vegetables: Diets high in fruits and vegetables may lower prostate cancer risk, although it is not clear which nutrient(s) may be responsible for this.\n• Carotenoids: Carotenoids, such as lycopenes, have been shown to inhibit the growth of human prostate cancer cells grown in the laboratory. The primary source of lycopenes is processed tomatoes. However, it is not clear if lycopenes affect prostate cancer risk in men.\n\nObesity\n\nMost studies have concluded that obesity does not affect the overall risk of getting prostate cancer. However, obese men may be more likely to develop more aggressive forms of prostate cancer.\n\nEnvironmental Exposures\n\nSome studies indicate an increased risk of prostate cancer in men who are exposed to certain types of chemicals. For example, firefighters are regularly exposed to combustion byproducts while farmers are exposed to agricultural chemicals. Men in these professions may have an increased risk of developing prostate cancer due to chemical exposure.\n\nFamily History\n\nAnother important risk factor is a positive family history. If you have a father or a brother with prostate cancer, your risk of developing the disease is more than doubled, according to the American Cancer Society. The risk is developing prostate cancer is even higher for men with several affected relatives, particularly if the relatives were young at the time of diagnosis."
    },

    {
      "label": "Prostate Cancer Symptoms",
      "response": "Most men are diagnosed before showing symptoms\nn\About 85 percent of prostate cancers are detected during early screening tests, before the patient develops any symptoms. A blood test may show abnormally high or rising prostate-specific antigen (PSA) levels. Or, a physician may detect abnormalities during a routine rectal exam.\n\nSymptoms of Prostate Cancer\n\nThough early warning signs of prostate cancer are rare, sometimes men experience symptoms before they are diagnosed. The severity of symptoms may depend on where the cancer is located in the prostate and how advanced it has become. However, having any of these symptoms does not necessarily mean that you have prostate cancer or that the disease has progressed beyond its early stages.\n\nUrinary Symptoms\n\n• A need to urinate frequently, especially at night \n• Difficulty starting urination or holding back urine \n• A weak or interrupted flow of urine \n• Painful or burning urination \n• Hematuria (blood in the urine) \n\nErectile and Ejaculatory Symptoms\n\n• Difficulty achieving or maintaining an erection \n• Painful ejaculation \n• Blood in the semen \n• Decreased volume of ejaculation (though hydration, diet and frequency of ejaculation are more likely than prostate cancer to impact the volume of fluid) \nLower Extremity Symptoms\n\n• Frequent pain or stiffness in the lower back, hips or upper thighs \n• Swelling in the lower extremities \n\nIf a patient experiences bone pain and swelling in the lower extremities—especially when accompanied by urinary, erectile or ejaculation dysfunction—these could be symptoms of advanced prostate cancer.\n\nWhen to See a Doctor\n\nConsult with your doctor if you experience any of the symptoms discussed on this page particularly if they have been going on for a while. You will need a thorough work-up to determine the underlying cause, which may or may not be prostate cancer.\n\nIt’s important to understand that other diseases or disorders can share these same symptoms. Benign prostatic hyperplasia (BPH), also called enlargement of the prostate, and are quite common. Men with these benign conditions can experience symptoms more often and more severely than men with prostate cancer.\n\nErectile dysfunction is relatively common, especially as one ages, and can also have causes unrelated to prostate cancer, such as smoking or cardiovascular disease. Experiencing a lower amount of fluid during ejaculation can be related to something as simple as diet or dehydration.\n\nIt’s important to keep track of your symptoms, determining what’s normal or abnormal for your own body. If you are worried about a particular symptom, or if it’s interfering with a relationship, you should discuss your concerns with your primary care physician."
    },

    {
      "label": "Prostate Cancer Prognosis",
      "response": "In general, the earlier prostate cancer is caught, the more likely it is for a man to get successful treatment and remain disease-free. The overall prognosis for prostate cancer is among the best of all cancers.\nIt’s important to keep in mind that survival rates and likelihood of recurrence are based on averages and won’t necessarily reflect any individual patient outcome. The prognosis for prostate cancer depends on many factors. Your doctor will offer insight and advice based on your specific disease.\n\nHigh Cure Rates for Local and Regional Prostate Cancers\n\nApproximately 80 percent to 85 percent of all prostate cancers are detected in the local or regional stages, which represent stages I, II and III. Many men diagnosed and treated at the local or regional stages will be disease-free after five years.\nn\Stage IV Prostate Cancer Prognosis\n\nProstate cancers detected at the distant stage have an average five-year survival rate of 28 percent, which is much lower than local and regional cancers of the prostate. This average survival rate represents stage IV prostate cancers that have metastasized (spread) beyond nearby areas to lymph nodes, organs or bones in other parts of the body.\n\nLong-Term Prognosis\n\nBecause most prostate cancers are diagnosed with early screening measures and are curable, the average long-term prognosis for prostate cancer is quite encouraging. The figures below, provided by the American Cancer Society, represent the average relative survival rate of all men with prostate cancer. They represent a patient’s chances of survival after a specified number of years as compared with the larger population’s chances of survival during that same timeframe. Since these numbers include all stages of prostate cancer, they will not accurately predict an individual man’s prognosis.\n\n• 5-year relative survival rate of nearly 100 percent: Five years after diagnosis, the average prostate cancer patient is about as likely as a man without prostate cancer to still be living. \n• 10-year relative survival rate of 98 percent: Ten years after diagnosis, the average prostate cancer patient is just 2 percent less likely to survive than a man without prostate cancer. \n\n• 15-year relative survival rate of 95 percent: Fifteen years after diagnosis, the average prostate cancer patient is 5 percent less likely to survive than a man without prostate cancer. \n\nRecurrence\n\nEven if your cancer was treated with an initial primary therapy (surgery or radiation), there is always a possibility that the cancer will reoccur. About 20 percent to-30 percent of men will relapse (have the cancer detected by a PSA blood test) after the five-year mark, following the initial therapy. The likelihood of recurrence depends on the extent and aggressiveness of the cancer.\n\nSeveral online tools have been assembled to help predict the likelihood of recurrence. Try inputting your own information into the Han Tables prediction tool.\n\nThe Role of PSA\n\nProstate cancer recurrence is determined by rising PSA levels following treatment. Use the following guide to gauge recurrence:\n\nClinicians use the change in PSA over time as a marker for the aggressiveness of the recurrence. After a certain amount of time, the cancer will become visible radiographically (e.g., via CT scans or bone scans). Prostate cancer can recur locally in the pelvis or elsewhere in the body. The location of the recurrence is determined by these radiographic scans.\n\n• After surgery, PSA levels should drop to zero. When PSA levels rise above 0.2 ng/mL, the cancer is considered recurrent. \n• After treatment with radiation, PSA levels rarely drops completely to zero. However, the PSA should level out at a low number, which is called the nadir. When PSA rises 2 points from its lowest value, the cancer is considered recurrent. "
    },

    // {
    //   "label": "Prostate Cancer Statistics",
    //   "response": "Prostate cancer is the second-most diagnosed cancer in men.  About 80 percent of prostate cancers are diagnosed at a localized stage, which means that the cancer hasn’t spread outside of the prostate. The average age at the time of prostate cancer diagnosis is about 66."
    // },

    ];

  static const List<Map<String, String>> faqs = [
    {
      "label": "What are the four prostate cancer stages?",
      "response": "For prostate cancer there are 4 stages. Often the stages 1 to 4 are written as the Roman numerals I, II, III and IV. Generally, the higher the stage number, the more the cancer has spread. The stages can be further divided into A, B or C."
    },
    {
      "label": "How long can someone live prostate cancer without treatment?",
      "response": "Almost 100% of men who have early-stage prostate cancer will survive more than 5 years after diagnosis. Men with advanced prostate cancer or whose cancer has spread to other regions have lesser survival rates. About one-third will survive for 5 years after diagnosis."
    },

    {
      "label": "How do you know how fast my cancer is growing?",
      "response": "If you have low to intermediate risk prostate cancer, there are genomic tests that can better inform on the risk of developing a more aggressive cancer. These tests look at the DNA of your actual cancer cells to compare them to other men, to come up with an individual risk profile for you and your cancer. None of it is 100%, but it does provide the best evidence based on your specific prostate cancer."
    },
    {
      "label": "Is prostate cancer sexually transmitted?",
      "response": "No, there's no risk to your partner from prostate cancer. There's no risk with sexual activity. Prostate cancer is internal and does not spread through contact."
    },

    {
      "label": "Is prostate cancer hereditary?",
      "response": "Some prostate cancers are hereditary. If you have prostate cancer, all of your first-degree relatives -- parent, sibling, or child -- are at an elevated risk for developing prostate cancer. If you are diagnosed when you're young in your 40s and develop prostate cancer, you may want to consider a genetic consultation to see if there are any known genetic risk factors that you and your family may have."
    },
    {
      "label": "What can I do to prevent or slow prostate cancer? ",
      "response": "There's no one thing. A healthy lifestyle with 30 minutes of exercise a day has shown to be protective. Also, diet is important by limiting red meat and eating fresh fruits and vegetables, low in sugars and carbohydrates. I would advise following a heart-healthy diet as research has shown that it is healthy for the prostate as well."
    },

    {
      "label": "Is there a risk of cancer spreading if I have a biopsy of my prostate? ",
      "response": "No, prostate cancer doesn't spread that way. And there have been millions of biopsies throughout the world and never a single incident of it being spread that way has ever been reported."
    },
    {
      "label": "When should I stop screening for prostate cancer?",
      "response": "Not all prostate cancer is lethal and not all prostate cancer requires treatment. As a general rule of thumb, if your life expectancy is 10 years or less, you probably will not have to worry about prostate cancer affecting you in your lifetime. However, you should discuss this with your care team to determine how it specifically relates to you."
    },

    {
      "label": "How can I be the best partner to my medical team?",
      "response": "The best thing you can do is be open and honest. Your medical team is here to be a resource to you, to support you and to help you in any way they can. Never hesitate to ask your medical team any questions or concerns that you have being informed makes all the difference. Thank you for your time and we wish you well."
    },
    ];


  static const List<Map<String, dynamic>> assesments = [
    {
      "Question": "How old are you?",
      "options": [
        "Under 45",
        "45-49",
        "50-54",
        "55 or older"
      ]
    },

    {
      "Question": "Did any of your close family members (brother, father, uncle) suffer from prostate cancer in the past or now?",
      "options": [
        "No (or don’t know)",
        "Yes",
      ]
    },

    {
      "Question": "Black men are more at a risk of prostate cancer. Do you have black or mixed black ethnicity?",
      "options": [
        "No",
        "Yes",
      ]
    },


    {
      "Question": "How often have you had a sensation of not emptying your bladder completely after you have finished urinating?",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },

    {
      "Question": "How often have you had to urinate again less than 2 hours after you have finished urinating?",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },

    {
      "Question": "How often have you found it difficult to hold back urinating after you have felt the need? ",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },

    {
      "Question": "How often have you noticed a reduction in the strength and force in your urinary stream?",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },

    {
      "Question": "How often have you had to push or strain to begin urinating?",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },

    {
      "Question": "From the time you go to bed at night until you rise up in the morning, how many time do you need to get up to urinate?",
      "options": [
        "Never",
        "About 1 time in 5",
        "About 2 times in 3",
        "Almost always",
      ]
    },
    ];
  

  static final List<Map<String, dynamic>> userInfo = [
    {
      "username":"Mugambe Timothy Collins",
      "email":"timothycollins506@gmail.com",
      "phone":"+256756534235"
    },

    {
      "username":"Nakalema Grace",
      "email":"nakalemagrace@gmail.com",
      "phone":"+25674563123"
    },

    {
      "username":"Nassiwa Margaret  Musoke",
      "email":"nakelema@gmail.com",
      "phone":"+256789360985"
    },

    {
      "username":"Kayiwa Yusufu",
      "email":"yusufu@gmail.com",
      "phone":"+256898892212"
    },

    {
      "username":"Obote Kevin",
      "email":"obote@gmail.com",
      "phone":"+256098789675"
    }
  ];
  
}