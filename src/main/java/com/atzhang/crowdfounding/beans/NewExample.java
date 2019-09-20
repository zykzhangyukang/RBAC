package com.atzhang.crowdfounding.beans;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NewExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NewExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andNewsidIsNull() {
            addCriterion("newsID is null");
            return (Criteria) this;
        }

        public Criteria andNewsidIsNotNull() {
            addCriterion("newsID is not null");
            return (Criteria) this;
        }

        public Criteria andNewsidEqualTo(Integer value) {
            addCriterion("newsID =", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidNotEqualTo(Integer value) {
            addCriterion("newsID <>", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidGreaterThan(Integer value) {
            addCriterion("newsID >", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidGreaterThanOrEqualTo(Integer value) {
            addCriterion("newsID >=", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidLessThan(Integer value) {
            addCriterion("newsID <", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidLessThanOrEqualTo(Integer value) {
            addCriterion("newsID <=", value, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidIn(List<Integer> values) {
            addCriterion("newsID in", values, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidNotIn(List<Integer> values) {
            addCriterion("newsID not in", values, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidBetween(Integer value1, Integer value2) {
            addCriterion("newsID between", value1, value2, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewsidNotBetween(Integer value1, Integer value2) {
            addCriterion("newsID not between", value1, value2, "newsid");
            return (Criteria) this;
        }

        public Criteria andNewstitleIsNull() {
            addCriterion("newsTitle is null");
            return (Criteria) this;
        }

        public Criteria andNewstitleIsNotNull() {
            addCriterion("newsTitle is not null");
            return (Criteria) this;
        }

        public Criteria andNewstitleEqualTo(String value) {
            addCriterion("newsTitle =", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleNotEqualTo(String value) {
            addCriterion("newsTitle <>", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleGreaterThan(String value) {
            addCriterion("newsTitle >", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleGreaterThanOrEqualTo(String value) {
            addCriterion("newsTitle >=", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleLessThan(String value) {
            addCriterion("newsTitle <", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleLessThanOrEqualTo(String value) {
            addCriterion("newsTitle <=", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleLike(String value) {
            addCriterion("newsTitle like", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleNotLike(String value) {
            addCriterion("newsTitle not like", value, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleIn(List<String> values) {
            addCriterion("newsTitle in", values, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleNotIn(List<String> values) {
            addCriterion("newsTitle not in", values, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleBetween(String value1, String value2) {
            addCriterion("newsTitle between", value1, value2, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewstitleNotBetween(String value1, String value2) {
            addCriterion("newsTitle not between", value1, value2, "newstitle");
            return (Criteria) this;
        }

        public Criteria andNewscontentIsNull() {
            addCriterion("newsContent is null");
            return (Criteria) this;
        }

        public Criteria andNewscontentIsNotNull() {
            addCriterion("newsContent is not null");
            return (Criteria) this;
        }

        public Criteria andNewscontentEqualTo(String value) {
            addCriterion("newsContent =", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentNotEqualTo(String value) {
            addCriterion("newsContent <>", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentGreaterThan(String value) {
            addCriterion("newsContent >", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentGreaterThanOrEqualTo(String value) {
            addCriterion("newsContent >=", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentLessThan(String value) {
            addCriterion("newsContent <", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentLessThanOrEqualTo(String value) {
            addCriterion("newsContent <=", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentLike(String value) {
            addCriterion("newsContent like", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentNotLike(String value) {
            addCriterion("newsContent not like", value, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentIn(List<String> values) {
            addCriterion("newsContent in", values, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentNotIn(List<String> values) {
            addCriterion("newsContent not in", values, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentBetween(String value1, String value2) {
            addCriterion("newsContent between", value1, value2, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewscontentNotBetween(String value1, String value2) {
            addCriterion("newsContent not between", value1, value2, "newscontent");
            return (Criteria) this;
        }

        public Criteria andNewsdateIsNull() {
            addCriterion("newsDate is null");
            return (Criteria) this;
        }

        public Criteria andNewsdateIsNotNull() {
            addCriterion("newsDate is not null");
            return (Criteria) this;
        }

        public Criteria andNewsdateEqualTo(Date value) {
            addCriterion("newsDate =", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateNotEqualTo(Date value) {
            addCriterion("newsDate <>", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateGreaterThan(Date value) {
            addCriterion("newsDate >", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateGreaterThanOrEqualTo(Date value) {
            addCriterion("newsDate >=", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateLessThan(Date value) {
            addCriterion("newsDate <", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateLessThanOrEqualTo(Date value) {
            addCriterion("newsDate <=", value, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateIn(List<Date> values) {
            addCriterion("newsDate in", values, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateNotIn(List<Date> values) {
            addCriterion("newsDate not in", values, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateBetween(Date value1, Date value2) {
            addCriterion("newsDate between", value1, value2, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdateNotBetween(Date value1, Date value2) {
            addCriterion("newsDate not between", value1, value2, "newsdate");
            return (Criteria) this;
        }

        public Criteria andNewsdescIsNull() {
            addCriterion("newsDesc is null");
            return (Criteria) this;
        }

        public Criteria andNewsdescIsNotNull() {
            addCriterion("newsDesc is not null");
            return (Criteria) this;
        }

        public Criteria andNewsdescEqualTo(String value) {
            addCriterion("newsDesc =", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescNotEqualTo(String value) {
            addCriterion("newsDesc <>", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescGreaterThan(String value) {
            addCriterion("newsDesc >", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescGreaterThanOrEqualTo(String value) {
            addCriterion("newsDesc >=", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescLessThan(String value) {
            addCriterion("newsDesc <", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescLessThanOrEqualTo(String value) {
            addCriterion("newsDesc <=", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescLike(String value) {
            addCriterion("newsDesc like", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescNotLike(String value) {
            addCriterion("newsDesc not like", value, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescIn(List<String> values) {
            addCriterion("newsDesc in", values, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescNotIn(List<String> values) {
            addCriterion("newsDesc not in", values, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescBetween(String value1, String value2) {
            addCriterion("newsDesc between", value1, value2, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsdescNotBetween(String value1, String value2) {
            addCriterion("newsDesc not between", value1, value2, "newsdesc");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathIsNull() {
            addCriterion("newsImagePath is null");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathIsNotNull() {
            addCriterion("newsImagePath is not null");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathEqualTo(String value) {
            addCriterion("newsImagePath =", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathNotEqualTo(String value) {
            addCriterion("newsImagePath <>", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathGreaterThan(String value) {
            addCriterion("newsImagePath >", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathGreaterThanOrEqualTo(String value) {
            addCriterion("newsImagePath >=", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathLessThan(String value) {
            addCriterion("newsImagePath <", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathLessThanOrEqualTo(String value) {
            addCriterion("newsImagePath <=", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathLike(String value) {
            addCriterion("newsImagePath like", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathNotLike(String value) {
            addCriterion("newsImagePath not like", value, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathIn(List<String> values) {
            addCriterion("newsImagePath in", values, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathNotIn(List<String> values) {
            addCriterion("newsImagePath not in", values, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathBetween(String value1, String value2) {
            addCriterion("newsImagePath between", value1, value2, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewsimagepathNotBetween(String value1, String value2) {
            addCriterion("newsImagePath not between", value1, value2, "newsimagepath");
            return (Criteria) this;
        }

        public Criteria andNewslooknumIsNull() {
            addCriterion("newslooknum is null");
            return (Criteria) this;
        }

        public Criteria andNewslooknumIsNotNull() {
            addCriterion("newslooknum is not null");
            return (Criteria) this;
        }

        public Criteria andNewslooknumEqualTo(Integer value) {
            addCriterion("newslooknum =", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumNotEqualTo(Integer value) {
            addCriterion("newslooknum <>", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumGreaterThan(Integer value) {
            addCriterion("newslooknum >", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumGreaterThanOrEqualTo(Integer value) {
            addCriterion("newslooknum >=", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumLessThan(Integer value) {
            addCriterion("newslooknum <", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumLessThanOrEqualTo(Integer value) {
            addCriterion("newslooknum <=", value, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumIn(List<Integer> values) {
            addCriterion("newslooknum in", values, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumNotIn(List<Integer> values) {
            addCriterion("newslooknum not in", values, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumBetween(Integer value1, Integer value2) {
            addCriterion("newslooknum between", value1, value2, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andNewslooknumNotBetween(Integer value1, Integer value2) {
            addCriterion("newslooknum not between", value1, value2, "newslooknum");
            return (Criteria) this;
        }

        public Criteria andSendUserIdIsNull() {
            addCriterion("send_user_id is null");
            return (Criteria) this;
        }

        public Criteria andSendUserIdIsNotNull() {
            addCriterion("send_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andSendUserIdEqualTo(Integer value) {
            addCriterion("send_user_id =", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdNotEqualTo(Integer value) {
            addCriterion("send_user_id <>", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdGreaterThan(Integer value) {
            addCriterion("send_user_id >", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("send_user_id >=", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdLessThan(Integer value) {
            addCriterion("send_user_id <", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdLessThanOrEqualTo(Integer value) {
            addCriterion("send_user_id <=", value, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdIn(List<Integer> values) {
            addCriterion("send_user_id in", values, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdNotIn(List<Integer> values) {
            addCriterion("send_user_id not in", values, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdBetween(Integer value1, Integer value2) {
            addCriterion("send_user_id between", value1, value2, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andSendUserIdNotBetween(Integer value1, Integer value2) {
            addCriterion("send_user_id not between", value1, value2, "sendUserId");
            return (Criteria) this;
        }

        public Criteria andTypeIdIsNull() {
            addCriterion("type_id is null");
            return (Criteria) this;
        }

        public Criteria andTypeIdIsNotNull() {
            addCriterion("type_id is not null");
            return (Criteria) this;
        }

        public Criteria andTypeIdEqualTo(Integer value) {
            addCriterion("type_id =", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotEqualTo(Integer value) {
            addCriterion("type_id <>", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThan(Integer value) {
            addCriterion("type_id >", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("type_id >=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThan(Integer value) {
            addCriterion("type_id <", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdLessThanOrEqualTo(Integer value) {
            addCriterion("type_id <=", value, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdIn(List<Integer> values) {
            addCriterion("type_id in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotIn(List<Integer> values) {
            addCriterion("type_id not in", values, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdBetween(Integer value1, Integer value2) {
            addCriterion("type_id between", value1, value2, "typeId");
            return (Criteria) this;
        }

        public Criteria andTypeIdNotBetween(Integer value1, Integer value2) {
            addCriterion("type_id not between", value1, value2, "typeId");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}