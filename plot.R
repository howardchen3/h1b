library(sm)

df = read.csv("Documents/H1BSalary.csv")

# Remove titles with <=5 salaries
all.title = table(df$JOB.TITLE)
top.title = names(all.title)[all.title>5]
df2 = df[df$JOB.TITLE %in% top.title,]
df2$JOB.TITLE = droplevels(df2$JOB.TITLE)
attach(df2)

# Plot It
svg()
sm.density.compare(BASE.SALARY, JOB.TITLE)
legend("topright", levels(JOB.TITLE), fill=2+(0:nlevels(JOB.TITLE)))
dev.off()
