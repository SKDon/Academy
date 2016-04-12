﻿namespace MvcEssentials.Data.Migrations
{
    using System.Data.Entity.Migrations;
    using System.Linq;
    using Microsoft.AspNet.Identity;
    using Microsoft.AspNet.Identity.EntityFramework;

    using MvcEssentials.Data.Models;

    public sealed class Configuration : DbMigrationsConfiguration<MvcEssentials.Data.ApplicationDbContext>
    {
        public Configuration()
        {
            this.AutomaticMigrationsEnabled = false;
            this.AutomaticMigrationDataLossAllowed = false;
        }

        protected override void Seed(ApplicationDbContext context)
        {
            ////  This method will be called after migrating to the latest version.

            ////  You can use the DbSet<T>.AddOrUpdate() helper extension method
            ////  to avoid creating duplicate seed data. E.g.
            ////
            ////    context.People.AddOrUpdate(
            ////      p => p.FullName,
            ////      new Person { FullName = "Andrew Peters" },
            ////      new Person { FullName = "Brice Lambson" },
            ////      new Person { FullName = "Rowan Miller" }
            ////    );

            if (!context.Users.Any())
            {
                var roleStore = new RoleStore<IdentityRole>(context);
                var roleManager = new RoleManager<IdentityRole>(roleStore);
                var userStore = new UserStore<ApplicationUser>(context);
                var userManager = new UserManager<ApplicationUser>(userStore);

                // Add missing roles
                var role = roleManager.FindByName("Admin");
                if (role == null)
                {
                    role = new IdentityRole("Admin");
                    roleManager.Create(role);
                }

                // Create test users
                var user = userManager.FindByName("admin");
                if (user == null)
                {
                    var newUser = new ApplicationUser()
                    {
                        UserName = "admin@admin.bg",
                        Email = "admin@admin.bg",
                        PhoneNumber = "5551234567",
                    };
                    userManager.Create(newUser, "Password1");
                    userManager.SetLockoutEnabled(newUser.Id, false);
                    userManager.AddToRole(newUser.Id, "Admin");
                }
            }

            try
            {
                if (!context.NewsArticles.Any())
                {
                    string title = "Jackie Robinson: A 'great American,' a complicated man";
                    string content = " The story of Jackie Robinson isn't just the story of a pioneering baseball player. It's also, says Ken Burns, a story that says much about race and America -- as well as the complicated man at its center. Robinson is the subject of \"Jackie Robinson,\" a documentary from celebrated filmmaker Burns, his daughter Sarah Burns and her husband, David McMahon.It airs Monday and Tuesday on PBS. Robinson's life paralleled, and sometimes intersected with, events in the life of the country. He was born in the Jim Crow South, the son of sharecroppers and the grandson of a slave. He grew up in California, the state to which so many would migrate in the coming decades. He served in the military-- and fought its discrimination.He played in New York in the 1950s when it was \"the capital of baseball.\" He was a Republican who attended the 1964 GOP convention but then supported Democrats as the political parties' makeup changed. He struggled with the social tumult of the 1960s, a conflict poignantly reflected in his relationship with his son, a Vietnam War veteran who overcame a drug problem only to die in a car accident. He had a rich and devoted marriage to his wife, Rachel, his partner and sounding board. In other words, there's a much bigger picture than the one you'll find on a baseball card. added,\"In some ways, knowing the full, complex picture of Jackie gives you a greater perspective on what's going on today, from Trayvon Martin and Ferguson to the presidency and even the rollback of some of the essential liberties given to African-Americans in the mid-'60s that now seem to be in jeopardy.";

                    for (int i = 0; i <= 50; i++)
                    {
                        var article = new NewsArticle()
                        {
                            Title = $"{i} {title}",
                            Content = content
                        };

                        context.NewsArticles.Add(article);
                    }

                    context.SaveChanges();
                }
            }
            catch (System.Exception ex)
            {
                throw;
            }
        }
    }
}
