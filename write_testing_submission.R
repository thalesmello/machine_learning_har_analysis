submission <- read.csv("pml-testing.csv")
submissionId <- submission$problem_id
submission <- submission[, -nzv]
submission <- subset(submission, select = -c(X, user_name, raw_timestamp_part_1, raw_timestamp_part_2, cvtd_timestamp, num_window, problem_id))
knnSubmission <- predict(knnObject, newdata = submission)
pcaSubmission <- predict(pcaObject, newdata = knnSubmission)
submissionPrediction <- predict(model, newdata = pcaSubmission)
submissionPrediction

