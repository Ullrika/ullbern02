# Meta analysis 

What is the data we have are estimates with associated estimation errors? This is a typical situation where there is a grouping of data.  

## Eight schools

```{r}
library(readr)
df_8 <- read_csv("../data/eight_schools.csv")
```

```{r}
mean(df_8$treatment_effect)
```


```{r}
ggplot(df_8,aes(x=school,y=treatment_effect)) +
  geom_point(colour="darkred",size = 2) +
  geom_errorbar(aes(ymin=treatment_effect-2*treatment_stddev,ymax=treatment_effect+2*treatment_stddev), width = 0.2) +
  geom_hline(aes(yintercept=0),linetype="dashed",colour="#3366FF") +
  ylab("treatment effect (+/- 2 stddev)")
```



```{r}
mod <- lm(treatment_effect ~ 1,data=df_8)
fmod <- lm(treatment_effect ~ 1, weights = 1/treatment_stddev^2, data=df_8)
sf <- summary(fmod)
sf$coefficients
```


```{r}
rmod <- lme4::lmer(treatment_effect ~ 1 + 1|school, weights = 1/treatment_stddev^2, data=df_8,control=lmerControl(check.nobs.vs.nlev="ignore", check.nobs.vs.nRE="ignore"))
sr <- summary(rmod)
sr$varcor
sr$coefficients
```


```{r}
r2mod <- lme4::lmer(treatment_effect ~  1|school, weights = 1/treatment_stddev^2, data=df_8)
sr <- summary(r2mod)
sr$varcor
sr$coefficients
```