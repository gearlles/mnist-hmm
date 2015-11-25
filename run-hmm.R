run_hmm <- function()
{
  States = c('0','1','2','3','4','5','6','7','8','9')
  Symbols = 1:256 #Quantidade de estados internos
  hmm = initHMM(States, Symbols)
  sim = simHMM(hmm, 784)
  
  observations = c()
  
  i = 1 
  size = train$n + 1
  
  while(i < size)
  {
    if(train$y[i] == 0)
    {
      observations = c(observations, c(train$x[i, 1:784]))
    }
    i = i + 1
  }
  
  #length(observations)
  observations
  
  #bw = baumWelch(hmm, observations)
  
  #bw = baumWelch(hmm, observations)
 # bw
  #vit = viterbi(hmm, sim$observation)
  #vit
}

increment_vector <- function(vector)
{
  size <- length(vector) + 1
  i = 1;
  while(i < size)
  {
    vector[i] <- vector[i] + 1
    i = i + 1
  }
}