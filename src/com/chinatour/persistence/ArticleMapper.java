/*
 * Copyright 2005-2013 shopxx.net. All rights reserved.
 * Support: http://www.shopxx.net
 * License: http://www.shopxx.net/license
 */
package com.chinatour.persistence;


import com.chinatour.entity.Article;
import org.springframework.stereotype.Repository;


/**
 * Dao - 文章
 *
 * @author SHOP++ Team
 * @version 3.0
 */
@Repository
public interface ArticleMapper extends BaseMapper<Article, Long> {

}