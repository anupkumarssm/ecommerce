package com.learn.edu;

import org.sitemesh.builder.SiteMeshFilterBuilder;
import org.sitemesh.config.ConfigurableSiteMeshFilter;

public class CustomSiteMeshFilter extends ConfigurableSiteMeshFilter {
    @Override
    protected void applyCustomConfiguration(SiteMeshFilterBuilder builder) {
          // Assigning default decorator if no path specific decorator found
            builder.addDecoratorPath("/*", "/WEB-INF/sitemesh/decorator.jsp")
           // .addDecoratorPath("/loginurl", "/WEB-INF/sitemesh/logindecorator.jsp")
         
     .addExcludedPath("/get-question-answer-by-sub-category")
     .addExcludedPath("/get-question-list")
     .addExcludedPath("/get-question-modal");
            
    }
}